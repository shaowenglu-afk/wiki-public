---
type: source
created: 2026-06-28
source_date: 2026-06-16
author: Dolphin7
original: "[[Clippings/2026-06-16 试完Superpowers、OpenSpec、Kiro、GStack，SDD五个常识全错了.md]]"
tags: [wiki, source, SDD, 选型]
---

# 试完 Superpowers、OpenSpec、Kiro、GStack，SDD 五个常识全错了

> 公众号 dolphin07「SSD 实战系列」，2026-06-16。

## TL;DR
作者实战 5 款 [[concepts/Spec-Driven-Development]] 工具后，列出 5 条流行常识的反共识；最终选择 **[[entities/Plan-Mode]] 打底 + [[entities/Superpowers]] 兜关键模块**，并把 Plan 产物持久化到文档。

## 五条反共识
1. **Spec 不是 Truth** — Spec 连编译器都没有，没有裁判机制，本质是 opinion
2. **No Spec No Code 是瀑布复辟** — 在不确定性最高的时候做最完整的承诺；流向反了（应是 AI 出方案 → 人审 → AI 执行）
3. **Spec 越精确 ≠ 越好** — 倒 U 曲线；该锁 What（边界/不变量/AC），不该锁 How（技术选型/实现路径）
4. **Spec 同步归档无价值** — 与代码重叠的部分代码本身就是最好文档；代码外知识应提到 CLAUDE.md / 知识库
5. **工具缝合 = 退潮沙滩上的城堡** — 哲学不自洽缝不出自洽（OpenSpec 信文档、Superpowers 信测试，冲突没人裁判）

## 5 款工具核心判断
| 工具 | 哲学 | 一句话 |
|---|---|---|
| [[entities/Plan-Mode]] | AI 出方案、人审一次、用完即弃 | 够用就是最优解 |
| [[entities/Superpowers]] | 没有测试就没有代码，纪律即产品 | 用 token 换纪律，220K+ Star |
| [[entities/OpenSpec]] | Spec 是 Truth，代码是投影 | 理想丰满工程骨感 |
| [[entities/Kiro]] | Spec 即 IDE | 体验丝滑代价是绑定 Amazon |
| [[entities/GStack]] | 一个人 = 一个团队，角色即约束 | 个人武器非团队方案 |

## 三条选型原则
1. **可执行的 > 要人读的**（测试 > Spec）
2. **轻的 > 重的**（赌模型变强）
3. **一个 > 多个**（拒绝胶水）

## 作者的最终配方（10 人以下 ToB 团队上下文）
- 轻量需求（前端/CRUD/配置）→ Plan Mode + 持久化文档
- 后端复杂模块（资金/权限/核心业务）→ Superpowers 兜质量下限
- 不用 OpenSpec（不需审计追溯）/ 不用 Kiro（拒绝 IDE 绑定）

## 关键预言
- **Spec 会变成 AI 的中间表示**，像汇编语言："重要但人不直接写"
- 真正值得投的是 Context（知识库）+ Eval（测试），不是 Spec 工具
- 选最轻的 = 赌模型变强；选最重的 = 赌模型停滞

## 涉及实体 / 概念
[[entities/Plan-Mode]] · [[entities/Superpowers]] · [[entities/OpenSpec]] · [[entities/Kiro]] · [[entities/GStack]] · [[concepts/Spec-Driven-Development]] · [[concepts/Vibe-Coding]]

## 原文链接
- 内部：[[Clippings/2026-06-16 试完Superpowers、OpenSpec、Kiro、GStack，SDD五个常识全错了.md]]
