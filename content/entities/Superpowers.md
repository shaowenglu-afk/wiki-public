---
type: entity
category: SDD 工具
created: 2026-06-28
sources: ["[[sources/10-SDD五个常识全错了]]"]
tags: [wiki, entity, SDD, TDD]
---

# Superpowers

**TDD 纪律驱动的七阶段流水线**。GitHub 220K+ Star，已进入 Anthropic 官方插件市场，支持 Claude Code、Cursor、Gemini CLI 等 8 个平台。

## 设计哲学
**纪律即产品**。核心铁律：**没有失败测试就没有代码**。写了代码没写测试？Superpowers 直接删掉你的代码，从测试重来。

## 七阶段流水线
Brainstorm → Worktree → Plan → TDD → Subagent → Review → Finalize

## 真正的创新
不是 TDD 本身，而是 **测试吃掉了 Spec 文档**：
- Brainstorm 阶段把 AC 想清楚 → 直接翻译成测试
- 测试 = 可执行 Spec（pass/fail 无歧义、不腐化、不需要和代码同步）
- "Spec 没有裁判"和"维护成本"两个问题从根上消失

## 短板
- 费 token，简单改动 overhead 明显
- 七阶段对"改配置"是杀鸡用牛刀

## 适用判断
- 买的不是速度，是**质量下限**
- 核心痛点是代码质量 → 用
- 核心痛点是速度 → 不用

## 与其他 SDD 工具的关系
- 与 [[OpenSpec]] 哲学冲突：Spec vs 测试谁是 Truth
- 推荐做法：[[Plan-Mode]] 打底 + 关键模块用 Superpowers 兜底（[[sources/10-SDD五个常识全错了]] 作者方案）

## 在本 Wiki 中的出现
- [[sources/10-SDD五个常识全错了]]

## 相关
[[Plan-Mode]] · [[OpenSpec]] · [[Kiro]] · [[GStack]] · [[concepts/Spec-Driven-Development]]
