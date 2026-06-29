---
type: entity
created: 2026-06-29
tags: [wiki, entity, 可观测性, AIOps, 标准]
---

# OpenTelemetry (OTel)

## 一句话
**云原生可观测性的事实标准** —— CNCF 旗下的统一遥测协议（Traces / Metrics / Logs），2026 已成 AI Agent 可观测的基础底座。

## 核心特征
- **三大信号**：Traces（追踪）、Metrics（指标）、Logs（日志）
- **vendor-neutral**：不锁定 Datadog / New Relic 等任何商业 APM
- **多语言 SDK**：Python / Go / Java / Node / Rust 全覆盖
- **Collector**：统一中转 + 转发 + 采样

## AI Agent 场景下的延伸
传统 OTel 不够用 → 新增 4 类 AI 专属维度（来自 [[sources/90-AI可观测性全链路追踪]]）：
- **Prompt 追踪**（模板版本、变量、token 数）
- **Tool Call 追踪**（每次工具调用的入参 / 出参 / 耗时）
- **Trace**（多 Agent 协作链路）
- **Token 经济**（每次推理的 input/output token + 成本）

## 在本 Wiki 中的出现
- [[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]
- [[sources/85-AI-SRE-2026-Guide-Augment-Code]]
- [[sources/87-Google-SRE-Agentic-AI]]
- [[sources/90-AI可观测性全链路追踪]]
- [[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]（OTel 是腾讯 7+2 架构横切关注点）
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-可观测性-四维追踪]]

## 相关
- [[entities/HolmesGPT]] · [[entities/OpenObserve]]
- [[concepts/Harness-Engineering]]
