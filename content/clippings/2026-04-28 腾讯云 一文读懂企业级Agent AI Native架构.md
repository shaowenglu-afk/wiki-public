---
title: "一文读懂企业级 Agent AI Native 架构"
source: "https://cloud.tencent.com/developer/article/2692507"
author:
  - "[[腾讯云]]"
published: 2026-04-28
created: 2026-06-29
description: "腾讯云 7+2 架构的早期版本（B2 的姊妹/预告文）。重点补充了每层的具体技术栈选型（Kong / Higress / LangGraph / MAF / Spring AI Alibaba / RouteLLM / GPTCache / Guardrails AI / RBAC）。"
tags:
  - clippings
  - 智能体
  - 架构
  - AI-Native
  - 7+2架构
  - 技术选型
  - 中文一手
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自 https://cloud.tencent.com/developer/article/2692507 ｜2026-04-28 ｜与 [[Clippings/2026-06-15 腾讯云 企业级Agent AI Native架构设计与实践]] 是姊妹文，本篇是预告短版，重点保留**具体技术栈选型清单**。

# 一文读懂企业级 Agent AI Native 架构

> 本文与同作者完整版 [[Clippings/2026-06-15 腾讯云 企业级Agent AI Native架构设计与实践]] 互补。完整版是演讲全内容；本篇是预告短文 + **每层技术选型清单**。

---

## AI 集成 vs AI Native（关键定义）

> **AI 集成是给系统叠加 AI 的功能，AI 类似于外挂的模块；而 AI Native 是以 AI 为核心驱动业务**。

| 维度 | AI 功能集成 | AI Native |
|---|---|---|
| 主体 | 系统本身（AI 是外挂模块）| Agent 驱动业务 |
| 状态 | **无状态**调用 | **有状态、有记忆、可持久化上下文** |

---

## 【7+2】架构 — 每层技术选型清单（B2 未深入的部分）⭐

### 垂直 7 层

| 层 | 名称 | **具体技术选型** |
|---|---|---|
| 1 | **业务应用层** | Chatbot 网页版 / IDE Plugin / 飞书 / 钉钉 |
| 2 | **应用网关层** | 云负载均衡服务、**Kong**、**Higress** |
| 3 | **AI AGENT CORE 层** ⭐ | **LangGraph / MAF / Spring AI Alibaba / Dify**（低代码混合）|
| 4 | **AI 网关层** | **RouteLLM**（语义路由）/ **GPTCache**（语义缓存）/ **Redis** / **Guardrails AI**（安全治理）|
| 5 | **大模型层** | 公有模型 / 私有模型 / Embedding 模型 / Rerank 模型 |
| 6 | **知识 & 数据层** | RAG + 多元化存储（结构化 + 非结构化）|
| 7 | **基础设施层** | **GPU 弹性调度 / MLOps / 事件驱动异步 / 密钥集中配置管理 / 混合云** |

### 2 侧横切关注点

| 侧 | 实现要点 |
|---|---|
| **可观测性 & 评估** | **OpenTelemetry** 链路追踪 + Token 成本 / 延迟 / 成功率监控 + **Eval 体系**评估模型输出质量与幻觉率 |
| **安全治理 & 合规** | 输入侧：**Prompt 注入 / 越狱攻击**防护；隐私层：敏感信息**识别与脱敏**；权限层：**RBAC** 控制访问边界 |

---

## Agent 核心层的关键决策（第 3 层）

构建智能体时三大决策：

1. **选用什么智能体框架**：
   - LangGraph
   - Microsoft Autogen Framework (MAF)
   - Spring AI Alibaba
   - Dify（低代码混合方式）
2. **用什么方式构建**：
   - Single-Agent 还是 Multi-Agent
   - 具体推理范式（ReAct / Reflection / Plan-Solve 等）
3. **记忆体系如何设计**：
   - 工作记忆（短期，会话内）
   - 语义记忆（知识库）
   - 情景记忆（跨会话）
   - 程序性记忆（SOP / Skill）

---

## 关键启示

1. **B2 + B4 互补**：B2 讲完整方法论；**B4 给具体技术选型清单**
2. **AI 网关层技术栈明确化**：RouteLLM + GPTCache + Redis + Guardrails AI（vs A1 Tyk 提到的 Temporal/Inngest/Restate 路线，构成中外两条参考路径）
3. **Agent 框架明确收敛到 4 个**：LangGraph / MAF / Spring AI Alibaba / Dify
4. **OpenTelemetry** 已是 Agent 可观测的事实标准（中外一致）
5. **RBAC + Prompt 注入防护**是中国语境企业级标配（与 [[concepts/Harness-Engineering]] 在金融业的安全要求呼应）

## 原文链接

- https://cloud.tencent.com/developer/article/2692507
- 完整版（同作者）：[[Clippings/2026-06-15 腾讯云 企业级Agent AI Native架构设计与实践]]
