---
title: "AIOps: What we learned in 2025"
title_zh: "AIOps：2025 年我们学到了什么"
source: "https://www.thoughtworks.com/insights/blog/generative-ai/aiops-what-we-learned-in-2025"
author:
  - "[[Thoughtworks]]"
published: 2026-01-30
created: 2026-06-30
description: "Thoughtworks 业界权威 retrospective：2025 年 AIOps 落地的 7 个核心 learning。从 POC-to-prod gap、知识价值高于自动执行、MCP 尚未工业化、确定性 + 概率性混合系统等。"
tags:
  - clippings
  - AIOps
  - 反共识
  - 业界权威
  - Thoughtworks
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自 https://www.thoughtworks.com/insights/blog/generative-ai/aiops-what-we-learned-in-2025 ｜2026-01-30

# Thoughtworks — AIOps: What we learned in 2025

## 中文 TL;DR

**Thoughtworks 2025 年 AIOps 落地 7 大 Learning**（业界权威 retrospective）：

### Learning 1: POC-to-production gap 仍是结构性 + 技术性挑战
- POC 跑得很 sexy，生产卡死的本质问题没解决：scalability、observability、governance

### Learning 2: 最高价值的 AIOps 是**知识**，不是**自主行动**
- ⭐ 反共识：大家以为 AIOps = Agent 自主修复
- 真相：**让团队更快理解系统**比 Agent 自主操作价值高得多
- "知识图谱 + 智能问答"比"自动执行"更易被接受

### Learning 3: MCP 等通信协议尚未工业化
- 协议层成熟度被高估，企业级仍需大量工程化

### Learning 4: 进入**确定性 + 概率性混合系统**时代
- 不是"AI 全替代"，是"AI + 规则引擎"协同
- 工程要重新设计来容纳两种范式

### Learning 5: Context 需要**规模化有效运作**
- 单个 Agent context 没问题，多 Agent 协作时 context 共享是工程难题

### Learning 6: Agent-native AIOps 工具涌现，但 operability 仍缺
- 工具能用 ≠ 能运营
- 缺：可观测、可治理、可回滚

### Learning 7: AIOps 正延伸到其他资产管理
- 不只 IT 基础设施，还包括 ML pipelines、数据资产等

## 关键启示
- **"AIOps = 自主修复"是营销话术** —— Thoughtworks 实证最高价值在"知识"层
- **"AI Control Plane"** 是 2026 关键词
- **Context engineering at scale** 是新工程方向

## 与已有 wiki 的关系
- 与 [[concepts/AIOps-2026-全景综述]] 中 6 大共识形成对照（共识 vs 反思）
- 与 [[Clippings/2026-04-24 When AI SRE Fails Production Reality]] 同主题不同视角（业界 retrospective vs 失败模式技术分析）

## 涉及实体 / 概念
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]
- [[entities/MCP-Model-Context-Protocol]]

## 原文链接
- https://www.thoughtworks.com/insights/blog/generative-ai/aiops-what-we-learned-in-2025
