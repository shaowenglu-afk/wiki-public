---
type: source
created: 2026-06-30
source_date: 2026-04-24
author: SoftwareSeni
original: "[2026-04-24 When AI SRE Fails Production Reality Failure Modes Cost](https://shaowenglu.com/clippings/2026-04-24-When-AI-SRE-Fails-Production-Reality-Failure-Modes-Cost)"
external_url: "https://www.softwareseni.com/when-ai-sre-fails-production-reality-failure-modes-and-what-they-cost/"
tags: [wiki, source, AIOps, AI-SRE, 反共识, 失败模式, 成本, en-zh]
---

# SoftwareSeni — When AI SRE Fails: Production Reality + Failure Modes + Cost

## TL;DR · 极珍贵反共识（21KB）

**4 大失败维度的真实数据**：

| 维度 | 数据 |
|---|---|
| 工具调用失败率 | **3-15%**（生产实证）—— 30 次调用 99% 至少 1 次失败 |
| 4-Agent 月成本 | **€8500**（vs 单 LLM €50 = **15x**）|
| Berkeley MAST 整体失败率 | **41-86.7%**（1642 trace 实证）|
| Prompt 注入成功率 | **11.2%**（生产实证） |

**金句**：
- "**Hallucinations are not anomalies; they are an expected property of probabilistic systems.**"
- 128K/1M context window **不解决幻觉**——生产有效仅 8K-50K

**5 大防护策略**：Circuit Breaker / Tool-chain reliability / Hallucination guardrails / Prompt injection 检测 / HITL 升级

## 涉及实体 / 概念
- [[concepts/AIOps-生产实践与反共识]]（新）
- [[concepts/AI-SRE-范式]] · [[concepts/AIOps-2026-全景综述]]
- [[sources/80-Why-AI-Agents-Fail-at-Cloud-RCA-arXiv]]（同主题 学术版）

## 原文链接
- 内部：[2026-04-24 When AI SRE Fails Production Reality Failure Modes Cost](https://shaowenglu.com/clippings/2026-04-24-When-AI-SRE-Fails-Production-Reality-Failure-Modes-Cost)
- 外部：https://www.softwareseni.com/when-ai-sre-fails-production-reality-failure-modes-and-what-they-cost/
- 关联：UC Berkeley MAST arXiv:2503.13657
