---
title: 邵的知识库
description: AI 智能体、AIOps、金融科技、企业架构的中英双语知识库。20 篇深度综述 · 132 篇一手 source · 每周更新。
---

# 👋 欢迎 · 这是邵的知识库

> 关于 **AI 智能体 / AIOps / 金融科技 / 企业架构** 的个人研究笔记。
>
> **20** 篇深度综述 · **132** 篇一手 source · **28** 个实体（工具/公司/协议）· **111** 篇 Clippings 原文 · 中英双语 · 每周更新。

---

## 🎯 精选主题（点进去看深度综述）

### 🤖 AI 智能体架构

- **[[concepts/Enterprise-Agent-Architecture-2026|企业智能体架构 2026 全景综述]]** ⭐ — 6 大行业共识 + 4 大架构模型 + 3 大反共识（跨 12 一手 source）
- [[concepts/低代码-vs-高代码-智能体建设]] — 9 维对比 + 3 条产品哲学 + 双轨制决策框架
- [[concepts/AI-工作流平台对比]] — Coze / Dify / n8n 具体选型矩阵
- [[concepts/Agentic-AI]] — Agentic AI 整体框架
- [[concepts/Agentic-Engineering]] — Karpathy 的元学科

### 🔧 AIOps / AI SRE

- **[[concepts/AIOps-2026-全景综述]]** ⭐ — AIOps 从 POC 到生产的完整地图（跨 20 sources）
- **[[concepts/AIOps-生产实践与反共识]]** ⭐ — 4-Agent 系统月烧 €8500 + 5 大反共识 + 5 大防护策略
- [[concepts/AI-SRE-范式]] — 5 大转变 + 5 Agent 架构 + 4 步采用路线
- [[concepts/AI-可观测性-四维追踪]] — Prompt / Tool / Trace / Token 4 维方法论
- [[concepts/AI-FinOps-Tokenomics]] — Token 经济新时代 + 7 大成本优化策略
- **[[concepts/AI时代运维转型与技能体系]]** ⭐ — 运维人员的转型路径（"人"的视角）

### 🏦 金融科技 / 汽车金融

- **[[concepts/金融智能体落地]]** — 银行 / 保险 / 证券 / 汽车金融跨 vertical 综述
- [[concepts/汽车金融-AI-建设方向]] — 汽车金融 vertical 完整方向

### ⚙️ 工程哲学

- [[concepts/Harness-Engineering]] — 长跑 Agent 的工程纪律
- [[concepts/Brain-Hands-Decoupling]] — Session / Harness / Sandbox 三层解耦
- [[concepts/Parallel-Agent-Teams]] — 多 Agent 并行 + git 任务锁
- [[concepts/Spec-Driven-Development]] — SDD 方法论
- [[concepts/Vibe-Coding]] — 依靠直觉 Prompt 的工业局限性
- [[concepts/协作范式演进]] — Prompt → Context → Harness → Agentic Engineering

---

## 🗺️ 探索入口

| 我想 | 去哪 |
|---|---|
| 📚 **按主题深读** | 上方精选综述，或点左侧 `concepts/` |
| 🏢 **查具体工具/产品** | 左侧 `entities/`（HolmesGPT、Middleware OpsAI、Datadog Bits 等 28 个）|
| 📰 **看一手 source 素材** | 左侧 `sources/` （132 篇按编号 + 主题）|
| 🔍 **全文搜索** | 顶部搜索或 `Cmd+K` — **覆盖 319 条**（含 111 篇 clippings 原文全文）|
| 🕸️ **交互式知识图谱** | [[graph|📊 Graph View]] |
| 📅 **每次更新变更** | [[log|📝 变更日志]] |
| 📋 **完整 wiki 目录** | [[wiki-inventory|📖 Wiki 目录索引]]（含所有 132 sources 一句话摘要）|
| 🎯 **按主题看 Sources** | [[by-topic|📚 按主题分类导航]]（132 篇按 6 大主题精选）|

---

## 📊 内容体量

| 维度 | 数量 | 说明 |
|---|---|---|
| **Concept 深度综述** | **20** | 跨多源综合，可读性最强 |
| **Entity 实体页** | **28** | 工具 / 公司 / 协议 |
| **Source 一手摘要** | **132** | 每篇原文附中英对照或 TL;DR |
| **主题覆盖** | 10+ | 智能体 / AIOps / 金融 / 架构 / 工程哲学 / FinOps ... |

---

## 🎨 关于本 Wiki：Karpathy LLM Wiki 方法论

本 wiki 参考 **[Andrej Karpathy 的 LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)** 搭建。**核心思想**：

> "用 LLM 帮我**处理**知识、**综合**知识、**思考**、**记忆**。
> Wiki 是我的**外脑 + LLM 的上下文池**，两者协同放大能力。"

### 🏛️ 三层信息架构（灵魂 · 严格分层）

```
┌────────────────────────────────────────────────────┐
│  🟢 Concept 层（20 篇）· 原创综合                    │
│      跨多源综合的深度综述，我的思考产物                │
│      示例：AIOps-2026-全景综述 (跨 20 sources)      │
└────────────┬───────────────────────────────────────┘
             │ 引用（wikilink）
             ↓
┌────────────────────────────────────────────────────┐
│  🟡 Entity 层（28 篇）· 实体画像                     │
│      工具 / 公司 / 协议的一句话档案                    │
│      示例：HolmesGPT · MCP-Protocol · Traversal      │
└────────────┬───────────────────────────────────────┘
             │ 引用
             ↓
┌────────────────────────────────────────────────────┐
│  🔵 Source 层（132 篇）· 一手摘要                    │
│      每篇原文 TL;DR + 双语精选 + 关键论点              │
│      示例：99-CBA-DevOps-Agent-2am-on-call          │
└────────────┬───────────────────────────────────────┘
             │ 指向
             ↓
┌────────────────────────────────────────────────────┐
│  📚 Clippings 层（111 篇）· 完整原文                 │
│      抓取的原始素材（微信 / 博客 / arxiv 全文）        │
│      仅本站访问、全文可搜索，不进导航（版权保护）      │
└────────────────────────────────────────────────────┘
```

### 🔄 3 大工作流（Karpathy 定义）

| 工作流 | 我做什么 | LLM 做什么 |
|---|---|---|
| **Ingest**（吸收）| 剪藏一篇新文章 → Clippings/ | LLM 提炼 TL;DR → 建 source/entity/concept 页 → 更新交叉引用 |
| **Query**（提问）| 问一个问题 | LLM 检索 wiki → 综合多页回答 → 有价值的沉淀回 wiki |
| **Lint**（巡检）| 定期跑 lint | LLM 找矛盾 / 过期 / 孤儿页 / 缺失引用 |

### 🎯 为什么这样搭

- **分层解耦**：Concept 变化时不影响原文；原文永远保真
- **可追溯**：每个综合结论可 wikilink 回 source
- **LLM 友好**：结构化 markdown + frontmatter tags，LLM 能直接读能协作
- **长期主义**：一次沉淀，无限复用；知识库随时间**升值**

### 📖 深入了解

- **原方法论**：[Karpathy LLM Wiki gist](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)
- **本 wiki 的 Karpathy 概念页**：[[concepts/Agentic-Engineering]]（Karpathy 提出的元学科）
- **变更日志**：[[log]] 每次 ingest / concept 写作都有记录
- **GitHub 源码**：https://github.com/shaowenglu-afk/wiki-public（可 fork 自己搭）

---

## 🙋 关于我

- **长期关注**：AI 智能体 / AIOps / 金融科技 / 企业架构
- **每周更新** wiki · **长期主义 · 慢知识 · 中英双语**

### 联系方式

- 📕 **小红书**：[👉 小红书主页](https://www.xiaohongshu.com/user/profile/5e3159d000000000010096c9) — 分享 AI 阅读、知识库搭建、日常思考
- 🐙 **GitHub**：[shaowenglu-afk](https://github.com/shaowenglu-afk) · [本 wiki 源码](https://github.com/shaowenglu-afk/wiki-public)
