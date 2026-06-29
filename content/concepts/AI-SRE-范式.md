---
type: concept
created: 2026-06-29
updated: 2026-06-29
tags: [wiki, concept, AI-SRE, AIOps, 2026]
sources:
  - "[[sources/85-AI-SRE-2026-Guide-Augment-Code]]"
  - "[[sources/86-AI-SRE-vs-AIOps-Arvo-AI]]"
  - "[[sources/87-Google-SRE-Agentic-AI]]"
  - "[[sources/97-Middleware-OpsAI-AI-SRE-Agent]]"
  - "[[sources/80-Why-AI-Agents-Fail-at-Cloud-RCA-arXiv]]"
  - "[[sources/81-MetaRCA-Generalizable-RCA-Framework-arXiv]]"
  - "[[sources/84-LATS-RCA-Language-Agent-Tree-Search-arXiv]]"
  - "[[sources/94-码农视角-AI诊断和修复问题三个反直觉优势]]"
  - "[[sources/95-新浪微博-AI-Agent协作运维落地与演进]]"
---

# AI SRE 范式

## 🎯 定义

**AI SRE（AI Site Reliability Engineering）** = 用 **LLM Agent** 把传统 SRE 实践（事件响应 / 根因分析 / postmortem）**自动化、规模化、24×7 化**。

**与 AIOps 互补**（不替代）：
- **AIOps**：事前去噪（告警聚类）
- **AI SRE**：事后调查（根因 + 补救）

详见：[[concepts/AIOps-2026-全景综述]]

---

## 📈 5 大转变（vs 传统 SRE）

来自 [[sources/85-AI-SRE-2026-Guide-Augment-Code]]：

| # | 维度 | 传统 SRE | AI SRE |
|---|---|---|---|
| 1 | **响应模式** | 告警 → 人 on-call | 告警 → Agent 自动调查 |
| 2 | **MTTR** | 30-90 分钟 | **5-10 分钟**（减 70-80%）|
| 3 | **推理能力** | 单点 + 人工切 5 个 tab | **跨系统**单 context 关联 |
| 4 | **修复** | 人工 rollback | **高置信低风险自主修复**，人审高风险 |
| 5 | **Postmortem** | 人工写 1-2 天 | **Agent 自动起草**，人编辑 |

---

## 🏗️ 标准 5 Agent 架构

来源：[[sources/97-Middleware-OpsAI-AI-SRE-Agent]] + [[sources/93-大型集团IT运维智能体平台详细设计方案]]

1. **Observer Agent** — 监听 PagerDuty/Opsgenie 告警流
2. **Investigation Agent** — ReAct 循环并行调用 LogQL/PromQL/deploy API
3. **Reasoning Agent** — 证据合成 → 根因假设 + 置信度
4. **Action Agent** — HITL 审批 → 执行（rollback/scale/config 变更）
5. **Reporter Agent** — Markdown postmortem + 更新 Jira/Linear

---

## 📊 生产实证

| 案例 | MTTR | 来源 |
|---|---|---|
| **iFood**（Datadog Bits AI SRE）| **-70%** | [[sources/85-AI-SRE-2026-Guide-Augment-Code]] |
| **American Express**（Traversal）| **-32%**，准确率 **82%** | [[sources/85-AI-SRE-2026-Guide-Augment-Code]] |
| **Datadog 内部** | 调查快 **2x** | [[sources/85-AI-SRE-2026-Guide-Augment-Code]] |
| **Middleware OpsAI 客户** | **-70%**，告警到根因 **5 分钟** | [[sources/97-Middleware-OpsAI-AI-SRE-Agent]] |

---

## 🚨 反共识：失败模式

### 反共识 1：失败源于**架构**，不是模型能力
来源：[[sources/80-Why-AI-Agents-Fail-at-Cloud-RCA-arXiv]]
- 1675 次 Agent 运行实证 → 12 种 pitfall
- **Prompt 优化救不了**
- 加强 inter-agent 通信能降 15%

### 反共识 2：学术 benchmark ≠ 真实生产
来源：[[sources/84-LATS-RCA-Language-Agent-Tree-Search-arXiv]]
- LO2 基准 91.3% → 真实生产 **仅 65.1%**
- 真实世界：多因素根因 / 规模复杂度 / 不完整可观测性

### 反共识 3：AI 优势其实是反直觉的
来源：[[sources/94-码农视角-AI诊断和修复问题三个反直觉优势]]
- 不被自己代码束缚
- 凌晨 3 点和白天表现一致（不疲劳）
- 可并行 evaluate 多条假设（人脑串行）

---

## 🛠️ 2026 工具栈

### 开源
- [[entities/HolmesGPT]] — 调查 Agent
- [[entities/K8sGPT]] — K8s 诊断
- Aurora — 多云沙箱

### 商业
- [[entities/Datadog-Bits-AI-SRE]] — 企业级旗舰
- [[entities/Middleware-OpsAI]] — 中端轻量
- Resolve.ai / Traversal / PagerDuty SRE Agent

### 底层
- [[entities/OpenTelemetry]] / [[entities/MCP-Model-Context-Protocol]]
- Gemini / Claude / GPT
- [[entities/Google-ADK]] / LangGraph / AutoGen

---

## ✅ 采用路线（4 步）

来自 [[sources/85-AI-SRE-2026-Guide-Augment-Code]]：

1. **选范围**：高频低风险事件（不是最复杂的）
2. **集成工具链**：observability + ticketing + chat
3. **评估准确率**：在过去事件 backlog 上回测
4. **扩到自主修复**：先建议，后执行

---

## 🚧 4 大陷阱

| 陷阱 | 后果 |
|---|---|
| 没上游降噪就买 AI SRE | LLM 推理成本烧在假阳性上 |
| 不带可解释性的 Agent | 不能信任做 prod 变更 |
| 跳过评估直接上 prod | 用户当 QA |
| 高风险变更没 HITL | 灾难 |

---

## 🔗 在本 Wiki 中

- 上承：[[concepts/AIOps-2026-全景综述]]（AI SRE 是其事后侧）
- 平行：[[concepts/AI-可观测性-四维追踪]]（可观测层基础）
- 实体：[[entities/HolmesGPT]] · [[entities/Middleware-OpsAI]] · [[entities/Datadog-Bits-AI-SRE]] · [[entities/Google-ADK]]

---

## 💡 一句话总结

> **AI SRE = LLM Agent 重写事件响应循环。**
> **MTTR -70%、5 分钟从告警到根因，是 2026 行业基线（iFood / AMEX / Google 一手数据）。**
> **架构是杠杆，不是模型；HITL 是必需，不是 nice-to-have。**
