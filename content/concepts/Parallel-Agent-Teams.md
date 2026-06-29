---
type: concept
created: 2026-06-28
sources: ["[[sources/12-Parallel-Claude-C-Compiler]]", "[[sources/13-Harness-Design-Long-Running-Apps]]", "[[sources/07-OpenAI-Codex-负责人访谈]]"]
tags: [wiki, concept, 多Agent, 并行]
---

# Parallel Agent Teams（并行 Agent 团队）

多个 Agent 实例在共享基础设施（git 仓库 / 数据库 / 文件系统）上**并行工作，无人主动干预**，通过任务锁与专门化分工避免冲突。

## 经典案例
[[sources/12-Parallel-Claude-C-Compiler]]：**16 Agent + 2000 sessions + $20K → 10 万行 Rust C 编译器**，能编译 Linux 6.9 + QEMU + FFmpeg + SQLite + PostgreSQL + Redis。

## 关键工程模式

### 1. 共享 git + 任务锁
- 多 Docker 容器共享同一 git 仓库
- `current_tasks/` 目录下的文本文件作为分布式锁
- git 自然冲突机制强制其中一个 Agent 选不同任务

### 2. 专门化角色
不是所有 Agent 都做同一件事：
- 核心实现 Agent
- 代码去重 Agent
- 性能优化 Agent
- 代码质量分析 Agent
- **设计批评（design criticism）Agent**
- 文档 Agent

### 3. Oracle 模式
当任务太大单 Agent 啃不动时（如整个 Linux kernel），引入**外部 oracle**（如 GCC）随机分配部分工作，让 Agent 工作于不同文件。

### 4. 测试是一切之最
> "**任务验证器必须接近完美，否则 Claude 解决错误的问题**。"

## 三 Agent 协作模式（[[sources/13-Harness-Design-Long-Running-Apps]]）
- **Planner**：扩 spec，不锁实现
- **Generator**：执行
- **Evaluator**：Playwright 真测打分
- 通过 **sprint contract**（双方先谈判可交付物）通信

## 跨厂商对照
| 厂商 | 实证 | 规模 |
|---|---|---|
| Anthropic | [[sources/12-Parallel-Claude-C-Compiler]] | 16 Agent / 100K Rust / Linux |
| OpenAI Codex 团队 | [[sources/07-OpenAI-Codex-负责人访谈]] | 3 人 / 5 个月 / 100 万行 / 0 行人工 |
| OpenClaw 用户 Peter | [[entities/OpenClaw]] | 18 终端跨 3 显示器 |

**两家顶尖 AI 公司殊途同归**：未来软件开发是 **Agent 团队 + 极少人工监督**。

## 风险（Anthropic 自评）
> "程序员部署他们从未亲自验证过的软件——这是个真实的担忧。"

## 与本 Wiki 的关系
- 与 [[Harness-Engineering]] 的"五大模块"互补：后者是单 Agent harness，本概念是多 Agent 协作架构
- 与 [[Agentic-AI]] 的"多 Agent 三种架构（垂直/水平/混合）"形成具体实现
- 印证 [[Spec-Driven-Development]] "测试 > Spec" 反共识

## 在本 Wiki 中的出现
- [[sources/12-Parallel-Claude-C-Compiler]]
- [[sources/13-Harness-Design-Long-Running-Apps]]
- [[sources/07-OpenAI-Codex-负责人访谈]]

## 相关
[[Harness-Engineering]] · [[Agentic-AI]] · [[Agentic-Engineering]] · [[Codex]] · [[OpenClaw]]
