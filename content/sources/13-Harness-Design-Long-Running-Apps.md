---
type: source
created: 2026-06-28
source_date: 2026-03-24
author: Prithvi Rajasekaran
original: "[[Clippings/2026-03-24 长任务应用开发的 Harness 设计.md]]"
external_url: "https://www.anthropic.com/engineering/harness-design-long-running-apps"
tags: [wiki, source, Anthropic, Harness, Agent]
---

# 长任务应用开发的 Harness 设计（Anthropic）

> Anthropic Labs，作者 Prithvi Rajasekaran，2026-03-24。

## TL;DR
用 **GAN 启发的 generator-evaluator 架构** 让 Claude 自主造前端 + 全栈应用。**三 Agent 系统**：Planner（扩 spec）+ Generator（实现）+ Evaluator（Playwright 真测真打分）。引入 **sprint contract**——双方先谈判可交付物。

## 三大 Agent 角色
| 角色 | 职责 |
|---|---|
| **Planner** | 把 1–4 句 prompt 扩成详细 spec；**刻意回避粒度过细**防级联错误 |
| **Generator** | 用 React/Vite/FastAPI/SQLite 实现，git 管理版本 |
| **Evaluator** | Playwright 真点击 + 截屏 + 按硬阈值打分 |

## 四维评分
- design quality（颜色/字体/布局连贯）
- originality（自定义 vs 通用模板）
- craft（层级/间距/色彩和谐）
- functionality（可用性/任务完成）

> 评分明确惩罚 "**AI slop**" 通用模板，逼模型敢于审美冒险。

## 性能对比
| 方案 | 时长 | 成本 | 结果 |
|---|---|---|---|
| 单 Agent | 20 min | $9 | 核心功能坏 |
| 完整 Harness + Opus 4.5 | 6 hr | $200 | 抛光界面、可玩机制 |
| 完整 Harness + Opus 4.6 (DAW) | 3h50m | $124.7 | 主动删减组件后效率提升 |

## 最关键的发现：随模型变强主动简化 harness
模型升级到 Opus 4.6 后**作者系统性地删除组件**：
- 删除：Sprint 分解（模型能撑更长）
- 保留：Planner（防 under-scoping）
- 修改：Evaluator 从"每 sprint"移到"end-of-build QA"

> **Harness 复杂度应该反映模型当下的真实局限。当局限随新版本变化时，有效的 harness 需要定期简化与重构。**

## 与本 Wiki 的关系
- **直接扩展** [[concepts/Harness-Engineering]]：本文引入 generator-evaluator 模式 + sprint contract + "随模型变强主动简化"原则
- 与 [[sources/12-Parallel-Claude-C-Compiler]]：都是 Anthropic 一手实证；前者多 Agent 并行，本文三 Agent 协作
- 与 [[entities/Superpowers]] 的"七阶段流水线"理念呼应；但本文更强调**减法**，呼应 [[sources/10-SDD五个常识全错了]] "选最轻的工具 = 赌模型变强"

## 涉及实体 / 概念
[[concepts/Harness-Engineering]] · [[concepts/Agentic-AI]] · [[concepts/Long-Running-Agents-Anthropic|Long-Running-Agents]]

## 原文链接
- 内部：[[Clippings/2026-03-24 长任务应用开发的 Harness 设计.md]]
- 外部：https://www.anthropic.com/engineering/harness-design-long-running-apps
