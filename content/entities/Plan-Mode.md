---
type: entity
category: SDD / AI 编程功能
created: 2026-06-28
sources: ["[[sources/10-SDD五个常识全错了]]", "[[sources/07-OpenAI-Codex-负责人访谈]]"]
tags: [wiki, entity, AI编程]
---

# Plan Mode

主流 AI 编辑器内置的**轻量计划模式**——AI 出方案 → 人审 → 批准后执行。被 [[sources/10-SDD五个常识全错了]] 称为「**够用就是最优解**」。

## 各家入口
| 工具 | 快捷键 |
|---|---|
| Claude Code | `Shift + Tab` |
| Cursor | `Cmd + Shift + P` |
| Copilot | 等价操作 |
| [[Codex]] | `Shift + Tab` 切换 PlanMode |

## 设计哲学
Spec 是**实时的、一次性的、AI 生成的**。AI 分析代码库出计划 → 人审批 → 才动代码 → 用完即弃。

## 核心价值
SDD 的最小构件是「**人审意图**」这一个控制点。Plan Mode 恰好做了这件事，**也只做了这件事，不多不少**。

## 短板
- session 断就没
- 不可审计
- 多人无法对齐

## 适用判断
- ✅ 80% 日常迭代（前端 / CRUD / 配置变更）
- ⚠️ 复杂关键模块建议升级到 [[Superpowers]] 兜质量下限
- 💡 [[sources/10-SDD五个常识全错了]] 作者的优化：**把 Plan 产物持久化到文档**，不依赖 session 存活

## 在 Codex 中的形态
访谈中 Romain 演示：开启 Plan Mode 后 Codex 自动理解任务、扫描代码、查看项目进度、提出想法，然后引导用户给出反馈，把 Codex 当头脑风暴伙伴使用。详见 [[sources/07-OpenAI-Codex-负责人访谈]]。

## 在本 Wiki 中的出现
- [[sources/10-SDD五个常识全错了]]
- [[sources/07-OpenAI-Codex-负责人访谈]]

## 相关
[[Codex]] · [[Superpowers]] · [[OpenSpec]] · [[concepts/Spec-Driven-Development]]
