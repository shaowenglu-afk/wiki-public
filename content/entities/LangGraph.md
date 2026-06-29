---
type: entity
created: 2026-06-29
tags: [wiki, entity, 框架, 智能体, 图编排]
---

# LangGraph

## 一句话
LangChain 出品的**图式 Agent 编排框架**——用 DAG 显式建模 Agent 状态转移，是 2026 多 Agent 生产部署的主流框架之一。

## 核心特征
- **Graph-based 编排**：用节点和边显式定义状态机
- **Checkpointer**：内置状态持久化（Postgres / Redis 后端）—— **可恢复 + 重放安全**
- **生产可用**：Planner-Executor / Hierarchical 模式都成熟
- **高度可定制**：JS 代码节点 + Python 任意能力

## 适用场景
- **复杂工作流图**（VS LangChain 的链式编排）
- **Hierarchical / Manager-Worker** 模式
- **Planner-Executor** 模式
- **有状态长跑 Agent**

## 局限
- **手动策略接线** —— 治理需自己实现（vs Microsoft AGT 原生策略引擎）
- **无原生 Sandbox**

## 在本 Wiki 中的出现
- [[sources/68-Tyk-AI-Agent-Orchestration-Enterprise-Guide]]（被列入状态管理推荐栈）
- [[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]]（框架对比）
- [[sources/73-Internative-Multi-Agent-Enterprise-6-Patterns]]（"正经团队在用"）
- [[sources/74-ClarityArc-Agentic-AI-Architecture-Enterprise-2026]]
- [[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]（腾讯 Agent Core 层 4 选项之一）
- [[sources/78-Tencent-企业级Agent-AI-Native架构设计与实践]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关
- [[entities/Microsoft-AGT]] · [[entities/Google-ADK]] · [[entities/MLflow-Agent-Platform]]
- [[concepts/Harness-Engineering]]
