---
type: entity
category: 编程 Agent
created: 2026-06-28
sources: ["[[sources/07-OpenAI-Codex-负责人访谈]]", "[[sources/02-AI-PM-必须掌握-Harness-Engineering]]"]
tags: [wiki, entity, OpenAI, AI编程]
---

# OpenAI Codex

OpenAI 的编程 Agent 产品线，**3 人 / 5 个月 / 100 万行 / 0 行人工代码**的极端实验主角，也是 [[concepts/Harness-Engineering]] 理念的代表实现。

## 产品形态
- **CodexCLI** — 命令行
- **IDE 插件** — VSCode / Cursor / Windsurf
- **Codex App** — 多 Agent 委派的桌面端（2025-12 GPT-5.2 Codex 发布后成型）
- **CodexCloud** — 云端委派（2025-08 发布过早，2026-01 复活）
- 底层共享同一份**开源的 Rust Codex Harness**

## 关键事实
- 团队：2025-05 共 8 人 → 2026 约 50–100 人
- 内部规划纪律："只做短期（≤8 周）或长期，**永远不做中期**"
- 极少写文档（最多 10 条要点），无 PRD
- 内部 PM 仅"最近才有第二、第三个"

## 核心功能
- **[[Plan-Mode]]**（Shift+Tab）：AI 出方案，人审一次
- **Skills**：Figma / Vercel / Cloudflare / Render 等任务生态接入
- **Automations**：定时与触发
- **多 Agent 委派**：App 侧边栏 / 并行任务切换

## 重要观察
- 设计师写的代码 > 半年前一名工程师
- 招人核心：**高能动性 + 作品**，不看学历
- 用户狂热：新功能未上线就有人钻进开源代码自己改跑
- 大量"未在产品中触发但用户已自行使用"的功能（如子 Agent）→ 通过观察用户来打磨

## 与 [[OpenClaw]] 的关系
[[OpenClaw]] **很大程度上是用 Codex 开发的**；其创始人 Peter Steinberger 已加入 OpenAI 帮助构建"集成在 ChatGPT 中的下一代私人 Agent"。

## 在本 Wiki 中的出现
- [[sources/07-OpenAI-Codex-负责人访谈]]
- [[sources/02-AI-PM-必须掌握-Harness-Engineering]]（作为 Harness Engineering 的关键案例）

## 相关
[[OpenClaw]] · [[Plan-Mode]] · [[concepts/Harness-Engineering]] · [[concepts/Agentic-AI]]
