---
type: source
created: 2026-07-11
tags: [wiki, source, Anthropic, alignment, persona, interpretability, year-2026]
source-type: 研究博客
lang: en
source-url: https://www.anthropic.com/research/persona-selection-model
published: 2026-02-23
raw:
  - '[[Clippings/2026-02-23 Anthropic - The persona selection model|原文全文]]'
related:
  - '[[concepts/Anthropic-Research-2026H1]]'
---

# The persona selection model

> Anthropic Alignment · 2026-02-23 · [原文](https://www.anthropic.com/research/persona-selection-model)

## TL;DR

提出 **Persona Selection Model**：LLM 内部会"选择一个 persona"来产出，可视为角色决策的内部机制。用来解释 jailbreak 为何成功 —— 模型被诱导切换 persona。

## 关键论点

- Jailbreak = **模型被诱导选择另一个 persona**
- Persona 层介入 = 新的对齐 / 越狱防御位置
- 与 [[sources/154-Anthropic-Emotion-Concepts-Function]] 都揭示 LLM 内部状态

## 与本 wiki 关联

- 组合：[[sources/154-Anthropic-Emotion-Concepts-Function]] · [[sources/139-Anthropic-Global-Workspace]]

## 一句话总结

> **越狱的本质是"诱导 LLM 换 persona"。防御要抓 persona 切换。**

## 原文链接

- 本地剪藏：[[Clippings/2026-02-23 Anthropic - The persona selection model|原文全文]]
- 官方链接：<https://www.anthropic.com/research/persona-selection-model>
