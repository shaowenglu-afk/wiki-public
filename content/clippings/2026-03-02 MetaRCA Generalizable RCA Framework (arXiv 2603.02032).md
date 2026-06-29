---
title: "MetaRCA: A Generalizable Root Cause Analysis Framework for Cloud-Native Systems Powered by Meta Causal Knowledge"
title_zh: "MetaRCA：由 Meta 因果知识驱动的云原生系统通用根因分析框架"
source: "https://arxiv.org/abs/2603.02032"
author:
  - "[[Shuai Liang]]"
  - "[[Pengfei Chen]]"
  - "[[Bozhe Tian]]"
  - "[[Gou Tan]]"
  - "[[Maohong Xu]]"
  - "[[Youjun Qu]]"
  - "[[Yahui Zhao]]"
  - "[[Yiduo Shang]]"
  - "[[Chongkang Tan]]"
published: 2026-03-02
created: 2026-06-29
description: "arXiv 2603.02032 - 用 Meta Causal Graph（MCG）作为离线知识基础，LLM + 历史故障 + 可观测性数据三源融合。在 252 公开故障 + 59 生产故障上达到 SOTA：服务级 +29pp，指标级 +48pp。跨系统泛化保持 >80% 准确率。"
tags:
  - clippings
  - arXiv
  - AIOps
  - RCA
  - 因果推理
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> arXiv 论文 2603.02032 · 2026-03-02｜抓取 2026-06-29。

# MetaRCA: A Generalizable Root Cause Analysis Framework for Cloud-Native Systems Powered by Meta Causal Knowledge
# MetaRCA：由 Meta 因果知识驱动的云原生系统通用根因分析框架

---

## 中文 TL;DR

云原生系统的 RCA 三大老问题：**复杂度面前不可扩展、跨系统泛化脆弱、领域知识难融入**。MetaRCA 的解法：离线构建一个 **Meta 因果图（MCG）** 作为可复用的 metadata 级知识库，**融合 LLM + 历史故障报告 + 可观测性数据**三源。运行时做轻量在线推理：把 MCG 动态实例化为当前上下文的局部图，再用实时数据加权和裁剪因果链做精准根因定位。在 **252 个公开故障 + 59 个生产故障**上达到 SOTA：服务级 **超最强基线 29pp**、指标级 **超 48pp**。**系统越复杂优势越大**，开销近线性扩展。**跨系统泛化保持 >80% 准确率**。

---

## Abstract｜摘要

**EN**: The dynamics and complexity of cloud-native systems present significant challenges for Root Cause Analysis (RCA). While causality-based RCA methods have shown significant progress in recent years, their practical adoption is fundamentally limited by three intertwined challenges: poor scalability against system complexity, brittle generalization across different system topologies, and inadequate integration of domain knowledge. These limitations create a vicious cycle, hindering the development of robust and efficient RCA solutions.

**中**: 云原生系统的动态性和复杂度给根因分析（RCA）带来巨大挑战。基于**因果**的 RCA 方法近年取得显著进展，但实际落地受三个相互纠缠的挑战根本性限制：**复杂度面前可扩展性差、跨拓扑泛化脆弱、领域知识融入不足**。这些限制形成恶性循环，阻碍鲁棒高效 RCA 解决方案的发展。

**EN**: This paper introduces MetaRCA, a generalizable RCA framework for cloud-native systems. MetaRCA first constructs a Meta Causal Graph (MCG) offline, a reusable knowledge base defined at the metadata level. To build the MCG, we propose an evidence-driven algorithm that systematically fuses knowledge from Large Language Models (LLMs), historical fault reports, and observability data.

**中**: 本文提出 **MetaRCA**——一个云原生系统的通用 RCA 框架。MetaRCA 首先在离线阶段构建 **Meta 因果图（MCG）**，作为定义在 **metadata 级别** 的可复用知识库。构建 MCG 时，我们提出一个证据驱动算法，系统性融合三方知识：**大语言模型（LLM）** + **历史故障报告** + **可观测性数据**。

**EN**: When a fault occurs, MetaRCA performs a lightweight online inference by dynamically instantiating the MCG into a localized graph based on the current context, and then leverages real-time data to weight and prune causal links for precise root cause localization.

**中**: 故障发生时，MetaRCA 做**轻量在线推理**：根据当前上下文把 MCG **动态实例化为局部图**，再用实时数据**加权和裁剪因果链**，做精准根因定位。

**EN**: Evaluated on 252 public and 59 production failures, MetaRCA demonstrates state-of-the-art performance. It surpasses the strongest baseline by 29 percentage points in service-level and 48 percentage points in metric-level accuracy. This performance advantage widens as system complexity increases, with its overhead scaling near-linearly. Crucially, MetaRCA shows robust cross-system generalization, maintaining over 80% accuracy across diverse systems.

**中**: 在 **252 公开故障 + 59 生产故障**上评估，MetaRCA 达到 SOTA。**服务级超最强 baseline 29 个百分点，指标级超 48 个百分点**。**系统越复杂优势越大**，开销近线性扩展。最关键的是：**MetaRCA 跨系统泛化稳健，在多种系统上保持 >80% 准确率**。

---

## 关键启示

1. **离线 MCG + 在线动态实例化** 是工程化的关键模式（重知识、轻在线）
2. **三源知识融合**（LLM + 历史故障 + 监控数据）远超单源 RCA
3. **服务级 vs 指标级**两层精度都大幅领先
4. **跨系统泛化 80%+** 是商业化的关键门槛
5. 性能优势随复杂度扩大 = **越是大系统越值得用**

## 原文链接

- arXiv abstract: https://arxiv.org/abs/2603.02032
- PDF full text: https://arxiv.org/pdf/2603.02032
