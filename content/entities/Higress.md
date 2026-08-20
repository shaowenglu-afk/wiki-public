---
type: entity
created: 2026-07-13
updated: 2026-07-13
tags: [wiki, entity, api-gateway, ai-gateway, higress, alibaba, open-source]
sources:
  - '[[sources/22-Dify-官方上架-Higress-插件轻松接入-AI-网关访问模型服务]]'
  - '[[sources/28-Dify-能做什么6-个-AI-应用场景讲清楚]]'
  - '[[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]'
---

# Higress

> **一句话**：**阿里开源 AI 网关**，基于 Envoy + Istio 底层，主打**大模型访问代理**（rate-limit / 缓存 / Guardrails / 多模型路由）。2026 Q2 [[entities/Dify]] 官方上架 Higress 插件，正式成为国内主流 AI Gateway 选型。

## 核心特征

- **AI 网关能力**：LLM 路由 · 缓存 · Token quota · 内容审查
- **[[entities/Dify]] 集成**：v1.x 直接上架 Higress 插件
- **和 [[entities/Kong]] 的对标关系**：Higress = 阿里开源生态 · Kong = 商业+云生态
- **上层**：可对接 [[entities/Guardrails-AI]] 做输出安全

## 在本 Wiki 中的出现

- [[sources/22-Dify-官方上架-Higress-插件轻松接入-AI-网关访问模型服务]]
- [[sources/28-Dify-能做什么6-个-AI-应用场景讲清楚]]
- [[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关

- [[entities/Kong]] · [[entities/Guardrails-AI]] · [[entities/Dify]]
- [[concepts/Enterprise-Agent-Architecture-2026]] · [[concepts/AI-FinOps-Tokenomics]]
