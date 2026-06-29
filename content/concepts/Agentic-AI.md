---
type: concept
created: 2026-06-28
sources: ["[[sources/08-企业级-Agentic-AI-架构设计]]", "[[sources/09-中投-2026-AI产业深度报告]]", "[[sources/07-OpenAI-Codex-负责人访谈]]"]
tags: [wiki, concept, Agent, 企业架构]
---

# Agentic AI

具备**目标感和自主性**的智能框架，支持 AI Agents 在无需持续人工干预下完成复杂任务。

## 与 AI Agent 的关系
"**城市与车辆**"（[[sources/08-企业级-Agentic-AI-架构设计]]）：
- **Agentic AI** = 城市（统一基础设施 + 规则：任务编排、权限风控、可观测评测）
- **AI Agents** = 车辆（在框架内承担具体角色：上新 / 定价 / 补货 / 客服 / 风控）

## 三大架构类型（协作模型）
| 架构 | 特征 | 适用 |
|---|---|---|
| **垂直** | 主 Agent 统筹，子 Agent 分工执行向其汇报 | 集中控制、子任务可分解 |
| **水平** | 平等协商、共享记忆 | 集思广益 / 多专家共同决策 |
| **混合** | 组合上面两种 | 复杂业务流程 |

## 设计方法论四步
1. 清晰的协作模型
2. 明确定义的 Agent 边界（能做 / 不能做 / 与其他 Agent 的职责划分）
3. 可调整可追踪的推理策略
4. 可控可评测（可观测性 / 资源控制 / 故障恢复 / 目标驱动评估）

## 核心组件三大域
- **服务域**：Agent 服务 / 通信协议（[[#通信协议]]）/ 服务发现
- **治理域**：安全（网络/传输/内容三层）/ 护栏（Guardrail）
- **弹性可观测域**：限速重试断路器 / 监控指标

## 通信协议
| 协议 | 发布者 | 适用 |
|---|---|---|
| **MCP** | Anthropic | IDE/聊天应用的插件、DB、API 集成 |
| **A2A** | Google | 跨供应商企业级 Agent 编排 |
| **ANP** | 社区 | 跨组织/多域开放 Agent 网络 |

## 关键工程经验
- ⚠️ 单次 LLM 请求注入 **> 20 个 Agent 服务** → 调用精准度急剧下降
- ✅ Agent 服务和大模型调用前后都用 **Guardrail** 做安全检查
- ✅ 通信协议**插件化**接入，预留适配层（协议本身仍在快速迭代）

## 演进阶段（零一万物）
- L1 工作流 Agent → L2 推理 Agent → **L3 多智能体**（基于目标的智能协作与结果交付）

## 市场数据（[[sources/09-中投-2026-AI产业深度报告]]）
- 全球 2025 → 2032：138.1 亿 → 1408 亿美元（CAGR 39.3%）
- 中国 2025 突破 232 亿元，CAGR 120%
- **2026 = 企业 Agent 上岗元年**
- 活跃 Agent 数：2025 ≈ 2860 万 → 2030 ≈ 22.16 亿
- 资金流向 "4-3-3"：40% 基础设施 / 30% 管理平台 / 30% 场景应用

## 在本 Wiki 中的出现
- [[sources/08-企业级-Agentic-AI-架构设计]]（AWS 工程方法论）
- [[sources/09-中投-2026-AI产业深度报告]]（市场视角）
- [[sources/07-OpenAI-Codex-负责人访谈]]（编程 Agent 实例）
- [[sources/11-Managed-Agents]]（Anthropic 托管服务架构）
- [[sources/12-Parallel-Claude-C-Compiler]]（多 Agent 并行实证）
- [[sources/13-Harness-Design-Long-Running-Apps]]（generator-evaluator 三 Agent）
- [[sources/14-MCP-Tools-Empirical-Study]]（17.7 万工具 + 软件开发 67%）
- [[sources/15-Karpathy-Vibe-Coding-to-Agentic-Engineering]]（"Agent 作为 installer"、"Software 3.0"）
- [[sources/16-信通院-企业级智能体报告-2026]]（中国官方智库）
- [[sources/17-Figma-Agents-Config-2026]]（"Agent 作为协作者而非工具"）

> **多 Agent 架构分类的跨厂商共识**：AWS（[[sources/08-企业级-Agentic-AI-架构设计]]）的「垂直/水平/混合」与中国信通院 / 中国工业互联网研究院的「层级式/平等式/混合式」是同一分类法的不同命名。
>
> **2026 上半年新发现**：
> - [[entities/MCP-Model-Context-Protocol|MCP]] 已成 Agent 工具生态事实标准
> - 编程 Agent 占工具下载量 90% → [[Parallel-Agent-Teams|并行 Agent 团队]] 是主流形态
> - "Agent 作为协作者"（Figma）与"Agent 作为 installer"（Karpathy）是 C 端 UX 的两个收敛比喻

## 相关
[[Harness-Engineering]] · [[Agentic-Engineering]] · [[Brain-Hands-Decoupling]] · [[Parallel-Agent-Teams]] · [[Codex]] · [[OpenClaw]] · [[MCP-Model-Context-Protocol]]
