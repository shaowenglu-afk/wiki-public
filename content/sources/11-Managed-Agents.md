---
type: source
created: 2026-06-28
source_date: 2026-04-08
author: Lance Martin, Gabe Cemaj, Michael Cohen
original: "`2026-04-08 Managed Agents - 大脑与手脚解耦.md`（原始素材，仅本地可见）"
external_url: "https://www.anthropic.com/engineering/managed-agents"
tags: [wiki, source, Anthropic, Agent, 架构]
---

# Managed Agents：大脑与手脚解耦（Anthropic）

> Anthropic 工程博客，2026-04-08。

## TL;DR
解决"**harness 假设随模型升级过时**"的根本问题：把 Agent 拆成 **Session / Harness / Sandbox** 三个虚拟化组件，像操作系统虚拟化硬件那样。结果：**p50 TTFT ↓60%、p95 ↓90%+**。

## 关键事实
- 真实故事：Sonnet 4.5 的 "**context anxiety**" 让工程师加 reset，升级 Opus 4.5 后毛病自动消失——硬编码 harness 假设很快过时
- **三大虚拟化组件**：
  - Session = 仅追加的事件日志
  - Harness = 调 Claude + 路由工具的循环（变 stateless）
  - Sandbox = 代码执行环境
- 接口：`provision / wake / getSession / emitEvent`
- 安全：MCP 工具凭证存独立 vault，不混入容器
- "Pets vs Cattle"：容器从"宠物"变"牲畜"，可优雅恢复

## 设计哲学引述
> "Designing systems for programs as yet unthought of." — 为尚未想到的程序设计系统。

## 与本 Wiki 的关系
- 引入新概念 [[concepts/Brain-Hands-Decoupling]]
- 与 [[concepts/Harness-Engineering]] **互补**：本文回答"如何让 harness 不过时"——这是 Harness Engineering 范式的下一步
- 对照 [[sources/02-AI-PM-必须掌握-Harness-Engineering]]："推理三明治"与"Pets→Cattle"在抽象层级上互补

## 涉及实体 / 概念
[[concepts/Brain-Hands-Decoupling]] · [[concepts/Harness-Engineering]] · [[concepts/Agentic-AI]]
