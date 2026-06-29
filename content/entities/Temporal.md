---
type: entity
created: 2026-06-29
tags: [wiki, entity, 持久化执行, 工作流引擎]
---

# Temporal

## 一句话
**持久化执行引擎** —— 让多步工作流**可恢复、重放安全、跨进程长跑**，2026 是企业 Agent 状态管理层的主流选择之一。

## 核心特征
- **Durable Execution**：每一步状态持久化，故障后自动恢复
- **Workflow as Code**：用代码定义工作流（不是 YAML）
- **重放安全**：失败重试不重复副作用
- **跨进程长跑**：支持秒到月的工作流

## 与 LangGraph 的关系
- **Temporal**：通用持久化执行（不限 AI）
- **[[entities/LangGraph]] Checkpointer**：AI Agent 专用持久化
- 都可作为 Agent **状态管理层**的实现

## 适用场景
- **长跑 Agent** 工作流
- **跨小时 / 跨天**的多步任务
- **金融审批 / 合规链** 等需要可审计可恢复

## 同类选择
- **Inngest** — Serverless 取向
- **Restate** — 较新

## 在本 Wiki 中的出现
- [[sources/68-Tyk-AI-Agent-Orchestration-Enterprise-Guide]]（状态管理推荐栈）
- [[sources/71-RTSLabs-7-Core-Layers-Enterprise-Agentic-AI]]
- [[sources/74-ClarityArc-Agentic-AI-Architecture-Enterprise-2026]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关
- [[entities/LangGraph]] · [[concepts/Harness-Engineering]]
