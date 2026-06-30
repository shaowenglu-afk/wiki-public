---
type: source
created: 2026-06-30
source_date: 2026-04-24
author: ITOps Times
original: "[2026-04-24 Why General-Purpose Agentic AI Breaks Down Cloud-Native](https://shaowenglu.com/clippings/2026-04-24-Why-General-Purpose-Agentic-AI-Breaks-Down-Cloud-Native)"
external_url: "https://itopstimes.com/ai/why-general-purpose-agentic-ai-breaks-down-in-cloud-native-infrastructure/"
tags: [wiki, source, AIOps, 反共识, 通用vs专用, en-zh]
---

# ITOps Times — Why General-Purpose Agentic AI Breaks Down in Cloud-Native

## TL;DR
通用 LLM Agent（直接调 ChatGPT/Claude）**不能直接搞云原生** —— 必须 domain-specialize。

**3 大失败原因**：
1. 领域知识不足（CRD/Operator/Mesh 术语爆炸）
2. 多 Hop 推理崩溃（5-10 跳后开始幻觉）
3. 工具调用面爆炸（100+ CRD / 500+ metric / 1000+ log pattern）

**解药**：[[entities/HolmesGPT]]、[[entities/K8sGPT]]、[[entities/Traversal]] 等 **vertical AI SRE**。

**断言**：**"AI SRE 下一波分化是 vertical specialization"**。

## 涉及实体 / 概念
- [[concepts/AIOps-生产实践与反共识]]（新）
- [[entities/HolmesGPT]] · [[entities/K8sGPT]] · [[entities/Datadog-Bits-AI-SRE]]

## 原文链接
- 内部：[2026-04-24 Why General-Purpose Agentic AI Breaks Down Cloud-Native](https://shaowenglu.com/clippings/2026-04-24-Why-General-Purpose-Agentic-AI-Breaks-Down-Cloud-Native)
- 外部：https://itopstimes.com/ai/why-general-purpose-agentic-ai-breaks-down-in-cloud-native-infrastructure/
