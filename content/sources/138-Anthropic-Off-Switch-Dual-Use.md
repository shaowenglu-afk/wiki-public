---
type: source
created: 2026-07-11
tags: [wiki, source, Anthropic, alignment, safety, dual-use, safeguards, 2026]
source-type: 研究博客
lang: en
source-url: https://www.anthropic.com/research/off-switch-dual-use
published: 2026-07-08
raw: '[[Clippings/2026-07-08 Anthropic - An off switch for dual use knowledge in AI models|原文全文]]'
related:
  - '[[concepts/Anthropic-Research-2026H1]]'
  - '[[entities/Anthropic-Research]]'
---

# An off switch for dual-use knowledge in AI models

> Anthropic × AE Studio · 2026-07-08 · [原文](https://www.anthropic.com/research/off-switch-dual-use)

## TL;DR

前沿 AI 模型是巨大的知识仓库，其中"**dual-use（双用途）知识**"（如网络安全 / 病毒学）既能防守也能作恶。当前 refusal + classifier 屏蔽输出但**不改动底层知识**，被越狱后仍会泄露。本文提出对**危险知识本身做 surgical off-switch**：训练时把关键权重分离出来，可"关掉"整块能力而不影响其他任务。

## 关键论点

- **屏蔽输出 ≠ 遗忘知识**：refusal + classifier 治标不治本
- 目标三态：**限制 dual-use 能力** + **允许可信用户开锁** + **不损害其他任务**
- 与 AE Studio 合作研究，路径：**知识切分 → 权重隔离 → 可控开关**
- 是 Alignment 从"训模型说不"到"训模型忘掉"的一次范式尝试

## 与本 wiki 关联

- **上承**：Alignment 综述 / 反共识 / Safeguards 框架
- **组合阅读**：[[sources/148-Anthropic-Teaching-Claude-Why]] · [[sources/166-Anthropic-Disempowerment-Patterns]]

## 一句话总结

> **AI 越狱防御的未来是"给危险知识本身装开关"**，而不是只在输出端做过滤。
