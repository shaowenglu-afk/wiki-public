---
type: concept
created: 2026-07-13
updated: 2026-07-13
tags: [wiki, concept, agentic-ai, workflow, agent, low-code]
sources:
  - '[[sources/18-Agentic-Design-Patterns-中译本Jimmy-Song-译A]]'
  - '[[sources/19-Dify-v1.12.0-与-v1.12.1重磅发布引入摘要索引让-RAG-检索]]'
  - '[[sources/20-Dify-v1.13.0-重磅发布人在回路HITL正式登场]]'
  - '[[sources/22-Dify-官方上架-Higress-插件轻松接入-AI-网关访问模型服务]]'
  - '[[sources/24-全网最省心扣子版OpenClaw保姆级部署与进阶玩法-–-人人都是产品经理]]'
  - '[[sources/25-Dify-凉了其实是行业回归理性]]'
  - '[[sources/27-Dify-vs-OpenClawAIOps领域的“大脑”与“双手”]]'
  - '[[sources/28-Dify-能做什么6-个-AI-应用场景讲清楚]]'
  - '[[sources/30-OpenClaw-+-YOLO缺陷检测智能体低代码实战全流程方案]]'
  - '[[sources/49-Coze-智能体-vs-工作流什么时候该用哪个]]'
  - '[[sources/63-企业级智能体平台开源可以私有化部署企业内部Agent完全开源可以商业化]]'
  - '[[sources/67-拆解6个AI智能体每个岗位的职责人设工作流]]'
---

# Workflow vs Agent

> **一句话**：**Workflow = 显式编排的确定性流水线**（人写图、Agent 走图）；**Agent = LLM 自主决定下一步的动态循环**（LLM 决策 + 工具调用 + 记忆）。企业落地 2026 主流是**混合**：用 workflow 做骨架 + 关键节点插入 agent。

## 核心区别

| 维度 | Workflow | Agent |
|---|---|---|
| **控制流** | 人预定义（DAG / BPMN）| LLM 动态决策 |
| **可预测性** | 高，跑一万次一样 | 低，同输入不同结果 |
| **成本** | Token 用量线性 | Token 用量爆炸（多轮循环）|
| **失败模式** | 节点错、参数缺 | 无限循环、幻觉、错工具 |
| **适合场景** | RPA、审批流、数据清洗 | 探索性问答、动态调查、代码修改 |
| **典型平台** | [[entities/Coze]] / [[entities/Dify]] / n8n | Claude Code / AutoGPT / CrewAI |

## 三种落地哲学

1. **纯 workflow 派**：Dify v1.x 用 `Chatflow` + `Workflow` 双引擎，关键节点插 LLM
2. **纯 agent 派**：Claude Code / AutoGPT，LLM 全权决策
3. **混合派**（主流）：Coze `工作流内嵌 Agent 节点` / Dify `HITL v1.13` —— **workflow 骨架 + agent 补丁**

## 关键洞察

- **Workflow 是"信封"，Agent 是"信封里的字条"** ——workflow 定合规边界，agent 处理不确定输入
- **成本反直觉**：纯 agent 便宜的想法在生产环境被 token 账单打脸（见 [[concepts/AI-FinOps-Tokenomics]]）
- **"什么时候该用哪个"**：确定性任务用 workflow；非结构化输入 + 需要多轮探索的用 agent（详见 [[sources/49-Coze-智能体-vs-工作流什么时候该用哪个]]）
- **可维护性差异**：workflow 崩了改一个节点；agent 崩了得改 prompt + 重跑 eval

## 在本 Wiki 中的出现

- **低代码/高代码分野**：[[concepts/低代码-vs-高代码-智能体建设]] —— 低代码派更倾向 workflow 做骨架
- **平台对比**：[[concepts/AI-工作流平台对比]] · [[concepts/国内智能体平台横评-2026]]
- **企业架构**：[[concepts/Enterprise-Agent-Architecture-2026]] —— workflow 层 + agent 层的双层设计
- **Harness 视角**：[[concepts/Harness-Engineering]] —— 用 harness 承载 workflow 的确定性 + agent 的探索性

## 相关

- [[concepts/Agentic-AI]] · [[concepts/AI-工作流平台对比]] · [[concepts/低代码-vs-高代码-智能体建设]]
- [[entities/Coze]] · [[entities/Dify]] · [[entities/LangGraph]] · [[entities/AutoGen]] · [[entities/CrewAI]]
