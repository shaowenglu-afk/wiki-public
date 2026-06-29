---
title: "LATS-RCA: Language Agent Tree Search for Root Cause Analysis in Microservices"
title_zh: "LATS-RCA：微服务根因分析的语言 Agent 树搜索"
source: "https://arxiv.org/abs/2605.03505"
author:
  - "[[Alexander Naakka]]"
  - "[[Yuqing Wang]]"
  - "[[Mika V. Mäntylä]]"
published: 2026-05-05
created: 2026-06-29
description: "arXiv 2605.03505 - 把 RCA 表达为 reflection-guided 树搜索（不是线性推理）。LO2 基准 91.3%，三大前沿模型差异仅 1.6pp（model-agnostic）。但跑到生产 MSS（Zoner Oy，30 万站点）只剩 65.1%——揭示真实世界的多因素根因、规模复杂度、不完整可观测性挑战。"
tags:
  - clippings
  - arXiv
  - AIOps
  - RCA
  - 微服务
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> arXiv 论文 2605.03505 · 2026-05-05｜抓取 2026-06-29。

# LATS-RCA: Language Agent Tree Search for Root Cause Analysis in Microservices
# LATS-RCA：微服务根因分析的语言 Agent 树搜索

---

## 中文 TL;DR

现有 LLM-RCA 通常是**线性推理（单一诊断路径）**。LATS-RCA 提出把 RCA 表达成**reflection-guided 的树搜索**：多个 Agent 迭代分析日志和指标收集证据，**reflection 分数引导搜索**朝最可能的异常服务根因走。在 **LO2 开放基准**达到 **91.3% 诊断准确率**；**模型无关**（Claude Sonnet 4.5 / GPT-5 / Gemini 3 Pro 差异仅 89.7%–91.3%）。但跑到一家**服务欧洲 30 万站点的 web 托管公司（Zoner Oy）**的真实生产 MSS 上，**只剩 65.1%** 平均准确率——揭示真实世界 RCA 的三大挑战：**多因素根因、大规模系统复杂度、可观测性不完整**——这些都不在开放基准里。结论：**未来需要更真实的开放数据集**。

---

## Abstract｜摘要

**EN**: Recent advances in large language models (LLMs) have enabled early attempts to automate root cause analysis (RCA) in microservice systems (MSS). However, existing approaches typically rely on a linear reasoning process that proceeds along a single diagnostic path.

**中**: 近期大语言模型（LLM）的进步让微服务系统（MSS）根因分析（RCA）自动化的早期尝试成为可能。但**现有方案通常依赖线性推理过程**——沿单一诊断路径展开。

**EN**: In this paper, we propose the Language Agent Tree Search for RCA (LATS-RCA) in MSS. LATS-RCA formulates RCA as a reflection-guided tree-structured search over root-cause hypotheses, where multiple agents iteratively analyze logs and metrics to collect evidence, and reflection scores guide the search toward the most likely root causes for abnormal services.

**中**: 本文提出 **LATS-RCA**（MSS 根因分析的语言 Agent 树搜索）。LATS-RCA 把 RCA 表达为**reflection-guided 的树状结构搜索**，搜索对象是根因假设——多个 Agent 迭代分析日志和指标收集证据，**reflection 分数**引导搜索朝最可能的异常服务根因前进。

**EN**: We evaluate LATS-RCA on the open benchmark (LO2), achieving 91.3% diagnostic accuracy and analyzing the associated computational cost. Variation among the frontier-tier LLMs (Claude Sonnet 4.5, GPT-5, and Gemini 3 Pro) is small, between 89.7% and 91.3%, demonstrating our approach is model-agnostic.

**中**: 我们在**开放基准 LO2** 上评估 LATS-RCA，达到 **91.3% 诊断准确率**，并分析相关算力成本。**前沿三大模型**（Claude Sonnet 4.5 / GPT-5 / Gemini 3 Pro）之间的差异很小——**89.7% 到 91.3%**，证明本方法**模型无关**。

**EN**: We also conduct an exploratory study by evaluating LATS-RCA on real-world incidents from a web-hosting company's (Zoner Oy) production MSS that serves over 300,000 websites across Europe. We find that LATS-RCA correctly diagnoses 65.1% of the production incidents on average over multiple runs.

**中**: 我们还做了探索性研究：在**一家 web 托管公司（Zoner Oy）**的生产 MSS 上评估 LATS-RCA——该公司服务**欧洲 30 万+ 网站**。我们发现：**LATS-RCA 平均正确诊断 65.1% 的生产故障**（多次运行平均）。

**EN**: This reveals key challenges of real-world RCA, including multi-factor root causes, large-scale system complexity, and incomplete observability, which are absent from open benchmarks. Future work should develop more realistic open datasets for RCA and validate LATS-RCA with additional datasets.

**中**: 这揭示真实世界 RCA 的三大关键挑战，**这些都缺席于开放基准**：① **多因素根因** ② **大规模系统复杂度** ③ **可观测性不完整**。未来工作应**构建更真实的开放数据集**，并用更多数据集验证 LATS-RCA。

---

## 关键启示

1. **树搜索 > 线性推理** — 多假设并行 + reflection 引导
2. **Model-agnostic** — 前沿模型差异仅 1.6pp，关键是**搜索结构**不是模型
3. **基准 vs 生产的 30pp 落差**（91.3% vs 65.1%）是真实世界 RCA 的"测试集偏差"问题
4. **真实挑战 3 条**：多因素根因 / 规模复杂度 / 不完整可观测性
5. 呼应 [[Why-AI-Agents-Fail-at-RCA]] 的发现：架构 > 模型

## 原文链接

- arXiv abstract: https://arxiv.org/abs/2605.03505
- PDF full text: https://arxiv.org/pdf/2605.03505
