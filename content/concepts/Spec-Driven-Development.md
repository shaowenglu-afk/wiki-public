---
type: concept
created: 2026-06-28
sources: ["[[sources/10-SDD五个常识全错了]]"]
tags: [wiki, concept, SDD, AI编程]
---

# Spec-Driven Development（SDD）

让 AI 编程被"规格说明"驱动，而非依靠直觉 Prompt。介于 [[Vibe-Coding]] 与 [[Harness-Engineering]] 之间的中间形态。

## 一句话定义
通过显式的 Spec / Plan / 测试等中间产物，约束 AI 编程的过程，让"做什么"和"做对了吗"可控可审。

## 五条反共识（[[sources/10-SDD五个常识全错了]]）
1. **Spec 不是 Truth** — 连编译器都没有，没有裁判机制
2. **No Spec No Code 是瀑布复辟** — 在不确定性最高的时候做最完整的承诺，流向反了
3. **Spec 越精确 ≠ 越好** — 倒 U 曲线：锁 What 不锁 How
4. **Spec 同步归档无价值** — 代码就是最好的文档，知识应到 CLAUDE.md / 知识库
5. **工具缝合 = 退潮沙滩上的城堡** — 哲学不自洽缝不出自洽

## 该锁 vs 不该锁
| 层 | 内容 | 是否锁 |
|---|---|---|
| **What** | 边界（不做什么）、不变量、验收标准 | ✅ 锁 |
| **How** | 技术选型、实现路径、代码结构 | ❌ 不锁（是模型最强的决策空间） |

> **"Lock behavior, not implementation. More context, less control."**

## 五款工具横评
| 工具 | 哲学 | 适用 |
|---|---|---|
| [[Plan-Mode]] | AI 出方案、人审一次、用完即弃 | 80% 日常迭代 |
| [[Superpowers]] | 没有测试就没有代码 | 关键模块兜质量 |
| [[OpenSpec]] | Spec 是 Truth，代码是投影 | 受监管行业 / 超大系统 |
| [[Kiro]] | Spec 即 IDE | 愿意绑 Amazon 生态 |
| [[GStack]] | 角色即约束 | 个人 / 一人公司 |

## 三条选型原则
1. **可执行的 > 要人读的**（测试 > Spec）
2. **轻的 > 重的**（赌模型变强）
3. **一个 > 多个**（拒绝胶水）

## 未来判断
- **Spec 会变成 AI 的中间表示**——像汇编语言：重要但人不直接写
- 真正值得投资的不是 Spec 工具，是 **Context（知识库）+ Eval（测试）**
- SDD 赢了 2025–2027 的战役，但"人写 Spec"不是终局

## 与其他范式的关系
- 比 [[Vibe-Coding]] 多了显式中间产物
- 比 [[Harness-Engineering]] 缺了系统级闭环（自动质检、影子验证、治理 Agent）

## 在本 Wiki 中的出现
- [[sources/10-SDD五个常识全错了]]

## 相关
[[Vibe-Coding]] · [[Harness-Engineering]] · [[Plan-Mode]] · [[Superpowers]] · [[OpenSpec]] · [[Kiro]] · [[GStack]]
