---
type: source
created: 2026-06-28
source_date: 2026-02-05
author: Nicholas Carlini
original: "[[Clippings/2026-02-05 用并行 Claude 团队从零写 C 编译器.md]]"
external_url: "https://www.anthropic.com/engineering/building-c-compiler"
tags: [wiki, source, Anthropic, parallel-agents, Agent]
---

# 用并行 Claude 团队写 C 编译器（Anthropic）

> Anthropic 工程博客，作者 Nicholas Carlini（Safeguards 团队），2026-02-05。

## TL;DR
**16 个并行 Agent + 2000 次 Claude Code 会话 + $20,000 = 10 万行 Rust 写的 C 编译器**，能编译 Linux 6.9（x86/ARM/RISC-V）+ QEMU/FFmpeg/SQLite/PostgreSQL/Redis，通过 99% 编译器测试套件。

## 关键数据
- 16 Agents / 2000 sessions / $20K / 10 万行 Rust
- 消耗 **20 亿输入 token + 1.4 亿输出 token**
- 两周完成
- Linux 6.9 三架构通过

## 工程模式
- **多 Docker 容器共享 git 仓库**
- **任务锁机制**：`current_tasks/` 目录下的文本文件锁
- 不让 Claude 啃整个 Linux kernel → **GCC 当 oracle**，随机分配
- 专门化 Agent：去重、性能、代码质量、设计批评、文档

## 三大核心经验
1. **测试质量是一切之最** — "任务验证器必须接近完美，否则 Claude 解决错误的问题"
2. **为模型设计** — 不按"人会怎么测"，而是按 Claude 的能力和局限优化环境
3. **专门化 + 并行** — 多角色协作 + 物理并行

## 已知局限
- 缺 16-bit x86 生成器（输出近 32KB 限制的 2 倍）
- 缺自定义汇编器/链接器
- 生成代码效率不及 GCC
- Rust 代码质量低于专家水平

## 关键引述
> "The thought of programmers deploying software they've never personally verified is a real concern."

## 与本 Wiki 的关系
- 引入新概念 [[concepts/Parallel-Agent-Teams]]
- 与 [[entities/Codex]]"3 人 5 个月 100 万行"形成**同主题、双厂商对照**——两家顶尖 AI 公司殊途同归
- "测试是真理"再次得到 Anthropic 一手验证 → 强化 [[entities/Superpowers]] 的核心哲学

## 涉及实体 / 概念
[[concepts/Parallel-Agent-Teams]] · [[concepts/Harness-Engineering]] · [[concepts/Agentic-AI]]
