---
type: source
created: 2026-06-30
source_date: 2026-04-08
author: Gojek · Shivangi Parashar
original: "[2026-04-08 Gojek AI Brain for Observability Stack](https://shaowenglu.com/clippings/2026-04-08-Gojek-AI-Brain-for-Observability-Stack)"
external_url: "https://medium.com/gojekengineering/how-we-built-an-ai-brain-for-our-observability-stack-at-gojek-11a288e578bb"
tags: [wiki, source, AIOps, 可观测性, 大厂一手, 东南亚, en-zh]
---

# Gojek — AI Brain for Observability Stack

## TL;DR
东南亚超级 App Gojek：给现有 Prometheus + Loki + Grafana 装一个 **AI Brain** —— 用 LLM Agent 做自然语言查询统一入口。

**核心架构**：自然语言 → LLM Agent → PromQL/LogQL/Trace → 聚合关联 → 自然语言回答

**关键论点**：**"AI Brain 模式"是一个值得记的设计模式** —— 不替换基础设施，加智能层，零迁移成本。

**vs HolmesGPT**：HolmesGPT 偏 K8s 故障调查；Gojek 路线偏**通用自然语言查询**。

## 涉及实体 / 概念
- [[concepts/AIOps-2026-全景综述]] · [[concepts/AI-可观测性-四维追踪]]
- [[entities/OpenTelemetry]] · [[entities/HolmesGPT]]

## 原文链接
- 内部：[2026-04-08 Gojek AI Brain for Observability Stack](https://shaowenglu.com/clippings/2026-04-08-Gojek-AI-Brain-for-Observability-Stack)
- 外部：https://medium.com/gojekengineering/how-we-built-an-ai-brain-for-our-observability-stack-at-gojek-11a288e578bb
