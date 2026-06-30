---
title: "Why AI Coding Agents Can't Replace SREs (Yet)"
title_zh: "为什么 AI 编码 Agent 还替代不了 SRE（目前）"
source: "https://obsium.io/blog/can-ai-replace-sre/"
author:
  - "[[Obsium]]"
published: 2026-05-26
created: 2026-06-30
description: "Obsium 工程师视角：列出 SRE 工作中 AI 还做不到的 5 大事 + 3 个未来 2-3 年仍需人的核心场景。"
tags:
  - clippings
  - AIOps
  - 运维转型
  - 反共识
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


# Why AI Coding Agents Can't Replace SREs (Yet)

## 中文 TL;DR · 工程师亲身视角

## AI 还做不到的 5 大事

1. **跨系统取舍**：要不要回滚（影响 10 万用户）vs 容忍（避免事故升级）—— **需要业务判断**
2. **第一次见的故障模式**：训练数据没覆盖的新型 cascading failure
3. **隐性约束理解**：合规要求、SLA 谈判背景、组织政治
4. **沟通 + 安抚客户**：事故期间和客户、领导、其他团队的实时沟通
5. **责任承担**：变更失败时的问责

## 3 个未来 2-3 年仍需人的核心场景

- **第一响应**（understand context + 决策框架）
- **变更管理决策**（金融业尤其，参见 [[Clippings/2026-05-18 Traversal AI SRE Financial Services Regulated Reliability]]）
- **Postmortem 主持**（学习 + 跨团队对齐）

## 关键启示
- **(Yet) 很关键** —— 现在替代不了，**未来可能能**
- **SRE 的高价值部分是判断 + 责任**，不是工具操作
- **学会指挥 AI，比自己干活更值钱**

## 涉及实体 / 概念
- [[concepts/AI-SRE-范式]] · [[concepts/AIOps-生产实践与反共识]]

## 原文链接
- https://obsium.io/blog/can-ai-replace-sre/
