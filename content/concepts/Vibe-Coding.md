---
type: concept
created: 2026-06-28
sources: ["[[sources/02-AI-PM-必须掌握-Harness-Engineering]]", "[[sources/10-SDD五个常识全错了]]", "[[sources/07-OpenAI-Codex-负责人访谈]]"]
tags: [wiki, concept, AI编程]
---

# Vibe Coding

依靠直觉 Prompt + 长对话来"聊"出代码的模式。**Demo 阶段惊艳，工业级一定崩塌。**

## 一句话定义
模型无法精准理解真实意图时，开发者依赖冗长 Prompt 不断对话产出代码——产出物从"文字"变成"代码"，但本质仍是脆弱的语言交互。

## 致命局限（[[sources/02-AI-PM-必须掌握-Harness-Engineering]]）
- 缺乏硬约束 → 每次新功能都会破坏旧逻辑
- 长线任务 → 极易陷入失忆与死循环
- 项目终局 → 无一例外变成"无法维护的屎山"

## 不同立场
- **林航旗**（[[sources/02-AI-PM-必须掌握-Harness-Engineering]]）：必须升级到 [[Harness-Engineering]]，AI PM 必须告别 Vibe Coding
- **Dolphin7**（[[sources/10-SDD五个常识全错了]]）：把 [[GStack]] 称为"结构化的 Vibe Coding"，褒贬中性
- **Codex 团队**（[[sources/07-OpenAI-Codex-负责人访谈]]）：有些团队自豪说"整个应用都是 vibecoded"，但 Codex 本身**绝大部分代码由 Agent 生成，仍投入大量精力思考系统**，确保高品质
- **Karpathy（造词者本人，一年后）**（[[sources/15-Karpathy-Vibe-Coding-to-Agentic-Engineering]]）：vibe coding 一年后他亲自宣告"**自己作为程序员从未感觉如此落后**"，并提出 **[[Agentic-Engineering]]** 作为建立在 vibe coding 之上的更严肃学科。"Vibe coding 是 prompt 一下试运气，Agentic Engineering 是把这个'试'变成系统。"

## 升级路径
| 阶段 | 关键差异 |
|---|---|
| Vibe Coding | 没有硬约束、靠 Prompt 直觉 |
| [[Spec-Driven-Development]] | 有 Spec / 测试 / 计划等显式中间产物 |
| [[Harness-Engineering]] | 系统级闭环：约束 + 自动质检 + 反馈 + 治理 |
| [[Agentic-Engineering]] | 元学科：把上述全部纳入可重复 / 可迭代 / 可演化的工程生命周期 |

## 在本 Wiki 中的出现
- [[sources/02-AI-PM-必须掌握-Harness-Engineering]]
- [[sources/10-SDD五个常识全错了]]
- [[sources/07-OpenAI-Codex-负责人访谈]]

## 相关
[[Harness-Engineering]] · [[Spec-Driven-Development]] · [[协作范式演进]] · [[GStack]]
