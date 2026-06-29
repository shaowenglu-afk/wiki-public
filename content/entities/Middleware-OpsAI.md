---
type: entity
created: 2026-06-29
tags: [wiki, entity, AIOps, AI-SRE, 商业]
---

# Middleware OpsAI

## 一句话
**Middleware.io 的 AI SRE Agent 产品** —— 端到端流水线：告警接收 → 自动上下文收集 → 关联推理 → 根因假设排序 → 补救建议（可一键执行）→ postmortem 自动起草。

## 核心特征
- **多 Agent 架构**（5 个）：
  1. **Observer Agent**：监听 PagerDuty / Opsgenie 告警流
  2. **Investigation Agent**：ReAct 循环编排并行工具调用（LogQL / PromQL / deploy API）
  3. **Reasoning Agent**：把证据合成成带解释的根因假设
  4. **Action Agent**：HITL 审批后执行安全补救
  5. **Reporter Agent**：起草 Markdown postmortem + 更新 Jira/Linear

## 客户数据（早期）
- **MTTR 减 70%**（高频问题）
- **5 分钟**从告警到根因假设中位数
- **80%+** 补救建议接受率
- **3-5x** on-call 吞吐

## 定位
- **vs Datadog Bits AI SRE**：**更轻量、更便宜**，面向中端市场和创业公司
- **集成栈宽广**：PagerDuty / Opsgenie / Prom / Grafana / GitHub / GitLab / ArgoCD / Spinnaker / Slack / Teams / Jira / Linear / AWS / GCP / Azure

## 在本 Wiki 中的出现
- [[sources/97-Middleware-OpsAI-AI-SRE-Agent]]
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]

## 相关
- [[entities/Datadog-Bits-AI-SRE]] · [[entities/HolmesGPT]]
