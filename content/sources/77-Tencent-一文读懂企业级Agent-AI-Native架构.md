---
type: source
created: 2026-06-29
source_date: 2026-04-28
author: 腾讯云
original: "[2026-04-28 腾讯云 一文读懂企业级Agent AI Native架构](https://shaowenglu.com/clippings/2026-04-28-%E8%85%BE%E8%AE%AF%E4%BA%91-%E4%B8%80%E6%96%87%E8%AF%BB%E6%87%82%E4%BC%81%E4%B8%9A%E7%BA%A7Agent-AI-Native%E6%9E%B6%E6%9E%84)"
external_url: "https://cloud.tencent.com/developer/article/2692507"
tags: [wiki, source, 智能体, 架构, AI-Native, 7+2, 中文一手, 技术选型]
---

# 腾讯云 — 一文读懂企业级 Agent AI Native 架构（7+2 早期预告版）

## TL;DR
[[sources/78-Tencent-企业级Agent-AI-Native架构设计与实践]] 的姊妹/预告文。**重点：每层的具体技术栈选型清单**（[[entities/Kong]] / [[entities/Higress]] / [[entities/LangGraph]] / MAF / Spring AI Alibaba / RouteLLM / GPTCache / [[entities/Guardrails-AI]] / RBAC）。

## 7+2 架构技术栈速查

| 层 | 技术 |
|---|---|
| 1 应用 | Chatbot / IDE Plugin / 飞书 / 钉钉 |
| 2 网关 | Kong / Higress |
| 3 Agent Core | LangGraph / MAF / Spring AI Alibaba / Dify |
| 4 AI 网关 | RouteLLM / GPTCache / Redis / Guardrails AI |
| 5 大模型 | 公有 / 私有 / Embedding / Rerank |
| 6 知识数据 | RAG + 多元化存储 |
| 7 基础设施 | GPU 弹性 / MLOps / 事件驱动 / 密钥管理 / 混合云 |
| 横切左 | OpenTelemetry + Token 监控 + Eval |
| 横切右 | Prompt 注入防护 + 脱敏 + RBAC |

## 涉及的实体 / 概念
- [[concepts/Enterprise-Agent-Architecture-2026]]
- [[entities/Dify]] · [[entities/LangGraph]]

## 原文链接
- 内部：[2026-04-28 腾讯云 一文读懂企业级Agent AI Native架构](https://shaowenglu.com/clippings/2026-04-28-%E8%85%BE%E8%AE%AF%E4%BA%91-%E4%B8%80%E6%96%87%E8%AF%BB%E6%87%82%E4%BC%81%E4%B8%9A%E7%BA%A7Agent-AI-Native%E6%9E%B6%E6%9E%84)
- 外部：https://cloud.tencent.com/developer/article/2692507
