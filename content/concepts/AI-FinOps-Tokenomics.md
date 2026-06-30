---
type: concept
created: 2026-06-30
tags: [wiki, concept, FinOps, Tokenomics, LLMOps, 成本]
sources:
  - "[[sources/111-TechTarget-FinOps-AI-CIOs-Tokenomics]]"
  - "[[sources/112-Zylos-AI-Agent-Cost-Token-Economics]]"
  - "[[sources/109-When-AI-SRE-Fails-Production-Reality]]"
---

# AI FinOps / Tokenomics

> **一句话**：AI 把 FinOps 从云成本管理推到全新时代——**Token 经济**是 2026 CIO 必学的新词，预算超支 2-3x 是常态，单 Agent 系统月烧上千欧元属正常。

---

## 🎯 为什么 AI 让 FinOps 重新洗牌

来源：[[sources/111-TechTarget-FinOps-AI-CIOs-Tokenomics]]

| 维度 | 云 FinOps（成熟） | AI FinOps（重启） |
|---|---|---|
| 单位 | vCPU / GB / IOPS | **Token / Model call / Agent step** |
| 预测精度 | 1-3% | **完全失控**（超 2-3x 常态） |
| 优化对象 | EC2 / RDS / S3 | **Prompt / Model routing / Cache / Distillation** |
| 治理所有权 | IT 部门 | **IT + 财务 + 业务**（混乱） |

> "CEOs are like 'go fast with AI'... CFOs are like 'we have a budget'... real management challenge." — J.R. Storment, FinOps Foundation

---

## 💰 Token 成本 4 大组成

来源：[[sources/112-Zylos-AI-Agent-Cost-Token-Economics]]

| 类型 | 含义 | 单价相对 |
|---|---|---|
| **Input tokens** | 给模型的 prompt | 基准 |
| **Output tokens** | 模型回应 | **3-5x 单价** |
| **Cached tokens** | 命中 KV cache | **0.1x 单价** |
| **Reasoning tokens** | o1/o3 类思考链 | **新维度** |

---

## 🛠️ 7 大优化策略（按节省幅度）

| 策略 | 节省 | 难度 |
|---|---|---|
| **Distillation** | **60-90%** | 高 |
| **Model tiering** | 50-80% | 中 |
| **Model routing** | 40-70% | 中 |
| **Semantic caching** | 30-70% | 低 |
| **Prompt compression** | 20-40% | 中 |
| **Batching** | 10-30% | 低 |
| **Retry circuit breaker** | 防成本飙升 | 中 |

---

## 🚨 AI Agent 是最大成本黑洞

来源：[[sources/109-When-AI-SRE-Fails-Production-Reality]]

```
单 LLM chat 实现:    €50/月
   ↓
4-Agent AI SRE:    €8500/月  (15x 倍数!)
```

**原因**：
1. 每 Agent 独立 context window
2. Coordination 步骤每次都乘
3. **Retry loop** 是最危险（无 circuit breaker → 成本无上限）

---

## 📊 治理：3 大新角色

| 新角色 | 职责 |
|---|---|
| **Token Steward** | 监控 token 用量、设预算告警 |
| **Model Cost Engineer** | 模型路由 / 缓存 / 蒸馏策略 |
| **Tokenomics Analyst** | 把 token 成本归到业务团队 |

---

## 🎯 实操 4 步走

1. **可观测先行** —— 不知道 token 花在哪，没法优化（参见 [[concepts/AI-可观测性-四维追踪]] 的 Token 维度）
2. **加 circuit breaker** —— 单请求 token 上限 / 单 Agent 月预算
3. **Model tiering**：简单任务用 mini，复杂用旗舰
4. **Cache 优先**：semantic cache 在 RAG 场景节省 30-70%

---

## 🔗 在本 wiki 中

- 平行：[[concepts/AI-可观测性-四维追踪]]（Token 是其第 4 维）
- 上承：[[concepts/AIOps-2026-全景综述]]
- 验证：[[concepts/AIOps-生产实践与反共识]] 中 €8500/月案例

## 💡 一句话总结
> **AI 时代的 FinOps 不是云 FinOps 加个 token 字段——是全新工程学科。**
> **Distillation + Model tiering + Cache + Circuit Breaker 是 4 大杠杆。**
