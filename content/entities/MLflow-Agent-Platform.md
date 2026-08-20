---
type: entity
created: 2026-07-13
updated: 2026-07-13
tags: [wiki, entity, agent-platform, mlops, databricks, open-source]
sources:
  - '[[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]]'
---

# MLflow Agent Platform

> **一句话**：Databricks 开源 MLflow 2026 新增的 **Agent lifecycle** 能力 —— 用 MLflow 已有的 experiment tracking / model registry / serving 基础，把 Agent 当作一等公民对待（tracing / eval / bake-off / deploy）。

## 核心特征

- **微服务式 Agent 架构** —— 每个 Agent 是独立可 versioned 的 model artifact
- **Bake-Off 实证**：在 registry 里 A/B 对比不同 Agent 版本（prompt / model / tool 组合）
- **4 框架适配**：LangChain / LlamaIndex / DSPy / raw OpenAI
- **可观测性**：与 Prompt / Tool / Trace / Token 4 维追踪对齐（见 [[concepts/AI-可观测性-四维追踪]]）
- **和 [[entities/LangGraph]] / [[entities/Microsoft-AGT]] / [[entities/Google-ADK]] 的差异**：MLflow 是**生命周期管理层**，前三者是**开发框架**

## 在本 Wiki 中的出现

- [[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]]
- [[concepts/Enterprise-Agent-Architecture-2026]]
- [[entities/Google-ADK]] · [[entities/LangGraph]] · [[entities/Microsoft-AGT]]

## 相关

- [[concepts/Enterprise-Agent-Architecture-2026]] · [[concepts/AI-可观测性-四维追踪]]
- [[entities/LangGraph]] · [[entities/Google-ADK]] · [[entities/Microsoft-AGT]] · [[entities/A2A-Protocol]]
