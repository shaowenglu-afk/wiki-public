---
type: source
created: 2026-06-30
source_date: 2026-06-04
author: 得物 · AIQ
original: "[2026-06-04 得物 用LLM Agent重构告警排查流程](https://shaowenglu.com/clippings/2026-06-04-%E5%BE%97%E7%89%A9-%E7%94%A8LLM-Agent%E9%87%8D%E6%9E%84%E5%91%8A%E8%AD%A6%E6%8E%92%E6%9F%A5%E6%B5%81%E7%A8%8B)"
external_url: "https://www.6aiq.com/article/yong-llm-agent-zhong-gou-gao-jing-pai-cha-liu-cheng-de-wu-ji-shu-1780588059873"
tags: [wiki, source, AIOps, AI-SRE, 大厂一手, ReAct, 中文]
---

# 得物 — 用 LLM Agent 重构告警排查流程（18 KB 深度实战）

## TL;DR
中国大厂 ReAct Agent 完整重构告警排查 10 章实战：
- 架构设计 / 核心流程 / **ReAct Agent 实战** / **幻觉控制** / 可观测 / **真实案例：效率网关超时** / **技术难点踩过的坑** / 效果数据

**关键论点**：
- ReAct + 工具调用是国内主流路线（vs LangGraph 图编排）
- 幻觉控制是落地核心
- 元可观测："Agent of Agent" 可观测 Agent 推理过程本身

## 中国大厂 AIOps 实战集群（4 篇）
- [[sources/95-新浪微博-AI-Agent协作运维落地与演进]] - 微博
- [[sources/93-大型集团IT运维智能体平台详细设计方案]] - 集团
- [[sources/105-苏宁-知识图谱告警收敛RCA]] - 苏宁
- **本篇 - 得物**

## 涉及实体 / 概念
- [[concepts/AI-SRE-范式]] · [[concepts/AIOps-2026-全景综述]]
- ReAct Agent

## 原文链接
- 内部：[2026-06-04 得物 用LLM Agent重构告警排查流程](https://shaowenglu.com/clippings/2026-06-04-%E5%BE%97%E7%89%A9-%E7%94%A8LLM-Agent%E9%87%8D%E6%9E%84%E5%91%8A%E8%AD%A6%E6%8E%92%E6%9F%A5%E6%B5%81%E7%A8%8B)
- 外部：https://www.6aiq.com/article/yong-llm-agent-zhong-gou-gao-jing-pai-cha-liu-cheng-de-wu-ji-shu-1780588059873
