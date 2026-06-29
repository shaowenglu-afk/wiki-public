---
type: concept
created: 2026-06-29
updated: 2026-06-29
tags: [wiki, concept, 智能体, 架构, 企业级, 2026综述, 控制平面]
sources:
  - "[[sources/68-Tyk-AI-Agent-Orchestration-Enterprise-Guide]]"
  - "[[sources/69-ISG-Agentic-Orchestration-Governance-First]]"
  - "[[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]]"
  - "[[sources/71-RTSLabs-7-Core-Layers-Enterprise-Agentic-AI]]"
  - "[[sources/72-VDF-AI-Agent-Platforms-7-Patterns-2026]]"
  - "[[sources/73-Internative-Multi-Agent-Enterprise-6-Patterns]]"
  - "[[sources/74-ClarityArc-Agentic-AI-Architecture-Enterprise-2026]]"
  - "[[sources/75-arXiv-Agentic-AI-Architectures-Taxonomies-Evaluation]]"
  - "[[sources/76-Tencent-MAS-从笨重设计到多智能体架构]]"
  - "[[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]"
  - "[[sources/78-Tencent-企业级Agent-AI-Native架构设计与实践]]"
  - "[[sources/79-Grapecity-Enterprise-AI-Agent-Whitepaper-2026]]"
---

# 企业 AI 智能体应用架构 — 2026 全景综述

> **一句话**：2026 H1 是企业级智能体架构**从 POC 到生产**的分水岭年——业界（Tyk / VDF / MLflow / ISG / 腾讯 / 葡萄城）**收敛**到一套清晰的层化 + 模式化体系：**控制平面（Control Plane）+ 多 Agent 编排 + 全栈治理**。

---

## 🎯 6 大行业共识（来自 12 篇一手源对照）

### 共识 1：架构 ≠ 模型（全栈是地基）

| 来源 | 表述 |
|---|---|
| [[sources/71-RTSLabs-7-Core-Layers-Enterprise-Agentic-AI]] | **"把 Agent 当 LLM 集成的企业会在生产规模处卡死"** |
| [[sources/78-Tencent-企业级Agent-AI-Native架构设计与实践]] | **AI 集成 ≠ AI Native**：加 AI 功能 vs 用 AI 重构 |
| [[sources/69-ISG-Agentic-Orchestration-Governance-First]] | **企业 AI 挑战不再是模型性能，是控制平面设计** |

### 共识 2：多 Agent 是 2026 默认（单体 Agent 已被淘汰）

| 来源 | 表述 |
|---|---|
| [[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]] | **Monolithic 原型快、生产脆**——Google Bake-Off 实证 1h→10min |
| [[sources/73-Internative-Multi-Agent-Enterprise-6-Patterns]] | **2026 下半年生产 = 多 Agent + 控制器** |
| [[sources/76-Tencent-MAS-从笨重设计到多智能体架构]] | **笨重设计三宗罪**——必须转 MAS |
| [[sources/74-ClarityArc-Agentic-AI-Architecture-Enterprise-2026]] | 多 Agent = 组织最大价值释放点 |

### 共识 3：Manager Pattern 是主导编排模式

**模式**：高智能模型编排 + 小快便宜模型执行（与 [[concepts/Brain-Hands-Decoupling]] 高度一致）

| 来源 | 表述 |
|---|---|
| [[sources/74-ClarityArc-...]] | **"编排 Agent 不干活，它管理干活的 Agent"** |
| [[sources/73-Internative-...]] | Hierarchical / Manager-Worker 模式 |
| [[sources/68-Tyk-AI-Agent-Orchestration-Enterprise-Guide]] | Hierarchical 是企业默认推荐 |
| [[sources/76-Tencent-MAS-...]] | Router + Executor + Auditor |

### 共识 4：协议层标准化（MCP + A2A）

| 协议 | 用途 | 治理 |
|---|---|---|
| **[[entities/MCP-Model-Context-Protocol]]** | 工具暴露 | Anthropic 主导，2025-11 升级 OAuth 2.1 |
| **[[entities/A2A-Protocol]]** | Agent 间通信 | **Linux Foundation 治理**（2025 IBM ACP 合并）|

**金句**（ISG）：**"MCP + A2C = vendor-neutral control plane 的连接组织"**

### 共识 5：状态外部化（生产必备）

**单 LLM 会话内存太脆**——必须外部化到：
- **数据库**：Redis / Postgres
- **持久化执行引擎**：[[entities/Temporal]] / Inngest / Restate
- **图编排框架**：[[entities/LangGraph]] checkpointer
- **协议自带**：A2A 的 Task 对象含 contextId

**腾讯版**（[[sources/78-Tencent-...]]）：4 层记忆体系
- 工作记忆（短期，会话内）
- 情景记忆（跨会话）
- 语义记忆（知识库）
- 程序性记忆（SOP / Skill）

### 共识 6：治理是基础设施，不是软护栏

| 来源 | 关键技术 |
|---|---|
| [[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]] | **Privilege Rings + Kill Switches**（Microsoft AGT v3.6.0）|
| [[sources/74-ClarityArc-...]] | **Bain 阶段化**：治理必先于编排和规模 |
| [[sources/72-VDF-AI-Agent-Platforms-7-Patterns-2026]] | **Observability & Audit Plane**（第 7 模式）|
| [[sources/79-Grapecity-Enterprise-AI-Agent-Whitepaper-2026]] | **智能体独立身份体系 + 细粒度策略引擎** |

---

## 📐 4 大架构参考模型对照

### 模型 A：Tyk 4 组件（编排为中心）
1. **Orchestration Engine**（编排引擎）
2. **State Management Layer**（状态管理层）
3. **Policy & Governance Engine**（策略与治理引擎）
4. **Tool Layer**（工具层）

### 模型 B：RTSLabs 7 层（全栈分层）
1. Experience & Interface
2. Orchestration & Workflow
3. Agent & Reasoning
4. Tools & Integrations
5. Data & Knowledge
6. Observability & Control
7. Platform Infrastructure & Governance

### 模型 C：腾讯 7+2（中国语境）
**垂直 7 层**：业务应用 / 应用网关 / Agent Core / AI 网关 / 大模型 / 知识&数据 / 基础设施
**2 横切**：可观测&评估 / 安全治理&合规

### 模型 D：ClarityArc 3 层（极简层）
1. Data & Integration Foundation
2. Governance & Controls
3. Orchestration & Agent Coordination

---

## 🧩 7 大模式（VDF AI）vs 6 大模式（Internative）vs 4 大拓扑（arXiv）

| VDF AI 7 模式 | Internative 6 模式 | arXiv 拓扑 |
|---|---|---|
| Orchestrator-Worker | Hierarchical / Manager-Worker | **Tree** |
| Supervisor-Router | Router | — |
| RAG Grounding | Tool-Using | **Graph** |
| Model Gateway | — | — |
| HITL Gates | Critic-Verifier Loop | — |
| Evaluation Loop | — | — |
| Audit Plane | — | — |
| — | Planner-Executor | **Chain** |
| — | Swarm / Parallel | **Mesh** |

**Internative Koordex 实战经验**：**典型生产架构层叠 3-5 个模式**

---

## 🛠 框架对比（4 主流 + 1 协议）

| 框架 | 治理 | Sandboxing | 最适合 |
|---|---|---|---|
| **Microsoft AGT** | 原生策略引擎 + privilege rings | 容器 | 受监管企业 |
| **Google ADK** | Supervisor 层 | 有限 | 多 Agent 性能流水线 |
| **[[entities/LangGraph]]** | 手动接线 | 无原生 | 定制图工作流 |
| **MLflow Agent Platform** | 策略中间件 + AI Gateway | 外部 | 评估 + 观测合一 |
| **[[entities/MCP-Model-Context-Protocol]]** | （协议层）| — | **无论选哪个编排框架都该用** |

**中国语境补充**（腾讯 7+2）：**LangGraph / MAF / Spring AI Alibaba / Dify** 是 Agent Core 层 4 选项

---

## 📊 生产时间线预期（RTSLabs 实证）

| 部署形态 | 时间 | 首要变量 |
|---|---|---|
| **单 Agent + 治理** | **6-12 个月** | 数据平台成熟度 |
| **多 Agent + 完整可观测 + 合规** | **12-18 个月** | 同上 + 治理基础 |

---

## ✅ 采用次序（Bain + RTSLabs + 葡萄城综合）

> ⚠️ **不可跳跃**——跳过某一步会在下一步处卡死

1. **选一个高频低风险场景**（不是最复杂的）
2. **单 Agent + 确定性编排** + 第一天就加可观测和评估管道
3. **形式化数据与知识层**：治理化检索 + lineage
4. **加治理层**：策略引擎 + RBAC + HITL
5. **单 Agent 跑通后才引入多 Agent 模式**
6. **平台级治理 + 工具注册中心 + 标准化生命周期管理**

---

## ⚙️ 关键能力清单（工程师视角）

### 必备能力
- [ ] **Orchestrator-Worker** 拆解
- [ ] **Manager Pattern** 编排
- [ ] **MCP 工具集成**
- [ ] **状态外部化**（Redis / Temporal / LangGraph checkpointer / 4 层记忆）
- [ ] **HITL 审批门禁**（高风险动作）
- [ ] **可观测**（OpenTelemetry + Token / 延迟 / 成本）
- [ ] **评估**（LLM-as-a-Judge + 离线评估 + 在线评估）
- [ ] **审计平面**（端到端合规轨迹）
- [ ] **Prompt 注入防护**
- [ ] **RBAC 权限边界**

### 进阶能力
- [ ] **A2A 协议**（跨厂商 Agent 通信）
- [ ] **Model Gateway**（多模型路由 + 成本控制）
- [ ] **Privilege Rings + Kill Switches**（治理基础设施化）
- [ ] **Critic-Verifier 循环**（输出验证）
- [ ] **Agentic RAG**（vs Naive RAG）

---

## 🚨 三大反共识（来自不同 source 实证）

### 反共识 1：单体 Agent 是陷阱（[[sources/70-MLflow-...]]）
> "Monolithic agent designs are deceptively easy to prototype but brittle in production."

### 反共识 2：多 Agent 不能"什么都用"（[[sources/73-Internative-...]]）
> "**The Three Mistakes Most Teams Make**: Multi-Agent for everything; No Verifier; No Observability."

### 反共识 3：治理必先于编排（[[sources/74-ClarityArc-...]]）
> "**Bain's phased approach is explicit on sequencing: governance must precede orchestration and scale.**"

---

## 🔮 2026 H2 趋势预测（综合 12 源）

| 趋势 | 信号源 |
|---|---|
| **A2A 协议成为跨厂商标准** | [[sources/68-Tyk-...]] / [[sources/69-ISG-...]] |
| **Model Gateway 进入标配** | [[sources/72-VDF-...]] / [[sources/77-Tencent-...]] |
| **AgentOS 概念正式化** | [[sources/76-Tencent-MAS-...]] |
| **APaaS（Agent Platform as a Service）** | [[sources/78-Tencent-...]] |
| **EDD (Eval-Driven Development) 替代 TDD** | [[sources/78-Tencent-...]] |
| **Privilege Rings + Kill Switches 进入主流框架** | [[sources/70-MLflow-...]] |

---

## 🔗 在本 Wiki 中的关系

### 上层抽象
- [[concepts/Agentic-AI]] — Agentic AI 整体框架
- [[concepts/Agentic-Engineering]] — Karpathy 的元学科

### 同层 / 互补
- [[concepts/Harness-Engineering]] — 单体 Agent 工程化纪律（本页是平台级延伸）
- [[concepts/Brain-Hands-Decoupling]] — Session/Harness/Sandbox 三层解耦（Manager Pattern 的理论基础）
- [[concepts/Parallel-Agent-Teams]] — 多 Agent 并行（本页是规模化延伸）
- [[concepts/低代码-vs-高代码-智能体建设]] — 路径选择（本页是高代码 + 平台路径详解）

### 下层细化
- [[concepts/AI-工作流平台对比]] — 具体平台选型（Coze/Dify/n8n）
- [[concepts/金融智能体落地]] — 金融行业落地实证
- [[concepts/汽车金融-AI-建设方向]] — 汽车金融垂直应用

### 实体
- [[entities/MCP-Model-Context-Protocol]] · [[entities/A2A-Protocol]] · [[entities/LangGraph]]
- [[entities/Tyk]] · [[entities/Microsoft-AGT]] · [[entities/Google-ADK]] · [[entities/MLflow-Agent-Platform]]
- [[entities/Temporal]] · [[entities/Dify]] · [[entities/Kong]] · [[entities/Higress]] · [[entities/Guardrails-AI]]

---

## 💡 一句话总结

> **2026 企业 AI Agent 架构 = 控制平面 + 多 Agent 编排 + 全栈治理。**
> **6 大行业共识收敛、3 大反共识警示、12-18 月生产时间线、Bain 阶段化不可跳。**
> **架构的胜利不是模型的胜利，是治理基础设施的胜利。**
