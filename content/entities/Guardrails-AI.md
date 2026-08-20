---
type: entity
created: 2026-07-13
updated: 2026-07-13
tags: [wiki, entity, guardrails, safety, agent-safety, open-source]
sources:
  - '[[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]'
---

# Guardrails AI

> **一句话**：**LLM 输出安全护栏**开源项目 —— 用声明式规则（JSON schema / 关键字 / 分类器 / 结构化验证）拦截 LLM 有害/幻觉/越界输出。企业级 Agent 架构里的**"最后一公里"安全层**。

## 核心特征

- **声明式规则**：validators 组成 pipeline，output 不满足即 re-ask / reject / fallback
- **企业架构位置**：网关（[[entities/Kong]] / [[entities/Higress]]）→ Agent → **Guardrails** → 用户
- **典型能力**：PII 脱敏 · 幻觉检测 · Toxicity · 结构化 JSON 强制
- **合规配套**：金融 / 医疗行业 Agent 落地必备

## 在本 Wiki 中的出现

- [[sources/77-Tencent-一文读懂企业级Agent-AI-Native架构]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关

- [[entities/Kong]] · [[entities/Higress]] · [[entities/OpenTelemetry]]
- [[concepts/Enterprise-Agent-Architecture-2026]] · [[concepts/AI时代运维转型与技能体系]]
