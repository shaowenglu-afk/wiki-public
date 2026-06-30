---
type: source
created: 2026-06-30
source_date: 2026-06-22
author: AWS
original: "[2026-06-22 AWS AI-powered Resilience Framework](https://shaowenglu.com/clippings/2026-06-22-AWS-AI-powered-Resilience-Framework)"
external_url: "https://aws.amazon.com/blogs/architecture/architecting-ai-powered-resilience-framework-on-aws/"
tags: [wiki, source, AIOps, 自愈, Chaos工程, AWS, en-zh]
---

# AWS — Architecting AI-powered Resilience Framework on AWS

## TL;DR
AWS 官方架构博客 42KB —— **Resilience Hub + AI Agent + FIS（Fault Injection Simulator）** 三件套整合成 **韧性闭环**：

```
Assess（评估韧性缺口）→ Validate（Chaos 工程验证）→ Remediate（自愈）→ 反馈
```

**核心组件**：AWS Bedrock Agents（Claude / Nova）+ Resilience Hub + FIS + Systems Manager + Lambda

**断言**：**韧性不是 reactive 是 proactive** —— 事前评估 + 事中验证 + 事后自愈一体化设计

## 涉及实体 / 概念
- [[concepts/AIOps-2026-全景综述]] · [[concepts/AI-SRE-范式]]
- AWS Bedrock Agents · AWS Resilience Hub · AWS FIS

## 原文链接
- 内部：[2026-06-22 AWS AI-powered Resilience Framework](https://shaowenglu.com/clippings/2026-06-22-AWS-AI-powered-Resilience-Framework)
- 外部：https://aws.amazon.com/blogs/architecture/architecting-ai-powered-resilience-framework-on-aws/
