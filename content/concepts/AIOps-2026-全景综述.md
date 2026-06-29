---
type: concept
created: 2026-06-29
updated: 2026-06-29
tags: [wiki, concept, AIOps, AI-SRE, 可观测性, 2026综述]
sources:
  - '[[sources/27-Dify-vs-OpenClawAIOps领域的"大脑"与"双手"]]'
  - "[[sources/80-Why-AI-Agents-Fail-at-Cloud-RCA-arXiv]]"
  - "[[sources/81-MetaRCA-Generalizable-RCA-Framework-arXiv]]"
  - "[[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]"
  - "[[sources/83-AIOps-Platform-for-Enterprises-portkey]]"
  - "[[sources/84-LATS-RCA-Language-Agent-Tree-Search-arXiv]]"
  - "[[sources/85-AI-SRE-2026-Guide-Augment-Code]]"
  - "[[sources/86-AI-SRE-vs-AIOps-Arvo-AI]]"
  - "[[sources/87-Google-SRE-Agentic-AI]]"
  - "[[sources/88-沙丘智库-AI观测性市场指南]]"
  - "[[sources/89-AI可观测性的三层盲区]]"
  - "[[sources/90-AI可观测性全链路追踪]]"
  - "[[sources/91-AI赋能网络-K8s网络策略智能分析]]"
  - "[[sources/92-为什么监控越来越多故障定位反而越来越慢]]"
  - "[[sources/93-大型集团IT运维智能体平台详细设计方案]]"
  - "[[sources/94-码农视角-AI诊断和修复问题三个反直觉优势]]"
  - "[[sources/95-新浪微博-AI-Agent协作运维落地与演进]]"
  - "[[sources/96-AI观测站-从定位走向调查]]"
  - "[[sources/97-Middleware-OpsAI-AI-SRE-Agent]]"
  - "[[sources/98-Agent可观测性工具爆发五大开源项目]]"
---

# AIOps 2026 全景综述

> **一句话**：2026 H1 AIOps 从 "Gartner 2016 统计 ML 时代" 跨入 "LLM Agent 时代"——**AIOps + AI SRE 双轨制**成为行业共识，可观测性升级为 AI 基础设施。

---

## 🎯 核心范式演进（4 大转变）

| 维度 | 旧范式（2016-2024）| 新范式（2025-2026）|
|---|---|---|
| **AIOps 定位** | 事前去噪（告警聚类）| 事前去噪 + **事后 AI SRE 调查** |
| **可观测目标** | "**问题在哪里**？"（定位）| "**问题为什么 + 怎么修**？"（调查）|
| **执行模式** | 被动响应告警 | 自主投查 + 补救建议 + postmortem 自动起草 |
| **可观测维度** | Logs/Metrics/Traces | + **Prompt / Tool Call / Trace / Token** 四维 |

> **金句**（[[sources/96-AI观测站-从定位走向调查]]）：
> "可观测性正在从'定位'走向'调查'。"

---

## 📊 AIOps vs AI SRE（关键概念辨析）

| 维度 | **AIOps** | **AI SRE** |
|---|---|---|
| 起源 | Gartner 2016 | 2024-2026 |
| 技术 | 统计 ML | LLM Agent |
| 时机 | **事前** | **事后** |
| 输入 | 时序数据 + 告警 | 全栈非结构化（日志/对话/Confluence/code）|
| 产出 | 告警聚合 + 异常检测 | 根因假设 + 补救建议 + postmortem |
| 关系 | **互补，不替代** | 互补 |

来源：[[sources/86-AI-SRE-vs-AIOps-Arvo-AI]]

---

## 🏗️ 标准多 Agent SRE 架构（5 角色）

来自 [[sources/97-Middleware-OpsAI-AI-SRE-Agent]] + [[sources/85-AI-SRE-2026-Guide-Augment-Code]]：

```
                    告警流
                      ↓
            ┌─────────────────┐
            │  Observer Agent │   监听 PagerDuty/Opsgenie
            └────────┬────────┘
                      ↓
            ┌─────────────────┐
            │ Investigation   │   ReAct 循环
            │     Agent       │   并行调用 LogQL/PromQL/deploy API
            └────────┬────────┘
                      ↓
            ┌─────────────────┐
            │  Reasoning      │   证据 → 根因假设排序
            │     Agent       │   + 置信度
            └────────┬────────┘
                      ↓
            ┌─────────────────┐
            │  Action Agent   │   HITL 审批 → 执行
            │  （rollback/    │   安全补救
            │   scale/patch） │
            └────────┬────────┘
                      ↓
            ┌─────────────────┐
            │ Reporter Agent  │   Markdown postmortem
            │                 │   + Jira/Linear 更新
            └─────────────────┘
```

---

## 🛠️ 2026 工具栈（开源 + 商业）

### 开源
| 项目 | 定位 | 入 CNCF 时间 |
|---|---|---|
| **[[entities/K8sGPT]]** | K8s 集群诊断（"是什么"）| 2023-12-19（最早）|
| **[[entities/HolmesGPT]]** | 故障调查 Agent（"为什么 + 怎么修"）| 2025-10-08 |
| **Aurora**（Arvo AI）| 多云沙箱执行 | - |
| **[[entities/OpenObserve]]** | 高性能可观测平台（Rust） | - |
| Langfuse / Phoenix / OpenLLMetry | LLM 监控（[[sources/98-Agent可观测性工具爆发五大开源项目]]）| - |

### 商业
| 产品 | 估值/状态 | 定位 |
|---|---|---|
| **[[entities/Datadog-Bits-AI-SRE]]** | 上市公司旗舰，GA 2025-12-02 | 企业级标杆 |
| **PagerDuty SRE Agent** | 上市公司 | 事件管理切入 |
| **Resolve.ai** | $125M @ $1B 估值 | 创业挑战者 |
| **Traversal** | $48M（Sequoia + KP）| AMEX 实证 |
| **[[entities/Middleware-OpsAI]]** | 创业公司 | 中端市场轻量 |

### 底层标准
- **[[entities/OpenTelemetry]]**（事实标准）
- **[[entities/MCP-Model-Context-Protocol]]**（工具调用协议）
- **LLM**（Gemini / Claude / GPT）

---

## 📈 生产实证（5 个案例）

| 案例 | 来源 | 数据 |
|---|---|---|
| **iFood** | [[sources/85-AI-SRE-2026-Guide-Augment-Code]] | MTTR **减 70%**（用 Datadog Bits AI SRE）|
| **American Express** | [[sources/85-AI-SRE-2026-Guide-Augment-Code]] | 根因准确率 **82%**，MTTR **-32%**（用 Traversal）|
| **Datadog 内部** | [[sources/85-AI-SRE-2026-Guide-Augment-Code]] | 调查完成快 **2 倍**（2026-03 后）|
| **Google SRE** | [[sources/87-Google-SRE-Agentic-AI]] | 20 年首次系统披露 agentic AI 落地 |
| **新浪微博** | [[sources/95-新浪微博-AI-Agent协作运维落地与演进]] | 中国互联网大厂一手落地 |

---

## 🚨 3 大行业反共识（关键论点）

### 反共识 1：架构 > 模型（不是换更强 LLM 就行）
来源：[[sources/80-Why-AI-Agents-Fail-at-Cloud-RCA-arXiv]]
- **1675 次 Agent 运行实证**：12 种 pitfall **源于架构，不是模型能力**
- **Prompt 优化救不了**
- 加强 inter-agent 通信能降 15%

### 反共识 2：传统 APM 不够（三层盲区）
来源：[[sources/89-AI可观测性的三层盲区]]
- **业务成本盲区**：Token 经济不可见
- **推理引擎盲区**：KV Cache / GPU 利用率不可见
- **Agent 决策盲区**：Agent 推理中段失败不可见
- **UC Berkeley 数据**：多 Agent 系统 AppWorld 故障率 **86.7%**，传统监控完全不知情

### 反共识 3：学术 benchmark ≠ 真实生产
来源：[[sources/84-LATS-RCA-Language-Agent-Tree-Search-arXiv]]
- **LO2 基准 91.3%** → **真实生产 MSS 仅 65.1%**
- 真实世界三大挑战：多因素根因 / 规模复杂度 / 不完整可观测性

---

## 📐 可观测的 4 大维度（AI 时代）

来源：[[sources/90-AI可观测性全链路追踪]] + [[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]

| 维度 | 关键指标 | 推荐工具 |
|---|---|---|
| **Prompt** | 模板版本、变量、token 数 | LangSmith / Langfuse |
| **Tool Call** | 入参 / 出参 / 耗时 / 错误率 | OpenTelemetry + 自定 attr |
| **Trace** | 多 Agent 协作链路 | OpenTelemetry |
| **Token** | input/output / 成本 / 缓存命中 | Helicone / Portkey |

详见：[[concepts/AI-可观测性-四维追踪]]

---

## 🎯 企业建设路线（从 0 到 1）

来自 [[sources/93-大型集团IT运维智能体平台详细设计方案]] 综合 [[sources/83-AIOps-Platform-for-Enterprises-portkey]]：

```
Phase 1（0-3 月）: 告警收敛 + 日志语义解析
   ↓
Phase 2（3-6 月）: 根因分析（RCA） + 可观测 4 维上线
   ↓
Phase 3（6-12 月）: 自动化运维编排 + 故障自愈
   ↓
Phase 4（12+ 月）: 变更影响评估 + 混沌工程 + 知识库 + Postmortem 自动化
```

---

## 🧩 与本 Wiki 其他主题的关系

### 上承
- [[concepts/Agentic-AI]] — AIOps Agent 是 Agentic AI 在运维垂直的落地
- [[concepts/Enterprise-Agent-Architecture-2026]] — AIOps Agent 是该架构的具体应用
- [[concepts/Harness-Engineering]] — AIOps 是 Harness 工程在运维领域的延伸

### 平行
- [[concepts/金融智能体落地]] — 金融垂直 vs 运维垂直
- [[concepts/汽车金融-AI-建设方向]] — 业务垂直 vs IT 垂直

### 下接
- [[concepts/AI-SRE-范式]] — AIOps 的事后调查侧详解
- [[concepts/AI-可观测性-四维追踪]] — AIOps 的可观测层详解

---

## 💡 一句话总结

> **2026 AIOps = AIOps（事前去噪）+ AI SRE（事后调查）+ 可观测性四维（Prompt/Tool/Trace/Token）。**
> **架构 > 模型，工具开源 + 商业双轨，多 Agent 5 角色协作。**
> **企业级 MTTR 减 70% 不是营销话术，是 iFood / AMEX / Google 一手数据。**
