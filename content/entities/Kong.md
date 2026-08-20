---
type: entity
created: 2026-07-13
updated: 2026-07-13
tags: [wiki, entity, api-gateway, ai-gateway, kong]
sources:
  - '[[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]'
---

# Kong

> **一句话**：老牌开源 **API 网关**，2024-2026 快速演化为 **AI Gateway** —— 加了 LLM 路由 / rate-limit / prompt 缓存 / RAG plugin 等能力，成为企业级 Agent 架构的"入口层"选型之一。

## 核心特征

- **AI 网关能力**：LLM 路由、多模型负载均衡、Token quota、Prompt 缓存
- **RouteLLM 等价路径**：动态选择成本最低的模型
- **和 [[entities/Higress]] 的对标关系**：Kong 走商业/云生态，Higress 走阿里开源
- **企业选型场景**：见 [[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]] 的"入口/网关层"

## 在本 Wiki 中的出现

- [[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关

- [[entities/Higress]] · [[entities/Guardrails-AI]] · [[entities/A2A-Protocol]] · [[entities/MCP-Model-Context-Protocol]]
- [[concepts/Enterprise-Agent-Architecture-2026]] · [[concepts/AI-FinOps-Tokenomics]]
