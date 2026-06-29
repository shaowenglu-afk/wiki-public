---
type: source
created: 2026-06-29
source_date: 2026-05-25
author: Augment Code
original: "`2026-05-25 AI SRE 2026 Guide (Augment Code)`（原始素材，仅本地可见）"
external_url: "https://www.augmentcode.com/guides/ai-sre-ai-powered-site-reliability-engineering"
tags: [wiki, source, AIOps, AI-SRE, 综述, en-zh]
---

# Augment Code — AI SRE: The 2026 Guide

## TL;DR
**AI SRE 重新定义 SRE 实践**：从被动响应 → 主动预测、自主诊断、自动修复、自生成 postmortem。

## 5 大转变
1. **告警 → 调查**：自动跑工具链查日志/trace/code/deploy
2. **MTTR 减半**：领先案例 70-80%
3. **跨系统推理**：Agent 在单 context 关联 K8s + RDS + GitHub + Confluence
4. **自主修复**：高置信低风险直接执行，人审高风险
5. **Postmortem 自动起草**

## 2026 工具栈
- **开源**：[[entities/HolmesGPT]] / [[entities/K8sGPT]] / Aurora
- **商业**：[[entities/Datadog-Bits-AI-SRE]] / PagerDuty SRE Agent / Resolve.ai / Traversal
- **底层**：[[entities/OpenTelemetry]] + LLM + [[entities/MCP-Model-Context-Protocol]] + Agent Framework

## 生产实证
- **iFood**：MTTR 减 70%
- **American Express**：根因准确率 82%，MTTR -32%
- **Datadog 内部**：调查完成快 2x

## 涉及的实体 / 概念
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-SRE-范式]]
- [[entities/HolmesGPT]] · [[entities/K8sGPT]] · [[entities/Datadog-Bits-AI-SRE]]

## 原文链接
- 内部：`2026-05-25 AI SRE 2026 Guide (Augment Code)`（原始素材，仅本地可见）
- 外部：https://www.augmentcode.com/guides/ai-sre-ai-powered-site-reliability-engineering
