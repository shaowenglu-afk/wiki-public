---
type: concept
created: 2026-06-30
tags: [wiki, concept, AIOps, AI-SRE, 运维转型, 职业发展, 技能体系]
sources:
  - "[[sources/113-Google-SRE-AI-白皮书-Tony-Bai解读]]"
  - "[[sources/114-AI运维进化拐点-可版本化Skills]]"
  - "[[sources/115-AIOps-Skills-Matrix-2026]]"
  - "[[sources/116-CTAIO-AI-SRE-Converging-Model]]"
  - "[[sources/117-Selector-AIOps-Engineer-Responsibilities]]"
  - "[[sources/118-Equinix-JD-Staff-Engineer-Agentic-AIOps]]"
  - "[[sources/119-Grras-AI-Skills-DevOps-2026]]"
  - "[[sources/120-51CTO-AI运维-定义指标技能职业发展]]"
  - "[[sources/121-腾讯云-道心不死-赌运维生涯]]"
  - "[[sources/122-北塔-脚本编写者-向算法调优师转型]]"
  - "[[sources/123-TechCrunch-Engineering-Jobs-Resilient]]"
  - "[[sources/124-Obsium-AI-Cant-Replace-SRE-Yet]]"
  - "[[sources/125-BCG-AI-Reshape-More-Than-Replaces]]"
---

# AI 时代运维转型与技能体系

> **一句话**：AI 不会取代运维，**会用 AI 的运维会取代不会用的**。2026 是运维行业有史以来**最大范式转移**——传统脚本时代 → Agentic AIOps 时代。

---

## 🎯 4 大行业共识（跨 13 篇 source 综合）

### 共识 1：运维不会消失，会被**增强**（数据支撑）
来源：[[sources/123-TechCrunch-Engineering-Jobs-Resilient]] + [[sources/125-BCG-AI-Reshape-More-Than-Replaces]]
- **TechCrunch**：2026 工程师岗位部分细分 **+8-12%**
- **BCG**：75% 增强型 / 20% 重塑型 / **仅 5% 真正替代**
- 运维 SRE 属**增强型**

### 共识 2：传统技能贬值，新技能溢价
来源：[[sources/121-腾讯云-道心不死-赌运维生涯]] + [[sources/122-北塔-脚本编写者-向算法调优师转型]]
- 老技能（手工 + 写脚本）→ 贬值
- 新技能（Agent 编排 + Skill 设计 + Context Engineering）→ 溢价
- **"AI 不替代你，会用 AI 的人替代你"**

### 共识 3：角色融合，跨界成为必修
来源：[[sources/116-CTAIO-AI-SRE-Converging-Model]]

```
   Cloud Engineering（K8s/IaC/微服务）
            ↓
SRE（SLO/Postmortem）  ←→  AI Engineering（LLM/Agent/RAG）
            ↘    ↙
          AI SRE ⭐
```

**未来 2 年招聘市场最稀缺岗位就是 AI SRE**。

### 共识 4：经验沉淀化、版本化是新工程方向
来源：[[sources/114-AI运维进化拐点-可版本化Skills]] + [[sources/113-Google-SRE-AI-白皮书-Tony-Bai解读]]
- **Skill = 可版本化数字资产**（不再藏脑子里）
- Google 内部 **IRM-Analyzer** 把人类救火轨迹转化为黄金训练数据
- "**Skills as Code**" 是 AIOps 的分水岭

---

## 📐 4 阶段运维角色演进（北塔模型）

来源：[[sources/122-北塔-脚本编写者-向算法调优师转型]]

| 阶段 | 角色 | 代表能力 | 现在多少人在这里 |
|---|---|---|---|
| 1.0 | **手工运维** | 命令行操作 | <5% |
| 2.0 | **脚本编写者** | Shell / Python / Ansible | ~40% |
| 3.0 | **平台架构师** | IaC / GitOps / K8s | ~40% |
| **4.0** | **算法调优师** ⭐ | **AI 模型阈值 / Prompt / Skill / Agent 编排** | ~15% 且快速增长 |

---

## 📊 三级能力矩阵（AIOps Community）

来源：[[sources/115-AIOps-Skills-Matrix-2026]]

### Level 1: Foundational Practitioner（基础实践者）
- 传统 monitoring / alerting / Prometheus / Grafana
- 写 PromQL / 简单脚本

### Level 2: Applied AIOps Engineer（应用工程师）⭐ 招聘主力
- 熟悉 **LLM + Agent 框架**（LangChain / LangGraph）
- 会写 **Prompt + 工具链调用**
- 可观测 **Prompt / Tool / Trace / Token 4 维**
- 理解 RCA 自动化原理

### Level 3: Strategic AIOps Architect（架构师）
- 设计多 Agent 协作架构
- build vs buy 决策
- 安全 + 合规 + 治理整体设计
- 跨团队推动

---

## 🛠️ 5 大必学技能（综合 [[sources/119-Grras-AI-Skills-DevOps-2026]] + [[sources/120-51CTO-AI运维-定义指标技能职业发展]]）

| # | 技能 | 工具 |
|---|---|---|
| 1 | **LLM API 调用** | OpenAI / Anthropic / Bedrock |
| 2 | **Prompt 工程** | 不只 Q&A，含 ReAct / CoT / 结构化输出 |
| 3 | **Agent 框架** | LangChain / LangGraph / [[entities/Google-ADK]] / Claude Agent SDK |
| 4 | **RAG + Vector DB** | Pinecone / Weaviate / Chroma |
| 5 | **[[entities/MCP-Model-Context-Protocol]] + 工具集成** | MCP server / 自定义 tool |

---

## 🧭 3 条转型路径

来源：[[sources/115-AIOps-Skills-Matrix-2026]] + [[sources/116-CTAIO-AI-SRE-Converging-Model]]

| 起点 | 终点 | 关键补课 | 难度 |
|---|---|---|---|
| **SRE** | AI SRE | LLM + Agent + RCA 自动化 | ⭐⭐ **最容易** |
| **Data Engineer** | AIOps Specialist | 实时遥测 + 故障域知识 | ⭐⭐⭐ |
| **AI Engineer** | AI SRE | SLO / Postmortem / 生产复杂度 | ⭐⭐⭐⭐ **最难** |
| **Security Engineer** | AI-Driven SecOps | LLM 安全 + Prompt 注入防护 | ⭐⭐⭐ |

---

## 🎯 AI 还做不到的 5 件事（[[sources/124-Obsium-AI-Cant-Replace-SRE-Yet]]）

这就是**人**的核心价值，也是转型方向：

1. **跨系统取舍**（要不要回滚 vs 容忍）
2. **第一次见的故障模式**（训练数据没覆盖的 cascading failure）
3. **隐性约束理解**（合规 / SLA / 组织政治）
4. **沟通安抚客户**（事故期间多方对齐）
5. **责任承担**（变更失败的问责）

→ "**学会指挥 AI 比自己干活更值钱**"

---

## 🚀 5 大转型动作（[[sources/121-腾讯云-道心不死-赌运维生涯]]）

立刻能做的：

1. **每周读 1 篇 SRE / AIOps 一手论文**（参考 [[concepts/AIOps-2026-全景综述]] 提到的 source）
2. **本地跑 LangGraph / [[entities/HolmesGPT]]** 写 demo
3. **把自己的 SOP 写成 Skill**（参考 [[sources/114-AI运维进化拐点-可版本化Skills]]）
4. **加入开源社区**（CNCF / OpenObserve / HolmesGPT / K8sGPT）
5. **看招聘 JD 反推自己缺什么**（参考 [[sources/118-Equinix-JD-Staff-Engineer-Agentic-AIOps]]）

---

## 💰 招聘市场关键词（2026 实测）

来源：[[sources/118-Equinix-JD-Staff-Engineer-Agentic-AIOps]]

| 关键词 | 含义 |
|---|---|
| **Agentic AIOps** | 2026 新标准词，替代旧的 "AIOps Engineer" |
| **MCP** | Model Context Protocol 协议熟练 |
| **Context Engineering** | Context 工程（与 [[concepts/协作范式演进]] 呼应） |
| **LLM Automation** | 工作流自动化 / 决策 Agent |
| **Staff/Principal Engineer** | 高 Level 已成主流 |

---

## 🚨 3 大反共识

### 反共识 1：AI 反而让工程师更值钱（[[sources/123-TechCrunch-...]]）
- 不是"AI 替代工程师"
- 是"**AI 让顶级工程师 10x，让初级工程师过时**"

### 反共识 2：会 AI 不等于会用 AI（[[sources/120-51CTO-...]]）
- 学个 ChatGPT API 不算"会"
- **真正会** = 把业务流程拆成 Agent + Skill + 工具链 + 验收

### 反共识 3：跳过传统功夫的捷径不存在（[[sources/122-北塔-...]]）
- 中国企业现状：很多人在 2.0 → 3.0 过渡
- **直接跳到 4.0（算法调优师）难度大** —— 没 K8s/Linux 底子学 Agent 是空中楼阁

---

## 🔗 在本 wiki 中

### 上承
- [[concepts/AIOps-2026-全景综述]] —— 技术全景
- [[concepts/AI-SRE-范式]] —— 新范式
- [[concepts/AIOps-生产实践与反共识]] —— 失败模式

### 平行
- [[concepts/低代码-vs-高代码-智能体建设]] —— 平台路径选择
- [[concepts/Enterprise-Agent-Architecture-2026]] —— 企业架构

### 实体
- [[entities/HolmesGPT]] · [[entities/K8sGPT]] · [[entities/OpenTelemetry]] · [[entities/MCP-Model-Context-Protocol]]

---

## 💡 一句话总结

> **AI 时代的运维 = 算法调优师 + Skill 设计师 + Agent 架构师，三位一体。**
> **传统脚本时代结束了，新工种正在重新定义薪资上限。**
> **会用 AI 的运维 vs 不会用的，5 年后是两个物种。**
