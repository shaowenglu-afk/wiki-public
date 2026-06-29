---
type: source
created: 2026-06-28
source_date: 2026-03-25
author: Merlin Stein
original: "[[Clippings/2026-03-25 AI Agent 实际怎么被使用 - 177000 个 MCP 工具的实证.md]]"
external_url: "https://arxiv.org/abs/2603.23802"
tags: [wiki, source, arXiv, MCP, 实证]
---

# 17.7 万 MCP 工具实证：AI Agent 实际怎么被用（arXiv 2603.23802）

> arXiv 论文，作者 Merlin Stein，提交 2026-03-25。

## TL;DR
监控公开 [[entities/MCP-Model-Context-Protocol|MCP]] server 仓库，分析 **2024-11 到 2026-02** 创建的 **177,436 个 Agent 工具**。**软件开发**占 67% 工具、90% 下载量；**行动类工具**占比从 27% 升至 65%。

## 方法
工具分类：
- **感知（perception）** — 读数据
- **推理（reasoning）** — 分析数据
- **行动（action）** — 修改环境

用 **O*NET 数据库**映射任务领域，评估后果性。

## 核心发现
| 发现 | 数据 |
|---|---|
| 软件开发的工具占比 | **67%** |
| 软件开发的下载占比 | **90%** |
| 行动类工具占比变化 | **27% → 65%**（16 个月）|
| 多数行动工具风险等级 | 中等（文件编辑、邮件）|
| 高风险应用 | 已出现（含金融交易）|

## 监管启示
**关注"工具层"**——而非只看模型输出。MCP server 仓库公开可监测，为治理提供新视角。

## 与本 Wiki 的关系
- 提供 [[entities/MCP-Model-Context-Protocol|MCP]] **作为 Agent 工具生态事实标准**的实证证据
- 印证 [[entities/Codex]] 等编程 Agent 受到重视的市场原因（67% 工具是开发类）
- "从读到做"的快速跃迁是 Agent 风险评估的关键信号

## 涉及实体 / 概念
[[entities/MCP-Model-Context-Protocol]] · [[concepts/Agentic-AI]] · [[entities/Codex]]

## 原文链接
- 内部：[[Clippings/2026-03-25 AI Agent 实际怎么被使用 - 177000 个 MCP 工具的实证.md]]
- 外部：https://arxiv.org/abs/2603.23802
