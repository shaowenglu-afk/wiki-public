---
type: source
created: 2026-06-28
source_date: 2026-04-21
author: 玉澄
original: "[2026-04-21 OpenAI几乎不做中期项目，PM也不大需要了！Codex负责人：OpenClaw很大程度上是Codex开发的！设计师写的代码比半年前工程师写的还多！](https://shaowenglu.com/clippings/2026-04-21-OpenAI%E5%87%A0%E4%B9%8E%E4%B8%8D%E5%81%9A%E4%B8%AD%E6%9C%9F%E9%A1%B9%E7%9B%AE%EF%BC%8CPM%E4%B9%9F%E4%B8%8D%E5%A4%A7%E9%9C%80%E8%A6%81%E4%BA%86%EF%BC%81Codex%E8%B4%9F%E8%B4%A3%E4%BA%BA%EF%BC%9AOpenClaw%E5%BE%88%E5%A4%A7%E7%A8%8B%E5%BA%A6%E4%B8%8A%E6%98%AFCodex%E5%BC%80%E5%8F%91%E7%9A%84%EF%BC%81%E8%AE%BE%E8%AE%A1%E5%B8%88%E5%86%99%E7%9A%84%E4%BB%A3%E7%A0%81%E6%AF%94%E5%8D%8A%E5%B9%B4%E5%89%8D%E5%B7%A5%E7%A8%8B%E5%B8%88%E5%86%99%E7%9A%84%E8%BF%98%E5%A4%9A%EF%BC%81)"
tags: [wiki, source, Codex, OpenAI, PM]
---

# OpenAI 几乎不做中期项目，PM 也不大需要了！——Codex 负责人访谈

> 公众号「51CTO 技术栈」转述播客内容。访谈嘉宾：Alexander Embiricos（Codex 产品负责人）、Romain Huet（OpenAI Developer Experience 负责人）。

## TL;DR
[[entities/Codex]] 团队的开发哲学：**少文档、高可配置、不阻碍模型发挥**；OpenAI 内部"只做短期（≤8 周）或长期，不做中期"；PM 角色被弱化，**每个职位都在变成"构建者"**。

## 关键观点
### 开发流程
- 几乎不写文档，最多 10 条要点
- **唯一规划纪律**："只做短期（≤8 周）或长期项目，永远不做中期"
- Codex App 启动时只有一份"为什么要做"，无 PRD
- App / IDE 插件 / CLI 共享同一份开源 Rust Codex Harness

### 人才与组织
- 团队从 8 人（2025-05）增至 50–100 人
- 招人核心标准：**高能动性 + 作品**（学历不重要）
- **设计师现在写的代码比半年前工程师还多**
- "PM 是填坑职位而非领导职位"
- 工程师 < 20 人就招 PM 是初创公司红旗

### 产品哲学
- **Plan Mode**（Shift+Tab 切换）：把 Codex 当头脑风暴伙伴
- "Skills"功能（Figma、Vercel、Cloudflare 等）= 任务生态接入
- App 设计目标：让"同时与多个 Agent 协作"自然到像玩游戏
- 历史两次"氛围转变"：2025-08 CodexCloud 太早 → 2025-08 GPT-5 + CLI/IDE 爆发 → 2026-01 终于回到"委派模型"愿景

### OpenClaw / Peter Steinberger
- [[entities/OpenClaw]] 创始人 Peter Steinberger 是 Codex 重度用户，开过 18 个终端跨 3 屏
- OpenClaw 很大程度上是用 Codex 开发的
- Peter 已加入 OpenAI 帮助构建"集成在 ChatGPT 中的下一代私人 Agent"

## 涉及实体 / 概念
[[entities/Codex]] · [[entities/OpenClaw]] · [[entities/Plan-Mode]] · [[concepts/Agentic-AI]]

## 原文链接
- 内部：[2026-04-21 OpenAI几乎不做中期项目，PM也不大需要了！Codex负责人：OpenClaw很大程度上是Codex开发的！设计师写的代码比半年前工程师写的还多！](https://shaowenglu.com/clippings/2026-04-21-OpenAI%E5%87%A0%E4%B9%8E%E4%B8%8D%E5%81%9A%E4%B8%AD%E6%9C%9F%E9%A1%B9%E7%9B%AE%EF%BC%8CPM%E4%B9%9F%E4%B8%8D%E5%A4%A7%E9%9C%80%E8%A6%81%E4%BA%86%EF%BC%81Codex%E8%B4%9F%E8%B4%A3%E4%BA%BA%EF%BC%9AOpenClaw%E5%BE%88%E5%A4%A7%E7%A8%8B%E5%BA%A6%E4%B8%8A%E6%98%AFCodex%E5%BC%80%E5%8F%91%E7%9A%84%EF%BC%81%E8%AE%BE%E8%AE%A1%E5%B8%88%E5%86%99%E7%9A%84%E4%BB%A3%E7%A0%81%E6%AF%94%E5%8D%8A%E5%B9%B4%E5%89%8D%E5%B7%A5%E7%A8%8B%E5%B8%88%E5%86%99%E7%9A%84%E8%BF%98%E5%A4%9A%EF%BC%81)
