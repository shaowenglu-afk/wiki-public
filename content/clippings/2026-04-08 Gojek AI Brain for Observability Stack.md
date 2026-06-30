---
title: "How We Built an AI Brain for Our Observability Stack at Gojek"
title_zh: "Gojek 如何给可观测性栈装上 AI 大脑"
source: "https://medium.com/gojekengineering/how-we-built-an-ai-brain-for-our-observability-stack-at-gojek-11a288e578bb"
author:
  - "[[Gojek]]"
  - "Shivangi Parashar"
published: 2026-04-08
created: 2026-06-30
description: "东南亚最大超级 App Gojek 工程团队：给现有可观测性栈（Prom + Loki + Grafana）装上 LLM Agent 大脑，统一查询自然语言界面。"
tags:
  - clippings
  - AIOps
  - 可观测性
  - 大厂一手
  - 东南亚
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自 https://medium.com/gojekengineering/how-we-built-an-ai-brain-for-our-observability-stack-at-gojek-11a288e578bb ｜2026-04-08

# Gojek — AI Brain for Observability Stack

## 中文 TL;DR

**东南亚超级 App Gojek** 工程团队实战：给现有可观测性栈（Prometheus + Loki + Grafana）装一个 **AI Brain** —— 用 LLM Agent 做自然语言查询统一入口。

## 核心架构

```
工程师自然语言问题
   ↓
LLM Agent (大脑)
   ↓ ↓ ↓
PromQL    LogQL    Trace Query
 ↓         ↓          ↓
Prometheus  Loki    Tempo
   ↓
聚合 + 关联分析 → 自然语言回答
```

## 关键论点
- **不替换现有栈**——在 Prometheus / Loki / Grafana 之上加 LLM 层，零迁移成本
- **降低查询门槛**：新人不用学 PromQL，直接问"过去 1 小时哪个服务延迟最高"
- **跨数据源关联**：Agent 自动决定要查 metrics 还是 logs 还是 traces

## 与已有 wiki 的关系
- 与 [[concepts/AI-可观测性-四维追踪]] 中"工程师查询体验"完美互补
- vs [[entities/HolmesGPT]]：HolmesGPT 偏 K8s + 故障调查；Gojek 路线偏**通用自然语言查询**
- "**AI Brain 模式**"是一个值得记的设计模式：**不替换基础设施，加智能层**

## 涉及实体 / 概念
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-可观测性-四维追踪]]
- [[entities/OpenTelemetry]]

## 原文链接
- https://medium.com/gojekengineering/how-we-built-an-ai-brain-for-our-observability-stack-at-gojek-11a288e578bb
