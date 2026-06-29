---
type: source
created: 2026-06-29
source_date: 2026-05-29
author: Google Cloud / Christopher Heiser
original: "[[Clippings/2026-05-29 How Google SRE is using agentic AI to improve operations (Google Cloud)]]"
external_url: "https://cloud.google.com/blog/products/devops-sre/how-google-sre-is-using-agentic-ai-to-improve-operations"
tags: [wiki, source, AIOps, AI-SRE, Google, en-zh]
---

# Google Cloud — How Google SRE is using agentic AI to improve operations

## TL;DR
**Google SRE 20 年首次系统披露 agentic AI 落地**。底层 **Gemini + ADK + MCP**，强调**透明度优先黑盒**。

## 6 大落地方向
1. **可靠性设计** —— Agent 评估架构方案的可靠性
2. **异常检测** —— Agent 分析多源信号
3. **事件管理** —— Agent 拉群 / 通知 / 协调
4. **事件调查** —— Agent 主动收集证据
5. **洞察风险** —— Agent 提取趋势 / 预警
6. **设计原则** —— 透明度 > 自主性，可解释 > 黑盒

## 关键论点
- **透明度优先** —— Google 选可解释推理过程，宁可慢一点
- **Gemini + [[entities/Google-ADK]] + [[entities/MCP-Model-Context-Protocol]]** 是底层标准栈
- **生产数据**：Datadog 内部调查完成快 2x（2026-03）

## 涉及的实体 / 概念
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]
- [[entities/Google-ADK]] · [[entities/MCP-Model-Context-Protocol]] · [[entities/OpenTelemetry]]

## 原文链接
- 内部：[[Clippings/2026-05-29 How Google SRE is using agentic AI to improve operations (Google Cloud)]]
- 外部：https://cloud.google.com/blog/products/devops-sre/how-google-sre-is-using-agentic-ai-to-improve-operations
