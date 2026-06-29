---
type: entity
created: 2026-06-29
tags: [wiki, entity, 协议, 智能体, A2A]
---

# A2A Protocol (Agent2Agent v1.0)

## 一句话
**Agent2Agent 协议 v1.0** —— **Linux Foundation LF AI & Data 治理**的开放协议，用于跨厂商 Agent 之间的通信，是 2026 多 Agent 系统的事实通信标准。

## 核心特征
- **Agent Card**：用于 Agent 发现（`/.well-known/agent-card.json`）
- **Task Lifecycle**：显式任务生命周期（含 contextId 跨任务连续性）
- **OAuth-scoped Skills**：基于 OAuth scope 的能力鉴权

## 关键里程碑
- 2025-08 IBM 的 ACP 协议合并进 A2A
- 2025 Linux Foundation 接管治理
- 2026 H1 成为跨厂商 MAS 通信事实标准

## 与 MCP 的关系
- **[[entities/MCP-Model-Context-Protocol]]**：Agent → Tool（工具调用）
- **A2A**：Agent → Agent（Agent 间通信）
- 两者**互补**，共同构成厂商中立 control plane 的连接组织

## 在本 Wiki 中的出现
- [[sources/68-Tyk-AI-Agent-Orchestration-Enterprise-Guide]]
- [[sources/69-ISG-Agentic-Orchestration-Governance-First]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关
- [[entities/MCP-Model-Context-Protocol]]
- [[concepts/Agentic-AI]]
