---
type: entity
created: 2026-06-29
tags: [wiki, entity, 框架, 智能体, 治理, Microsoft]
---

# Microsoft AGT (Agent Governance Toolkit)

## 一句话
Microsoft 出品的 **Agent 治理工具集** —— 把策略执行作为基础设施（**不是软护栏**），是受监管企业部署的明确选择。

## 核心特征（v3.6.0）
- **Privilege Rings（特权环）** —— 分层权限模型
- **Kill Switches（开关）** —— 紧急停止机制
- **Audit Sink Enhancements** —— 完整审计轨迹
- **原生策略引擎** —— 基于容器的 sandboxing

## 立场（关键差异化）
> **"Governance decisions are enforced deterministically before actions reach the wire, making blocked actions structurally impossible rather than just unlikely."**

**治理决策在动作到达 wire 之前确定性强制执行**——让被阻止的动作**结构性不可能**，不是软性"不太可能"。

## 适用场景
- **受监管企业**（金融、医疗、政府）
- 需要**完整审计** + **强权限边界**
- **合规为先**的部署

## 在本 Wiki 中的出现
- [[sources/70-MLflow-Building-Production-Ready-AI-Agents-2026]]
- [[concepts/Enterprise-Agent-Architecture-2026]]

## 相关
- [[entities/LangGraph]] · [[entities/Google-ADK]] · [[entities/MLflow-Agent-Platform]]
- [[concepts/Harness-Engineering]]
