---
type: concept
created: 2026-06-28
sources: ["[[sources/02-AI-PM-必须掌握-Harness-Engineering]]", "[[sources/03-Harness-Engineering-一期讲透]]"]
tags: [wiki, concept, AI编程, AI工程]
---

# Harness Engineering（驾驭工程）

继 Prompt Engineering、Context Engineering 之后，AI 工程领域的**第三次重心迁移**。

## 一句话定义
为 AI Agent 搭建一个包含**明确约束、可用工具链、自动验证标准和反馈闭环**的独立运行环境，使其在无人监督下自主、可靠地完成任务。

## 比喻
- 模型是引擎 → Harness 是方向盘和刹车
- 模型是马 → Harness 是马场的赛道、护栏、自动测速仪

## 与前两代的区别
详见 [[协作范式演进]]。核心区别：
- Context Engineering 决定 Agent 能**看到**什么
- Harness Engineering 决定系统能**预防**什么、**测量**什么、**修复**什么

## 推理三明治（Token ROI 视角）
| 层 | 模型 | 职责 |
|---|---|---|
| **顶（The Top Bun）** | 高推理（o1 / R1） | 把模糊需求拆成"确定性验收矩阵" |
| **中（The Meat）** | 低推理（GPT-4o-mini / 8B 端侧） | 原子任务的内容/代码填充 |
| **底（The Bottom Bun）** | 选择性高推理 | L1 脚本拦截 80%，L3 仅高风险断点唤醒 |

## 五大核心模块
1. **按需索引** — `AGENTS.md` 等目录文件，渐进式披露子文档
2. **代码拦截** — 能写死的规则绝不用 Prompt 建议；Lint / 结构化测试硬约束
3. **三层自动质检** — L1 硬规则 / L2 沙箱执行 / L3 高推理同行评审；报错信息写给 Agent 看并自带修复指令
4. **数据探针** — UI 自动化、日志查询、性能指标接口
5. **垃圾回收** — 后台治理 Agent + 影子系统验证 + 确定性回滚预案（防 Agent 指数级复制坏模式）

## 实战案例
- **[[Codex]] 团队**：3 人 / 5 个月 / 100 万行 / 0 行人工代码（[[sources/02-AI-PM-必须掌握-Harness-Engineering]]）
- OpenAI 与 Anthropic 的工程实践（[[sources/03-Harness-Engineering-一期讲透]]）

## 对 PM 的影响
从"流水线质检员"→"流水线架构师"。核心产出从 PRD/System Prompt → **环境的业务规则定义**。Harness 设计越严谨 → Agent 可自主时间越长 → 生产力上限越高。

## 与 Agentic AI 架构的呼应
[[Agentic-AI]] 的"治理域 / 弹性可观测域"（[[sources/08-企业级-Agentic-AI-架构设计]]）与 Harness Engineering 的五大模块在理念上高度同构，可视为面向企业的工程化对应实现。

## 在本 Wiki 中的出现
- [[sources/02-AI-PM-必须掌握-Harness-Engineering]]（中文 PM 视角）
- [[sources/03-Harness-Engineering-一期讲透]]（视频科普）
- [[sources/11-Managed-Agents]]（Anthropic：**如何让 harness 不过时** → [[Brain-Hands-Decoupling]]）
- [[sources/12-Parallel-Claude-C-Compiler]]（Anthropic：16 Agent 并行 → [[Parallel-Agent-Teams]]）
- [[sources/13-Harness-Design-Long-Running-Apps]]（Anthropic：generator-evaluator + sprint contract + **随模型变强主动简化**）
- 间接呼应：[[sources/07-OpenAI-Codex-负责人访谈]] · [[sources/08-企业级-Agentic-AI-架构设计]] · [[sources/15-Karpathy-Vibe-Coding-to-Agentic-Engineering]]

> **重要演进（2026 上半年）**：Anthropic 三篇工程博客让本概念从"理论框架"升级为"有具体一手实证 + 反向工程经验的工程学科"。三大新发现：
> 1. Harness 假设会随模型过时 → 用 [[Brain-Hands-Decoupling|Brain-Hands 解耦]]
> 2. 多 Agent 并行可达千倍人力杠杆 → [[Parallel-Agent-Teams]]
> 3. **模型变强时 harness 要主动减法**（不要"赌模型停滞"）

## 2026-06 金融业实证扩展

第四轮入库后，本概念在中国金融业有了首批一手实证：

- **银行业**：[[sources/72-金发20268号之后银行-AI-Agent-不能再裸奔了|金发 8 号文之后银行 AI Agent 不能再裸奔]] —— **监管端定义 Harness 边界**：银行 AI Agent 必须有审计追溯、权限分级、回滚预案
- **汽车金融**：[[sources/54-AI大模型杀疯汽车出口供应链金融风控效率翻番不良率大降这笔账太好算|AI 大模型杀疯汽车出口供应链金融风控]] —— Harness 在风控场景效率翻倍 + 不良率大降
- **多 Agent 安全实践**：[[sources/74-从AICon看Agent安全实践银行智能体的安全底线在哪里|银行智能体的"安全底线"]] —— AICon 现场提出 Agent 安全底线的工程实现

**模式总结**：金融业把 Harness 五大模块（按需索引 / 代码拦截 / 三层质检 / 数据探针 / 垃圾回收）翻译为：**审计追溯 / 权限分级 / 风控规则 / 监控告警 / 失败回滚**。形态不同，本质相同。

## 相关
[[Vibe-Coding]] · [[协作范式演进]] · [[Agentic-AI]] · [[Spec-Driven-Development]] · [[Agentic-Engineering]] · [[Brain-Hands-Decoupling]] · [[Parallel-Agent-Teams]] · [[金融智能体落地]] · [[汽车金融-AI-建设方向]]
