---
title: "Architecting AI-powered Resilience Framework on AWS"
title_zh: "在 AWS 上构建 AI 驱动的韧性框架"
source: "https://aws.amazon.com/blogs/architecture/architecting-ai-powered-resilience-framework-on-aws/"
author:
  - "[[AWS]]"
published: 2026-06-22
created: 2026-06-30
description: "AWS 官方架构博客 42KB。结合 AWS Resilience Hub + AI Agent 做主动韧性管理：从混沌工程到自愈一体化设计。"
tags:
  - clippings
  - AIOps
  - 自愈
  - Chaos工程
  - AWS官方
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自 https://aws.amazon.com/blogs/architecture/architecting-ai-powered-resilience-framework-on-aws/ ｜2026-06-22

# Architecting AI-powered Resilience Framework on AWS
# 在 AWS 上构建 AI 驱动的韧性框架

---

## 中文 TL;DR

**AWS 官方架构博客 42KB** —— 把 **AWS Resilience Hub + AI Agent** 整合成"主动韧性"框架。核心论点：**韧性不是 reactive（事后救火），而是 proactive（事前 + 事中 + 事后）闭环**。

## 框架 3 大支柱

### 1. 评估（Assessment）
- AWS Resilience Hub 自动评估应用韧性 vs SLO
- AI Agent 分析架构图 → 找出 single point of failure
- 自动生成 resilience 缺口报告

### 2. 验证（Validation · Chaos 工程）
- 用 AWS FIS（Fault Injection Simulator）注入故障
- AI Agent 设计实验方案（哪里注入 / 什么强度 / 多久）
- 实验结果反馈到评估层

### 3. 修复（Remediation · 自愈）
- AI Agent 收到告警 → 投查 → 提建议 → 经审批后执行
- 与 AWS Systems Manager + Lambda 联动自愈
- 所有动作记录到 audit log

## 关键论点

- **AWS Bedrock Agents 是 backbone** —— Anthropic Claude / Amazon Nova 都能跑
- **Chaos 工程 + AI = 自动设计实验** —— 工程师不用手写 chaos scenario
- **韧性闭环**：Assess → Validate → Remediate → 反馈到 Assess

## 与已有 wiki 的关系
- 与 [[concepts/AIOps-2026-全景综述]] 中"自愈"部分深度互补
- vs [[entities/Microsoft-AGT]]：MS AGT 偏 governance；AWS Resilience 偏韧性
- 与 [[Clippings/2026-05-25 CBA DevOps Agent helps 2am on-call engineers]] 同源 AWS（CBA 案例 = AWS frontier agent + Resilience Hub）

## 涉及实体 / 概念
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]
- AWS Bedrock Agents · AWS Resilience Hub · AWS FIS

## 原文链接
- https://aws.amazon.com/blogs/architecture/architecting-ai-powered-resilience-framework-on-aws/
