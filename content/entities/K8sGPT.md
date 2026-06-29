---
type: entity
created: 2026-06-29
tags: [wiki, entity, AIOps, K8s, 开源]
---

# K8sGPT

## 一句话
**CNCF Sandbox 项目（2023-12-19 入选，AIOps 领域最早进 CNCF 的 AI 项目）** —— 用 LLM 给 K8s 集群做"健康体检 + 自然语言解释"。

## 核心特征
- **Apache 2.0 开源**
- **K8s 专精**：扫 Pod / Deployment / Service / Ingress 等 30+ 资源类型
- **可解释性**：把晦涩的 K8s error 翻译成人话（`CrashLoopBackOff` → 详细原因 + 修复建议）
- **多 LLM 后端**：OpenAI / Anthropic / Azure / Cohere / 本地
- **CLI + Operator 模式** —— Operator 模式可常驻集群

## 与 HolmesGPT 的差异

| 维度 | K8sGPT | HolmesGPT |
|---|---|---|
| 定位 | **Diagnosis**（诊断"是什么问题"）| **Investigation**（调查"为什么发生 + 怎么解决"）|
| 范围 | 只 K8s | K8s + Prom + Loki + Grafana + ... |
| 时机 | 持续扫描（被动巡检）| 告警触发后主动调查 |
| 进 CNCF 时间 | 2023-12 | 2025-10 |

**常组合使用**：K8sGPT 持续巡检 → 发现问题 → 触发 HolmesGPT 深度调查。

## 在本 Wiki 中的出现
- [[sources/85-AI-SRE-2026-Guide-Augment-Code]]
- [[sources/91-AI赋能网络-K8s网络策略智能分析]]
- [[sources/98-Agent可观测性工具爆发五大开源项目]]
- [[concepts/AIOps-2026-全景综述]]

## 相关
- [[entities/HolmesGPT]] · [[entities/OpenTelemetry]]
