---
type: concept
created: 2026-06-29
updated: 2026-06-29
tags: [wiki, concept, 可观测性, AIOps, LLMOps]
sources:
  - "[[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]"
  - "[[sources/83-AIOps-Platform-for-Enterprises-portkey]]"
  - "[[sources/88-沙丘智库-AI观测性市场指南]]"
  - "[[sources/89-AI可观测性的三层盲区]]"
  - "[[sources/90-AI可观测性全链路追踪]]"
  - "[[sources/96-AI观测站-从定位走向调查]]"
  - "[[sources/98-Agent可观测性工具爆发五大开源项目]]"
---

# AI 可观测性：四维追踪

> **一句话**：传统 APM 的 Logs/Metrics/Traces 三件套**不够看** —— AI 时代必须扩展到 **Prompt / Tool Call / Trace / Token 四维**，否则 Agent 失败 86.7%（UC Berkeley 数据）你完全不知道。

---

## 🎯 为什么传统 APM 不够（三层盲区）

来源：[[sources/89-AI可观测性的三层盲区]]

| 盲区 | 传统 APM 看到 | 实际还有 |
|---|---|---|
| **业务成本盲区** | 200 OK, 250ms | 这次请求烧了 **$1.74 token** |
| **推理引擎盲区** | CPU 50%, MEM 60% | KV Cache 命中率 **不到 20%** |
| **Agent 决策盲区** | 请求成功 | Agent **早在中段就走偏**，后续全是浪费 |

**残酷数据**：多 Agent 系统在 AppWorld 测试**故障率 86.7%**——传统监控对此**完全不知情**。

---

## 📐 四大维度

来源：[[sources/90-AI可观测性全链路追踪]] + [[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]

### 维度 1：Prompt 追踪

| 关键指标 | 推荐工具 |
|---|---|
| 模板版本（git-like 版本管理）| **Langfuse / LangSmith** |
| 变量值（用户输入 + 检索内容）| 同上 |
| 实际渲染后的最终 prompt | 同上 |
| Token 数 | 同上 + [[entities/OpenTelemetry]] |

### 维度 2：Tool Call 追踪

| 关键指标 | 推荐工具 |
|---|---|
| 工具名 + 入参 + 出参 | **[[entities/OpenTelemetry]]** + 自定 attribute |
| 调用耗时 / 错误率 | 同上 |
| 重试次数 / 失败原因 | 同上 |

### 维度 3：Trace 追踪（多 Agent 链路）

| 关键指标 | 推荐工具 |
|---|---|
| Agent 协作完整 trace（Planner → Worker → Verifier）| **[[entities/OpenTelemetry]]** |
| 每步 latency / 错误 | 同上 |
| Context 传递路径 | 同上 |

### 维度 4：Token 经济追踪

| 关键指标 | 推荐工具 |
|---|---|
| Input / Output token 数 | **Helicone / Portkey** |
| 每次推理的 USD 成本 | 同上 |
| KV Cache 命中率 | 推理框架自带（vLLM / TGI）|
| 模型路由分布 | [[sources/83-AIOps-Platform-for-Enterprises-portkey]] |

---

## 📊 4 类指标全景（OpenObserve 框架）

来源：[[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]

| 大类 | 关键指标 |
|---|---|
| **性能** | 延迟 P50/P90/P99 / 吞吐 / Token 用量 / 错误率 |
| **质量** | 幻觉率 / 相关性 / 忠实度 / 任务完成率 |
| **安全策略** | toxicity / prompt injection 尝试 / 策略违规率 |
| **业务** | CSAT / 转化率 / 单交互成本 |

---

## 🛠️ 工具栈

### 通用底座
- **[[entities/OpenTelemetry]]** — 事实标准（vendor-neutral）
- **[[entities/OpenObserve]]** — 开源高性能（Rust）

### AI 专建
- **Langfuse**（开源）— Prompt 追踪 + 评估
- **Langsmith**（LangChain 配套）— 闭源但功能强
- **Helicone**（开源）— LLM 网关 + 可观测
- **Phoenix**（Arize AI 开源）— LLM 评估 + 追踪
- **OpenLLMetry**（Traceloop）— OTel for LLM 扩展
- **Portkey** — Prompt 管理 + Model Gateway

详见：[[sources/98-Agent可观测性工具爆发五大开源项目]]

---

## 🚨 4 大实操原则

来源：[[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]

### 原则 1：完整日志不能省
完整 prompt + 响应 + 模型版本 + metadata 全记录。"省存储钱"几乎总后悔。

### 原则 2：实时告警 + 4 类阈值
- 延迟尖峰超 SLA
- 错误率超 1-2%
- 成本异常（Token 用量突然增加）
- 幻觉检出 / toxic 内容

### 原则 3：PII 入库前脱敏
GDPR / CCPA 必须。Prompt 里的 PII 入库前屏蔽。

### 原则 4：LLM-as-a-Judge + 人审
质量评估的双轨制——LLM 跑大量评估 + 人审 sample。

---

## 🎯 范式演进：从"定位"走向"调查"

来源：[[sources/96-AI观测站-从定位走向调查]]

```
2015-2024 可观测性               2025-2026 可观测性
─────────────                   ─────────────
核心问题：问题在哪里？             核心问题：问题为什么 + 怎么修？
模式：被动定位                    模式：主动调查
驱动：找到坏掉的组件               驱动：理解全链路因果
工具：APM (Datadog/NewRelic)     工具：APM + AI SRE + Prompt 追踪
```

---

## 🔗 在本 Wiki 中

- 上承：[[concepts/AIOps-2026-全景综述]]（可观测是 AIOps 的基础层）
- 平行：[[concepts/AI-SRE-范式]]（可观测的数据驱动 AI SRE 调查）
- 实体：[[entities/OpenTelemetry]] · [[entities/OpenObserve]]

---

## 💡 一句话总结

> **传统 Logs/Metrics/Traces 不够看 —— AI 时代是 Prompt/Tool/Trace/Token 四维。**
> **没有可观测的 Agent = 86.7% 失败率你不知道。**
> **OTel + Langfuse 是 2026 最小可行栈。**
