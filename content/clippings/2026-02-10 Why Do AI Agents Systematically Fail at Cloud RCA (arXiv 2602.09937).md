---
title: "Why Do AI Agents Systematically Fail at Cloud Root Cause Analysis?"
title_zh: "AI Agent 为何系统性地在云上根因分析中失败？"
source: "https://arxiv.org/abs/2602.09937"
author:
  - "[[Taeyoon Kim]]"
  - "[[Woohyeok Park]]"
  - "[[Hoyeong Yun]]"
  - "[[Kyungyong Lee]]"
published: 2026-02-10
created: 2026-06-29
description: "arXiv 2602.09937 - 跑完 OpenRCA 基准 1675 次 Agent 运行后，把失败归类为 12 种 pitfall。结论：失败源于 Agent 架构本身，不是模型能力；prompt 优化救不了，加强 inter-agent 通信能降 15%。"
tags:
  - clippings
  - arXiv
  - AIOps
  - RCA
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> arXiv 论文 2602.09937 · 2026-02-10｜抓取 2026-06-29 由 agent-reach（curl + abstract 提取）+ 段对段翻译。

# Why Do AI Agents Systematically Fail at Cloud Root Cause Analysis?
# AI Agent 为何系统性地在云上根因分析中失败？

---

## 中文 TL;DR

跑完 OpenRCA 基准 **1675 次 Agent 运行**（5 个 LLM 模型）后，作者把所有失败归为 **12 种 pitfall（陷阱）**，分布在 3 个维度：Agent 内部推理 / Agent 间通信 / Agent 与环境交互。最关键发现：**最常见的失败（幻觉式数据解释、不完整探索）跨所有模型都存在——失败的根源是"共享的 Agent 架构"而不是个别模型的能力局限**。受控实验：单纯 prompt 工程救不了主导的 pitfall；**强化 inter-agent 通信协议可减少 15 个百分点**的通信类失败。

---

## Abstract｜摘要

**EN**: Failures in large-scale cloud systems incur substantial financial losses, making automated Root Cause Analysis (RCA) essential for operational stability. Recent efforts leverage Large Language Model (LLM) agents to automate this task, yet existing systems exhibit low detection accuracy even with capable models, and current evaluation frameworks assess only final answer correctness without revealing why the agent's reasoning failed.

**中**: 大规模云系统的故障带来巨大经济损失，**自动化根因分析（RCA）对运营稳定性是必需品**。近期尝试用大语言模型（LLM）Agent 来自动化此任务，但即使是强模型，现有系统**检测准确率仍低**——而且当前评估框架只看最终答案对错，**不揭示 Agent 推理失败的原因**。

**EN**: This paper presents a process level failure analysis of LLM-based RCA agents. We execute the full OpenRCA benchmark across five LLM models, producing 1,675 agent runs, and classify observed failures into 12 pitfall types across intra-agent reasoning, inter-agent communication, and agent-environment interaction.

**中**: 本文做了 LLM-based RCA Agent 的**过程级失败分析**。在 5 个 LLM 模型上跑完整 OpenRCA 基准，产生 **1,675 次 Agent 运行**，把观察到的失败分为 **12 种 pitfall**，分布在三个维度：Agent 内部推理、Agent 间通信、Agent 与环境交互。

**EN**: Our analysis reveals that the most prevalent pitfalls, notably hallucinated data interpretation and incomplete exploration, persist across all models regardless of capability tier, indicating that these failures originate from the shared agent architecture rather than from individual model limitations.

**中**: 我们的分析揭示：**最常见的 pitfall**——尤其是 **幻觉式数据解释 + 不完整探索**——**跨所有模型都存在，与模型能力档次无关**。这说明这些失败源于**共享的 Agent 架构**，而不是个别模型的局限。

**EN**: Controlled mitigation experiments further show that prompt engineering alone cannot resolve the dominant pitfalls, whereas enriching the inter-agent communication protocol reduces communication-related failures by up to 15 percentage points.

**中**: 受控的缓解实验进一步显示：**单纯靠 prompt 工程解决不了主导的 pitfall**；而**强化 Agent 间通信协议**可减少最多 **15 个百分点**的通信类失败。

**EN**: The pitfall taxonomy and diagnostic methodology developed in this work provide a foundation for designing more reliable autonomous agents for cloud RCA.

**中**: 本研究构建的 pitfall 分类法和诊断方法论，为设计**更可靠的云 RCA 自主 Agent** 奠定了基础。

---

## 关键启示（对工程落地）

1. **失败根源是架构而非模型** — 换强模型救不了
2. **prompt 工程是 plateau** — 主导 pitfall 不会因为 prompt 更好就消失
3. **通信协议优化是 ROI 最高的方向** — 提升 15pp
4. **评估框架要加上"过程级失败分析"** — 不能只看最终答案对错
5. **12 种 pitfall** 分三类：intra-agent 推理 / inter-agent 通信 / agent-environment 交互

## 原文链接

- arXiv abstract: https://arxiv.org/abs/2602.09937
- PDF full text: https://arxiv.org/pdf/2602.09937
