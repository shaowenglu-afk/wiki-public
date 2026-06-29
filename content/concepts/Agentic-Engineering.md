---
type: concept
created: 2026-06-28
sources: ["[[sources/15-Karpathy-Vibe-Coding-to-Agentic-Engineering]]"]
tags: [wiki, concept, 范式, Karpathy]
---

# Agentic Engineering（智能体工程）

Karpathy 在 Sequoia AI Ascent 2026（[[sources/15-Karpathy-Vibe-Coding-to-Agentic-Engineering]]）提出的**新一级工程学科**——建立在 Vibe Coding 之上的更严肃形态。

## 一句话定义
**Vibe coding 是 prompt 一下试运气，Agentic Engineering 是把这个"试"变成系统**——prompt 工程、harness 设计、工具集、评估、反馈循环、专业角色分工，全部组织成**可重复、可迭代、可演化**的工程实践。

## 与三个相邻概念的关系

| 概念 | 区别 |
|---|---|
| [[Vibe-Coding]] | 是 Agentic Engineering 的**前身和起点**——一年后回看更像"试运气" |
| [[Harness-Engineering]] | 是 Agentic Engineering 的**工程组件**——前者是学科范式，后者是其中的执行环境技术 |
| [[Spec-Driven-Development]] | 是 Agentic Engineering 的**中间产物形态**——把 Spec/Plan/Test 当作工程对象 |

## Karpathy 的核心论点

### 1. LLM 不是动物，是"幽灵"
不要拟人化 LLM。它**是从海量人类文字中召唤出来的概率性、参差不齐的统计实体**。需要新的思考方式：不是训练动物，而是引导"形态不定的统计存在"。

### 2. Jagged Skills（参差能力）
LLM 能力呈**锯齿状**——某些任务超人、某些连小学生都不如，**且边界难以预测**。Agentic Engineering 必须配备**强可验证性机制**，否则在锯齿低洼处崩溃。

### 3. Menu Gen vs Raw Prompts
从"和模型聊天（raw prompts）"转向"和工程系统对话（menu gen，预设选项 + 限定参数）"——这是 Agentic Engineering 的工程化体现。

### 4. 外包思考 ≠ 外包理解
> "**You can outsource your thinking but never your understanding.**"

理解必须自己保留，否则就失去了判断 Agent 输出对错的能力——这是 Agentic Engineer 的不可让渡角色。

## 范式演进的新台阶

更新 [[协作范式演进]]：
**Prompt Engineering → Context Engineering → Harness Engineering → Agentic Engineering**

后者覆盖前者：Agentic Engineering 是把 harness、context、prompt 全部纳入**工程化生命周期管理**的元学科。

## Software 3.0 框架
- **Software 1.0** = 程序员手写代码
- **Software 2.0** = 训练神经网络权重
- **Software 3.0** = 用自然语言对 LLM 编程（prompt 即代码）

Agentic Engineering 是 Software 3.0 的**工程纪律**。

## 关键金句
- "I've never felt more behind as a programmer."
- "LLMs are not animals, they're ghosts."
- "You can outsource your thinking but never your understanding."

## 在本 Wiki 中的出现
- [[sources/15-Karpathy-Vibe-Coding-to-Agentic-Engineering]]
- 间接呼应：[[sources/02-AI-PM-必须掌握-Harness-Engineering]]、[[sources/10-SDD五个常识全错了]]、所有 Anthropic source（11-13）

## 相关
[[Vibe-Coding]] · [[Harness-Engineering]] · [[Spec-Driven-Development]] · [[协作范式演进]] · [[Parallel-Agent-Teams]] · [[Brain-Hands-Decoupling]]
