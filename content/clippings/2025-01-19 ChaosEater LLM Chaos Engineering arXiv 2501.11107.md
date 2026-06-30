---
title: "ChaosEater: Fully Automating Chaos Engineering with Large Language Models"
title_zh: "ChaosEater：用大语言模型全自动化混沌工程"
source: "https://arxiv.org/abs/2501.11107"
author:
  - "[[arXiv]]"
published: 2025-01-19
created: 2026-06-30
description: "arXiv 2501.11107 - 用 LLM 全自动跑混沌工程流程：假设 → 设计实验 → 注入故障 → 分析结果 → 改进。开辟"LLM Agent + Chaos Engineering"新方向。"
tags:
  - clippings
  - AIOps
  - 学术
  - Chaos工程
  - 自愈
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自 https://arxiv.org/abs/2501.11107 ｜2025-01-19｜arXiv 摘要 + 关键论点

# ChaosEater: Fully Automating Chaos Engineering with LLMs

## 中文 TL;DR

**arXiv 2501.11107** —— 用 LLM 全自动化混沌工程完整流程：
1. **假设生成**：LLM 读取系统架构 + 历史故障 → 提出"哪里可能挂"的假设
2. **实验设计**：自动设计 chaos scenario（哪里注入 + 强度 + 持续时间）
3. **故障注入**：调用 Chaos Mesh / AWS FIS 等
4. **结果分析**：自动判断系统响应是否符合预期
5. **改进建议**：找出弱点 + 提改进方案

**开辟"LLM Agent + Chaos Engineering"新方向** —— 此前 chaos 工程依赖资深 SRE 手工设计实验，ChaosEater 让自动化成为可能。

## 关键论点

- **混沌工程 + AI 是双赢**：
  - AI 帮 chaos 设计：解决"懂业务的 SRE 太少"问题
  - chaos 验证 AI：通过故障注入测试 AI SRE Agent 自身韧性
- **与 [[Clippings/2026-06-22 AWS AI-powered Resilience Framework]] 完美互补**：AWS 提供工业级 chaos 平台 + LLM 提供智能层

## 涉及实体 / 概念
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]

## 原文链接
- https://arxiv.org/abs/2501.11107
- PDF: https://arxiv.org/pdf/2501.11107
