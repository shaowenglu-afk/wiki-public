---
title: "日志哨兵：AI替你值夜班"
source: "https://mp.weixin.qq.com/s/bVQRrjg7XWhkD8WSZt2tYA"
author:
  - "[[家园]]"
published:
created: 2026-06-30
description: "凌晨两点，告警群疯狂震动。你强打精神点开，满屏的ERROR日志像天书一样摊在面前。"
tags:
  - "clippings"
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。

家园 家园叮咚 *2026年6月28日 13:37*

凌晨两点，告警群疯狂震动。你强打精神点开，满屏的ERROR日志像天书一样摊在面前。能不能让AI先读一遍日志，只筛选出真正需要人处理的问题？本文基于Kubebuilder，从0到1拆解 恒御·日志哨兵（HengGuardLogSentinel）的完整实现，包含核心Controller源码、镜像构建、CRD部署、控制台实战输出，以及 OpenAI / Ollama 双模型切换方案。

一、痛点：我们不是在写告警规则，是在写"噪音过滤器"

在 Kubernetes 集群里，日志每天都在以 GB 甚至 TB 级别增长。传统的可观测性方案是：

采集日志 → Grafana 配置告警面板 → Alertmanager 触发通知 → 运维人工排查

这个链路的问题很明显： **它只解决了"看见"，没有解决"看懂"** 。

- 一条 JSON Parse Error 是客户端脏数据，还是服务端序列化 bug？
- Kafka consumer lagging 是临时流量峰值，还是消费者真的挂掉了？
- 满屏的 ERROR 里，哪些需要立即起床处理，哪些只是可以明天再看的信息？

我们的目标不是减少日志，而是减少"无效告警对人注意力的消耗"。

让 AI 充当第一响应分析师，只把"需要人决策"的问题推送出来——这就是日志哨兵的设计初衷。

二、架构全景：一条 CRD 驱动的智能闭环

先看完整的数据链路如下：

```sql
┌─────────────┐│  Application │  ← 业务应用 Pod，产生 stdout/stderr 日志│   (应用日志)  │└──────┬──────┘       │ 日志输出       ▼┌─────────────┐│  Loki Agent │  ← Promtail / Grafana Agent 采集日志│  (日志采集器) │└──────┬──────┘       │ 推送日志       ▼┌─────────────┐│    Loki     │  ← 日志存储与索引│   (日志库)   │└──────┬──────┘       │ Get Log (LogQL查询)       ▼┌─────────────┐│   Operator  │  ← 日志哨兵核心：定时查询、增量分析│  (LogSentinel)│└──────┬──────┘       │ LLM API       ▼┌─────────────┐│ OpenAI/Ollama│ ← AI 大模型诊断分析│   (AI推理)   │└──────┬──────┘       │ 返回分析结果       ▼┌─────────────┐│   判定逻辑   │  ← 检查是否包含 [feishu] 标记│  (严重等级?) │└──────┬──────┘       │   是  │  否   │   │   ▼   ▼┌────────┐  ┌────────┐│ 飞书通知 │  │ 静默记录 ││(Webhook)│  │(Status)│└────────┘  └────────┘
```

**说明** ：应用日志产生 → Agent 采集 → Loki 存储 属于可观测性基础设施，这里不展开细节。后续我会发布专门文章覆盖 Promtail 采集与 Loki 部署。 **本文重点在 Loki 之后的智能分析环节。**

**日志哨兵的核心三步：**

- 采集：Operator 从 Loki 通过 LogQL 拉取指定服务的错误日志；
- 诊断：将日志原文发送给 LLM（支持 OpenAI 或私有化 Ollama），由 AI 进行根因分析和分级判定；
- 通知：若 AI 判断为"严重"并在返回中标记 \[feishu\]，则通过飞书 Webhook 推送到运维群。

**整个流程由用户通过一条 Kubernetes CRD 声明式配置，无需改动业务代码，完全云原生。**

## 三、可观测性底座：Grafana + Loki + Prometheus

在搭建日志哨兵之前，我们的集群已经部署了完整的可观测性栈：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/okUvs4OkmvvGLKYaZgANogeG1Ba42VSzhlaict3JlZAPD2K3bT5oIwBpvBZ1L61VZY3kmSl0V00GW38iayZcxqFI45DWIUdFCMtw9Q61icHmlc/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=0)
- Loki：日志采集与查询
- Prometheus：指标采集
- Alertmanager：告警路由

这套基础设施是日志哨兵的"眼睛"——没有 Loki 的统一日志采集，Operator 就无从查起；没有 Grafana 的可视化，我们就无法快速验证日志是否被正确采集。

![图片](https://mmbiz.qpic.cn/mmbiz_png/okUvs4OkmvuFR8LIz59LX2Oc34JNCia5Y1PPLUK23U8y4Jnsh6EM6AkvDnOD7v3mtnqFiaxxVpOT9AWSXARYdO8T2OySlw4oaqadTychCCTSQ/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=1)

Grafana 中预置了 Kubernetes 官方 Dashboard（kubernetes-mixin），包括 API Server、计算资源、CoreDNS 等，形成了 Metrics + Logs 的完整观测面。

四、CRD 设计：把"日志分析任务"抽象为 K8s 资源

Kubebuilder 的核心价值在于让我们能用声明式的方式扩展 Kubernetes API。在日志哨兵中，我们定义了 LogRule 这个 CRD：

```makefile
apiVersion: sentinel.hengops.io/v1kind: LogRulemetadata:  name: logrule-samplespec:  lokiURL: "http://<loki-host>:31000"  lokiPromQL: '{app="logsentinel"} |= "ERROR"'  llmEndpoint: "https://vip.apiyi.com/v1"  llmToken: "sk-xxx"  llmModel: "gpt-4o"  feishuWebhook: "https://open.feishu.cn/..."
```

**字段设计背后的思考：**

| 字段 | 设计 | 意图 |
| --- | --- | --- |
| ``` lokiURL / ``` | 数据源配置 | 直接复用 Loki 的 LogQL 语法 |
| ``` llmEndpoint ``` | AI 服务配置 | 同时支持 OpenAI 兼容接口和私有化 Ollama，兼顾公网便利与数据安全 |
| feishuWebhook | 通知渠道 | 一条 CRD 就是一个完整的"监控-分析-通知"闭环 |

****⚠️ 生产提示** ：建议将**

```
llmToken
```
**和
```
feishuWebhook
```
通过Secret 卷挂载，避免明文存储。**

五、核心实现：Controller 源码拆解

这是整个系统的引擎。以下是从项目中提取的核心

```
Reconcile
```
**Kubebuilder + controller-runtime**

```go
func (r *LogRuleReconciler) Reconcile(ctx context.Context, req ctrl.Request) (ctrl.Result, error) {    logger := log.FromContext(ctx)    var LogSentinel logv1.LogRule    if err := r.Get(ctx, req.NamespacedName, &LogSentinel); err != nil {        return ctrl.Result{}, client.IgnoreNotFound(err)    }
    // 1. 计算查询时间范围：基于 Status.PreTimeStamp 做增量查询    currentTime := time.Now().Unix()    preTimeStamp := LogSentinel.Status.PreTimeStamp    var preTime int64    if preTimeStamp == "" {        preTime = currentTime - 5    } else {64
    }
    endTime := currentTime * 10000000001000000000

    // 2. 构造 Loki query_range 请求    lokiURL := fmt.Sprintf("%s/loki/api/v1/query_range?query=%s&start=%d&end=%d",        LogSentinel.Spec.LokiURL, url.QueryEscape(lokiQuery), startTime, endTime)
    lokiLogs, err := r.queryLoki(lokiURL)    if err != nil {        return ctrl.Result{}, err    }
    // 3. 如果有日志，调用 LLM 分析    if lokiLogs != "" {        analysisResult, err := r.analyzeLogsWithLLM(            LogSentinel.Spec.LLMEndpoint,            LogSentinel.Spec.LLMToken,            LogSentinel.Spec.LLMModel,            lokiLogs,        )        if err != nil {            return ctrl.Result{}, err        }
        // 4. AI 判断严重，则发送飞书告警        if analysisResult.HasErrors {            err := r.sendFeishuAlert(LogSentinel.Spec.FeishuWebhook, analysisResult.Analysis)            if err != nil {                return ctrl.Result{}, err            }        }    }
    // 5. 更新状态，10秒后再次 Reconcile    LogSentinel.Status.PreTimeStamp = fmt.Sprintf("%d", currentTime)    r.Status().Update(ctx, &LogSentinel)    return ctrl.Result{RequeueAfter: 10 * time.Second}, nil}
```

5.1、增量查询：避免重复扫描

代码中的关键设计是

```
Status.PreTimeStamp。
```
每次 Reconcile 结束后，Operator 会将当前时间戳写回 CRD 的 Status 中。下次循环时，以上次时间为起点，只查询 **新增日志** ，避免重复分析历史数据。

### 5.2、LLM 分析：Prompt 即策略

```css
func (r *LogRuleReconciler) analyzeLogsWithLLM(endpoint, token, model, logs string) (*LLMAnalysisResult, error) {    config := openai.DefaultConfig(token)    config.BaseURL = endpoint    client := openai.NewClientWithConfig(config)
    resp, err := client.CreateChatCompletion(        context.Background(),        openai.ChatCompletionRequest{            Model: model,            Messages: []openai.ChatCompletionMessage{                {                    Role: openai.ChatMessageRoleUser,                    Content: fmt.Sprintf("你现在是一名运维专家，以下日志是从日志系统里获取的日志，"+                        "请分析日志的错误等级，如果遇到严重的问题，例如请求外部系统失败、外部系统故障、"+                        "致命故障、数据库连接错误等严重问题时，请给出简短的建议，"+                        "对于你认为严重需要通知运营人员的，请在返回内容里增加[feishu]标识:\n%s", logs),                },            },        },    )    // ...}
```

### 这里有一个精妙的设计：Prompt 即告警策略。

我们没有在代码里写死"什么算严重"，而是把判断标准交给 Prompt。这意味着：

- 调整告警敏感度，改Prompt即可，不用重新编译代码；
- 不同业务线的LogRule可以使用不同的 Prompt 模板，实现策略隔离。

5.3、智能路由：AI 决定要不要叫醒你

```go
func parseLLMResponse(resp *openai.ChatCompletionResponse) *LLMAnalysisResult {    result := &LLMAnalysisResult{        Analysis: resp.Choices[0].Message.Content,    }    // 简单判断：返回内容是否包含 [feishu] 标记    if strings.Contains(strings.ToLower(result.Analysis), "feishu") {        result.HasErrors = true    }    return result}
```

AI 充当了"第一道关卡"。只有它明确标记了

```
[feishu]
```
，消息才会被推送到飞书。这从根本上解决了"告警疲劳"问题。

六、项目结构与部署：从代码到集群

### 6.1、Kubebuilder 标准项目结构

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/okUvs4OkmvskicmtUxJBDvXoCypUEYjCicR8PBqBSq08vsCKIjXALBY8wY5j0KvhdSvbfj07Brj1ibp9oWMaAELlj1fpZ1HjglLOjK5GbzLMy0/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=2)

### 这是一个标准的 Kubebuilder 项目：

- api/v1/：CRD 的Go类型定义（LogRule Spec + Status）
- config/samples/：示例 CRD YAML
- internal/controller/：Reconciler 核心逻辑
- cmd/：main.go 入口
- Dockerfile：多阶段构建，产出精简镜像

6.2、镜像构建与推送

![图片](https://mmbiz.qpic.cn/mmbiz_png/okUvs4OkmvsV2XMz52zXicoibgFcjU1zibEoxJnGic0v2SbueajJEpezh6tlaL7QjQU62QVZib53VqoIJxicJG5BtviaE588OMicibhHxMkia3eTCicom8/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=3)

```apache
docker build -t registry.cn-hangzhou.aliyuncs.com/little-grass/logsentinel:v1.0.1 .docker push registry.cn-hangzhou.aliyuncs.com/little-grass/logsentinel:v1.0.1
```

采用多阶段构建（

```
golang:1.25-alpine
```
编译 +
```
alpine
```
运行），最终镜像仅 **15.9MB** ，非常轻量。

### 6.3、 部署到 K8s

```makefile
apiVersion: apps/v1kind: Deploymentmetadata:  name: logsentinel  labels:    app: logsentinelspec:  replicas: 1  selector:    matchLabels:      app: logsentinel  template:    metadata:      labels:        app: logsentinel    spec:      containers:        - name: logsentinel          image: registry.cn-hangzhou.aliyuncs.com/little-grass/logsentinel:v1.0.1          imagePullPolicy: Always          ports:            - containerPort: 8080          resources:            requests:              memory: "128Mi"              cpu: "250m"            limits:              memory: "512Mi"              cpu: "500m"---apiVersion: v1kind: Servicemetadata:  name: logsentinel  labels:    app: logsentinelspec:  ports:    - port: 8080      targetPort: 8080      nodePort: 32000  type: NodePort  selector:    app: logsentinel
```

实际部署验证：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/okUvs4Okmvv9C8Evm7UoTU3RN8Tc4LGd8P1VKtTHoejZDtOtBApdZfkINB9DY5kUK6ZbUalKw9aj85uo6UibLE0SnsHQsHJPkrt4MxiaYD7k4/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=4)

Pod 成功运行，日志模拟器开始输出各类业务日志。

### 6.4、CRD 部署：一条命令生效

```bash
kubectl apply -f config/samples/sentinel_v1_logrule.yaml# 输出：logrule.sentinel.hengops.io/logrule-sample created
```

删除和重建同样简单：

```bash
kubectl delete -f config/samples/sentinel_v1_logrule.yamlkubectl apply -f config/samples/sentinel_v1_logrule.yaml
```

这就是声明式配置的魅力： **你的日志分析策略，就是一条 YAML 的事。**

七、日志模拟器：让测试环境也有"真实战场"

为了验证日志哨兵的效果，我编写了一个 Go 模拟器，部署在 K8s 中作为被监控目标。它模拟了一个真实的订单服务，涵盖四大类日志场景：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/okUvs4OkmvtX316RkOHF75YibkdwlqgrC7Q6Miad2ibq1HMF56g2iaRMJTPstEibHERPruj0txqfhCeGzyNv8UsSXvfUfC6RkVrzUibS0XNLOWJU0/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=5)

**这个模拟器的设计意图：**

| 日志类型 | 示例 | 哨兵应如何判断 |
| --- | --- | --- |
| **安全攻击** | SQL 注入、欺诈检测 | 已拦截，标记关注 |
| **系统故障** | 数据库连接池满、下游超时 | 严重影响服务，标记 ``` [feishu] ``` |
| **资源预警** | 内存压力、磁盘 I/O 高 | 持续观察，暂不通知 |
| **数据异常** | JSON 解析错误、数据不匹配 | 视业务影响决定是否通知 |

**日志每 2 秒输出一条，循环往复，模拟真实业务的高频日志场景。**

## 八、实战效果：从 Loki 到飞书的全链路

8.1、Loki侧：原始日志采集

![图片](https://mmbiz.qpic.cn/mmbiz_png/okUvs4OkmvvtIE1dcuAYVA7eGvm48B4Ujm4etmjOb66gBEyF4yMwDMzGyVm9S7Rh3HbFyTbcPfIq3BMicN97KvwibqLOm8VoD6cIl5HVhk9wI/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=6)

在 Grafana Explore 中执行 LogQL：

```javascript
{app="logsentinel"}
```

可以看到logsentinel应用产生的完整日志流，包含\[ERROR\]、\[WARN\]、\[INFO\]三个级别。日志哨兵的查询语句{app="logsentinel"}|="ERROR"会在此基础上进一步过滤，只保留错误级别的日志。

8.2、Operator 控制台：真实的 Reconcile 输出

这是日志哨兵 Pod 的实际运行输出，可以看到完整的处理链路：

![图片](https://mmbiz.qpic.cn/sz_mmbiz_png/okUvs4Okmvv9KAfb1ic8k5YFOE38zOcibia5yXiaAQafkIAHaY6ZwiaSGdFBfbey9HtiaadvBxDYiaS14icOS9N4UqEsicJyKk1I7JgxEZduGl6JsUqI/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=7)

**关键信息解读：**

| 输出字段 | 含义 |
| --- | --- |
| preTimeStamp | 上次查询的时间戳，用于增量查询 |
| startTime / endTime | 纳秒级时间戳，Loki query\_range 的参数 |
| lokiURL | 实际构造的完整查询 URL，便于调试 |
| send logs to LLM | 确认本轮有 ERROR 日志，触发 AI 分析 |

**从控制台可以看到，Operator 每 10 秒执行一次循环，自动计算时间窗口，构造 Loki 查询，拿到结果后立刻发送给 LLM。整个过程无需人工干预。**

8.3、飞书侧：AI 结构化诊断报告

AI 给出的分析非常结构化，不再是满屏的日志原文，而是一份带结论的"运维日报"：

![图片](https://mmbiz.qpic.cn/mmbiz_png/okUvs4Okmvsiaw0GMVVct6JonCJQdHrqbw7JQUMu5npf7FNjPnmcvoHDwdIky3G7G2xLt3QMIhyJs24RO7Am4zHoa1XvpnZ4DJjCoHBrvd78/640?wx_fmt=png&from=appmsg&watermark=1#imgIndex=8)

**日志总结** ： "本次共检测到 3 条 ERROR 日志。其中欺诈交易和 SQL 注入已被系统成功拦截，属于安全告警，未造成服务受损； **但数据库连接池耗尽（500/500）可能导致应用服务停滞，建议优先处理并通知运营团队。**

这就是智能告警的核心价值： **AI 帮你过滤噪音、提炼信息，在飞书中呈现结构化的"运维日报"——运营人员一眼就能识别优先级：安全事件已拦截可跟进，资源耗尽需立即处理。**

## 九、双模型架构：OpenAI 与私有化 Ollama 自由切换

## 在本文的实操中，我们使用了 OpenAI 兼容接口（gpt-4o）进行快速验证。但生产环境或内网环境中，数据不出域是硬要求。

## 在之前的《YIFLOW 潮汐算力池》文章中，我们已经搭建了一套基于 Kong 网关 + Ollama 多实例的私有化推理集群，通过 Kong 做统一入口和负载均衡，后端挂载多个 Ollama 推理节点，实现高可用的私有化 LLM 服务。

## 在日志哨兵中，切换到这套私有化集群只需改两个字段：

```makefile
spec:  llmEndpoint: "http://<kong-gateway>/ollama-chat"  llmToken: "ollama"  llmModel: "qwen2:0.5b"
```

代码层面完全无需改动，因为我们使用的是github.com/sashabaranov/go-openai标准库，天然支持通过BaseURL指向任何 OpenAI 兼容接口。

- 开发测试：用 OpenAI，推理能力强，响应快；
- 生产内网：用 YIFLOW 潮汐算力池（Kong + Ollama），数据不出域，零 API 成本。

想了解这套私有化推理集群的完整搭建过程，包括 Kong 网关配置、Ollama 多实例部署、负载均衡策略等，欢迎关注之前的文章《YIFLOW 潮汐算力池》。

## 十、总结：从"看见日志"到"读懂日志"

恒御·日志哨兵 展示了 **Kubebuilder + LLM** 在云原生可观测性领域的一个典型应用范式：

| 维度 | 传统日志告警 | 恒御·日志哨兵 |
| --- | --- | --- |
| **信息形态** | 原始日志堆叠 | AI 结构化分析报告 |
| **告警噪音** | 每条 ERROR 都告警 | AI 判断后分级通知 |
| **根因定位** | 人工逐条排查 | AI 直接给出分析与建议 |
| **策略调整** | 改代码/改规则 | 改 Prompt 即可 |
| **模型切换** | 无 | OpenAI / Kong+Ollama 集群一键切换 |

## 十一、从"通用 AI"到"企业运维专家"

## 当前日志哨兵方案中，LLM 只能基于自身训练数据进行通用分析。它知道"数据库连接池满"是什么，却不知道你们公司的数据库连接池为什么满。

## 比如：

- 它建议"增加连接池大小"，却不知道你们的实例上限就是 500，真正的问题可能是某个新上线的服务没有正确释放连接；
- 它建议"扩容 Kafka 消费者"，却不知道你们上周刚把 max.poll.records 从 500 调到 50；
- 面对你们自研的中间件、定制化的 RPC 框架报错，它完全无法给出有效建议。

**这就是通用 LLM 的边界：它懂技术，但不懂你的业务。**

### 下一篇文章预告

### 我将引入 RAGFlow，为日志哨兵注入"企业记忆"——把历史故障案例、SRE 排障手册、架构配置规范转化为向量知识库，让 AI 的诊断从"通用猜测"升级为"基于经验的精准判断"。

### 届时，日志哨兵将真正进化为你团队的"资深运维专家"：

**24 小时在线，越用越聪明，且 **只属于你的团队** 。**

## 让 AI 替你值夜班，这只是第一步。

**下一步，让 AI 成为你们团队的"资深运维专家"，24 小时在线，且越用越聪明。**

## ✅ 附：本文核心组件参考资料

- **🛠️ **核心技术栈文档****
	Kubebuilder: https://github.com/kubernetes-sigs/kubebuilder
	Loki: https://github.com/grafana/loki
	Ollama: https://github.com/ollama/ollama
	go-openai: https://github.com/sashabaranov/go-openai
- **🧠 **扩展阅读（云原生 & LLM）****
	K8s-Ops:https://kubernetes.io/docs/concepts/extend-kubernetes/operator/
	Loki-LogQL: https://grafana.com/docs/loki/latest/query/
	RAGFlow: https://github.com/infiniflow/ragflow

## 🎬 配套视频讲解

本文配套的 **《日志哨兵：AI替你值夜班》** 已发布至视频号 —— 1分钟讲透业务痛点、架构设计与实战效果，适合快速建立整体认知。

👉 欢迎关注我的视频号 **【子逸Tech】** ，先看视频再读文章，理解更深。

## ✨ 我们坚持：

**只讲自己跑通的方案，拒绝纸上谈兵。**

**#AIOps #Golang #Kubernetes #Kubebuilder #LLM #Loki #智能运维 #可观测性 #开源项目**
