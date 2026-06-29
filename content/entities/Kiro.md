---
type: entity
category: SDD 工具 / IDE
created: 2026-06-28
sources: ["[[sources/10-SDD五个常识全错了]]"]
tags: [wiki, entity, SDD, Amazon]
---

# Kiro

Amazon 推出的 **Spec 即 IDE**。把 SDD 全流程焊进 IDE，正式替代 Amazon Q Developer。

## 时间线
- 2025-07 公测
- 2025-11 GA
- 2026-05 全球
- 2027-04 旧版 Amazon Q Developer IDE 插件停服

## 技术栈
- 底层：Claude Sonnet + Nova（Bedrock）
- 自然语言自动转 **EARS 句式**：`WHEN [条件] THE SYSTEM SHALL [行为]`（Rolls-Royce 的需求工程格式，天然可测试）
- 三种工作流：Requirements-First / Design-First / Quick Plan
- 任务执行：每个任务 spawn 独立 Subagent 并行
- Hooks 机制：文件保存时触发自动化

## 优势
- 从需求到代码的体验最丝滑
- **EARS 句式是真正的工程价值创新**——结构化需求天然可转测试

## 短板
- Code OSS 魔改版，编辑器 / 插件 / 快捷键全要迁移
- Spec 产物锁在 Kiro 项目结构里，离开带不走
- 模型只能用 Bedrock，不能换
- IDE 锁定 + AWS 生态绑定

## 适用判断
- 你的开发流程愿意和 Amazon 产品路线图绑定 → 用
- 否则 → [[sources/10-SDD五个常识全错了]] 作者明确不用

## 在本 Wiki 中的出现
- [[sources/10-SDD五个常识全错了]]

## 相关
[[Superpowers]] · [[OpenSpec]] · [[Plan-Mode]] · [[concepts/Spec-Driven-Development]]
