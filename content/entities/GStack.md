---
type: entity
category: SDD / 个人开发框架
created: 2026-06-28
sources: ["[[sources/10-SDD五个常识全错了]]"]
tags: [wiki, entity, AI编程, 一人公司]
---

# GStack

YC 掌门人 **Garry Tan** 开源，96K+ Star。23 个 slash command 覆盖 CEO / 产品经理 / 架构师 / QA / 安全官等角色。

## 设计哲学
**角色即约束**。不是模拟 23 个人，而是 **23 个专项技能**。Garry Tan 本人声称用此方案周均 **10K 行代码 / 100 个 PR**。

## 解决的真问题
不是 SDD 问题，是「**一个人怎么当一个团队**」的问题——它关心的是一个人能不能同时扮演 CEO 和 QA 而不精神分裂。

## 短板
- Prompt 驱动，没有持久化的 Spec 或测试约束 → 本质是**结构化的 Vibe Coding**
- 角色模拟质量完全依赖底层模型 → 换个弱模型，23 人团队就变 23 个实习生
- 对团队协作几乎没用——团队本身就是角色

## 适用判断
- ✅ 独立开发者 / 一人公司
- ❌ 团队（不是为团队场景设计）

## 在本 Wiki 中的出现
- [[sources/10-SDD五个常识全错了]]（个人项目偶尔用做产品思考，不算正式工具链）

## 相关
[[Superpowers]] · [[Plan-Mode]] · [[concepts/Vibe-Coding]] · [[concepts/Spec-Driven-Development]]
