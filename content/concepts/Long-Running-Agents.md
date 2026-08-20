---
type: concept
created: 2026-07-13
updated: 2026-07-13
tags: [wiki, concept, long-running, harness, agentic-engineering, memory]
sources:
  - '[[sources/13-Harness-Design-Long-Running-Apps]]'
  - '[[sources/58-智能体的记忆不是把聊天记录塞进提示词]]'
  - '[[sources/61-为什么企业智能体平台对企业是伪产品]]'
  - '[[sources/11-Managed-Agents]]'
  - '[[sources/12-Parallel-Claude-C-Compiler]]'
---

# Long-Running Agents

> **一句话**：**跨天/跨周持续运行的 Agent** —— 需要显式的 memory / harness / checkpoint / retry 机制，才能超越 Chat 式短会话的能力上限。是 [[concepts/Harness-Engineering]] 的一个核心应用面。

## 与 Chat Agent 的关键区别

| 维度 | Chat Agent（短会话）| Long-Running Agent |
|---|---|---|
| **时间尺度** | 秒-分钟 | 小时-天-周 |
| **上下文** | 单 session context window | 显式 memory 层（RAG / KV / 结构化）|
| **失败恢复** | 用户手动重开 | Checkpoint + auto-retry |
| **代表实践** | ChatGPT / Claude 单轮 | [[sources/12-Parallel-Claude-C-Compiler]] · Codex / Devin |

## 三大工程要素（Anthropic Harness Design）

1. **Planner-Generator-Evaluator 三 Agent 分工**（GAN 启发）—— 见 [[sources/13-Harness-Design-Long-Running-Apps]]
2. **显式 Memory 层，不是把聊天记录塞进 prompt** —— 见 [[sources/58-智能体的记忆不是把聊天记录塞进提示词]]
3. **Managed Agents 模型**：Session / Harness / Sandbox 三层解耦 —— 见 [[sources/11-Managed-Agents]] · [[concepts/Brain-Hands-Decoupling]]

## 反共识

- **"塞进 prompt 就是记忆"** 是最常见的伪解决方案 —— [[sources/58-智能体的记忆不是把聊天记录塞进提示词]] 指出真记忆需要"结构 + 检索 + 遗忘"
- **"企业智能体平台"多是伪产品**：解决不了 long-running 场景 —— [[sources/61-为什么企业智能体平台对企业是伪产品]]
- **并行 > 更强模型**：16 个 Long-Running Claude Agent < 1 个 GPT-5，但成本是 1/10 —— [[sources/12-Parallel-Claude-C-Compiler]]

## 在本 Wiki 中的出现

- **哲学基础**：[[concepts/Harness-Engineering]] · [[concepts/Agentic-Engineering]] · [[concepts/Brain-Hands-Decoupling]]
- **并行执行**：[[concepts/Parallel-Agent-Teams]]
- **可观测性**：[[concepts/AI-可观测性-四维追踪]] —— 长跑必需

## 相关

- [[concepts/Harness-Engineering]] · [[concepts/Brain-Hands-Decoupling]] · [[concepts/Parallel-Agent-Teams]]
- [[concepts/Agentic-Engineering]] · [[concepts/Agentic-AI]]
