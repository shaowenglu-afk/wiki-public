---
type: entity
created: 2026-06-29
tags: [wiki, entity, AIOps, AI-SRE, 开源]
---

# HolmesGPT

## 一句话
**CNCF Sandbox 项目（2025-10-08 入选）** —— 自然语言 K8s / Prometheus / Loki / Grafana 故障调查 Agent，是 2026 开源 AI SRE 的代表。

## 核心特征
- **Apache 2.0 开源** —— 完全可商业化
- **K8s 原生** —— 自动从 Pod 日志 + events + metrics 中调查
- **集成主流可观测栈**：Prometheus / Loki / Grafana / Datadog / OpsGenie
- **多 LLM 后端**：OpenAI / Anthropic / Azure / 本地 Ollama
- **CLI + Web UI** 两种使用方式

## 在 AI SRE 工具链中的定位
- **HolmesGPT**：Investigation Agent（调查）
- **K8sGPT**：Diagnosis Agent（诊断）
- **Aurora（Arvo AI）**：多云沙箱执行

三者常组合使用，**与商业产品（Datadog Bits AI SRE / PagerDuty SRE Agent / Resolve.ai / Traversal）形成开源 + 商业双轨**。

## 在本 Wiki 中的出现
- [[sources/85-AI-SRE-2026-Guide-Augment-Code]]
- [[sources/86-AI-SRE-vs-AIOps-Arvo-AI]]
- [[sources/98-Agent可观测性工具爆发五大开源项目]]
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]

## 相关
- [[entities/K8sGPT]] · [[entities/Middleware-OpsAI]] · [[entities/Datadog-Bits-AI-SRE]]
