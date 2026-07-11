---
type: concept
created: 2026-07-11
tags: [wiki, concept, Anthropic, research, alignment, interpretability, agent, science, red-team, year-2026]
sources:
  - '[[sources/138-Anthropic-Off-Switch-Dual-Use]]'
  - '[[sources/139-Anthropic-Global-Workspace]]'
  - '[[sources/140-Anthropic-Economic-Index-Cadences]]'
  - '[[sources/141-Anthropic-Project-Fetch-Phase-Two]]'
  - '[[sources/142-Anthropic-N-Day-Exploits]]'
  - '[[sources/143-Anthropic-Agents-in-Biology]]'
  - '[[sources/144-Anthropic-Making-Claude-a-Chemist]]'
  - '[[sources/145-Anthropic-Attack-Navigator]]'
  - '[[sources/146-Anthropic-Coding-Agents-Social-Sciences]]'
  - '[[sources/147-Anthropic-Glasswing]]'
  - '[[sources/148-Anthropic-Teaching-Claude-Why]]'
  - '[[sources/149-Anthropic-Donating-Petri]]'
  - '[[sources/150-Anthropic-BioMysteryBench]]'
  - '[[sources/151-Anthropic-Economic-Index-Survey-Announcement]]'
  - '[[sources/152-Anthropic-81k-Economics]]'
  - '[[sources/153-Anthropic-Trustworthy-Agents]]'
  - '[[sources/154-Anthropic-Emotion-Concepts-Function]]'
  - '[[sources/155-Anthropic-Australia-Uses-Claude]]'
  - '[[sources/156-Anthropic-Vibe-Physics]]'
  - '[[sources/157-Anthropic-Long-Running-Claude]]'
  - '[[sources/158-Anthropic-Introducing-Science-Blog]]'
  - '[[sources/159-Anthropic-Diff-Tool]]'
  - '[[sources/160-Anthropic-Labor-Market-Impacts]]'
  - '[[sources/161-Anthropic-Persona-Selection-Model]]'
  - '[[sources/162-Anthropic-AI-Fluency-Index]]'
  - '[[sources/163-Anthropic-India-Country-Brief]]'
  - '[[sources/164-Anthropic-Zero-Days]]'
  - '[[sources/165-Anthropic-AI-Assistance-Coding-Skills]]'
  - '[[sources/166-Anthropic-Disempowerment-Patterns]]'
  - '[[sources/167-Anthropic-Economic-Index-Primitives]]'
  - '[[sources/168-Anthropic-Economic-Index-January-2026]]'
---

# Anthropic Research 2026H1 · 31 篇全景综述

> **一句话**：2026 上半年 Anthropic 发布 **31 篇** research 文章，覆盖 **Alignment / Interpretability / Frontier Red Team / Agentic Science / Economic Research / Coding & Education** 六大主线。整体趋势：**从"研究模型能做什么"转向"研究模型该怎么可靠地做事"**。

---

## 🎯 六大主线（跨 31 篇一手 source 综合）

### 主线 1：Alignment / Interpretability · 揭示内部结构 → 干预对齐（6 篇）

| # | 文章 | 一句话 |
|---|---|---|
| 138 | [[sources/138-Anthropic-Off-Switch-Dual-Use\|Off-switch for dual-use knowledge]] | 给危险知识本身装开关，不只是输出过滤 |
| 139 | [[sources/139-Anthropic-Global-Workspace\|Global Workspace]] | LLM 内部有类脑"全局工作空间" |
| 148 | [[sources/148-Anthropic-Teaching-Claude-Why\|Teaching Claude why]] | 教"为什么"比教"是什么"更能对齐 |
| 154 | [[sources/154-Anthropic-Emotion-Concepts-Function\|Emotion concepts]] | LLM 内部有情绪表征且影响行为 |
| 161 | [[sources/161-Anthropic-Persona-Selection-Model\|Persona selection]] | 越狱本质是诱导模型换 persona |
| 166 | [[sources/166-Anthropic-Disempowerment-Patterns\|Disempowerment]] | 用户被 AI 隐性剥夺能力的模式 |

**主线共识**：Alignment 从**行为层过滤** → **内部结构干预** → **行为解释性对齐**。

### 主线 2：Frontier Red Team · 一手安全实证（4 篇）

| # | 文章 | 一句话 |
|---|---|---|
| 142 | [[sources/142-Anthropic-N-Day-Exploits]] | 量化 LLM 加速 N-day exploit 的程度 |
| 145 | [[sources/145-Anthropic-Attack-Navigator]] | LLM ATT&CK Navigator：用 MITRE 语言表达 AI 威胁 |
| 147 | [[sources/147-Anthropic-Glasswing]] | Project Glasswing：开放前沿模型攻防观测 |
| 164 | [[sources/164-Anthropic-Zero-Days]] | LLM 独立发现人类未知的 0-day |

**主线共识**：Red Team 从**能力评估** → **一手实证发现** → **透明化对外**。

### 主线 3：Agentic Science · 领域专家化（6 篇）

| # | 文章 | 一句话 |
|---|---|---|
| 143 | [[sources/143-Anthropic-Agents-in-Biology]] | 生物学 Agent 基建 + 评估 + 安全 |
| 144 | [[sources/144-Anthropic-Making-Claude-a-Chemist]] | Claude 训练为化学家 |
| 150 | [[sources/150-Anthropic-BioMysteryBench]] | 生物信息学领域专属基准 |
| 156 | [[sources/156-Anthropic-Vibe-Physics]] | Vibe Physics：AI 研究生 |
| 157 | [[sources/157-Anthropic-Long-Running-Claude]] ⭐ | 长跑 Claude 用于科学计算 |
| 158 | [[sources/158-Anthropic-Introducing-Science-Blog]] | 单开 Science Blog（组织级承诺）|

**主线共识**：**Science 是 Anthropic 长期战略主线**，从工具 → 基准 → 领域专家化 → 独立发布通道全套铺开。

### 主线 4：生产 Agent · 从聪明到可靠（3 篇）

| # | 文章 | 一句话 |
|---|---|---|
| 141 | [[sources/141-Anthropic-Project-Fetch-Phase-Two]] | Claude 训练机器狗（Embodied Agent）|
| 146 | [[sources/146-Anthropic-Coding-Agents-Social-Sciences]] | Coding Agent 成为社科研究"随手 SPSS" |
| 153 | [[sources/153-Anthropic-Trustworthy-Agents]] ⭐ | 生产 Agent = 可靠 + 可解释 + 可撤销 |

**主线共识**：**生产 Agent 的门槛不是能力，是信任结构**。

### 主线 5：Economic Research · 方法论 + 数据 + 国别（9 篇）

| # | 文章 | 一句话 |
|---|---|---|
| 140 | [[sources/140-Anthropic-Economic-Index-Cadences]] | 小时级采样揭示 AI 使用日内节奏 |
| 151 | [[sources/151-Anthropic-Economic-Index-Survey-Announcement]] | 加入主动问卷 |
| 152 | [[sources/152-Anthropic-81k-Economics]] | 8.1 万人多语言质性调研 |
| 155 | [[sources/155-Anthropic-Australia-Uses-Claude]] | 澳大利亚国别简报 |
| 160 | [[sources/160-Anthropic-Labor-Market-Impacts]] ⭐ | AI 劳动影响 = 重塑不替代 |
| 162 | [[sources/162-Anthropic-AI-Fluency-Index]] | AI Fluency Index 衡量流利度 |
| 163 | [[sources/163-Anthropic-India-Country-Brief]] | 印度国别简报 |
| 167 | [[sources/167-Anthropic-Economic-Index-Primitives]] | 方法论：Economic primitives |
| 168 | [[sources/168-Anthropic-Economic-Index-January-2026]] | 一月开篇报告 |

**主线共识**：从**"日志采样"** → **"日志 + 主动问卷 + 国别 + 时段"** 全景化，与本 wiki [[concepts/AI时代运维转型与技能体系]] 呼应。

### 主线 6：Education & Coding · 学习范式（2 篇）

| # | 文章 | 一句话 |
|---|---|---|
| 165 | [[sources/165-Anthropic-AI-Assistance-Coding-Skills]] ⭐ | AI 助手过度依赖 = 基础能力缺失 |
| 159 | [[sources/159-Anthropic-Diff-Tool]] | AI 模型行为 diff 工具 |

**主线共识**：**AI 教育不是"用得多"，是"用得对"**。

---

## 🔍 3 大反共识

### 反共识 1：Alignment 不是"训模型说不"，是"训模型忘掉"

- 传统 refusal + classifier 只治输出
- Anthropic 走向 **surgical off-switch**（[[sources/138-Anthropic-Off-Switch-Dual-Use]]）
- 未来 = **知识粒度对齐 + 内部结构干预**

### 反共识 2：AI 找 0-day 已经不是假设

- [[sources/164-Anthropic-Zero-Days]]：LLM 独立发现人类未知 0-day
- 意味着 AI 已经在部分安全场景成为"新型研究员"
- 攻防对称性正在改变

### 反共识 3：AI 学习者的最大风险不是学不会，是学不深

- [[sources/165-Anthropic-AI-Assistance-Coding-Skills]]：过度依赖 = 基础能力缺失
- [[sources/166-Anthropic-Disempowerment-Patterns]]：日常隐性失能
- 呼应本 wiki [[concepts/AI时代运维转型与技能体系]] 反共识 3

---

## 🌐 与本 wiki 主脉络的对齐

| 本 wiki 主线 | Anthropic 2026H1 对应 |
|---|---|
| [[concepts/Enterprise-Agent-Architecture-2026]] | [[sources/153-Anthropic-Trustworthy-Agents]] |
| [[concepts/Harness-Engineering]] | [[sources/157-Anthropic-Long-Running-Claude]] ⭐ |
| [[concepts/AI-可观测性-四维追踪]] | [[sources/159-Anthropic-Diff-Tool]] |
| [[concepts/AI时代运维转型与技能体系]] | [[sources/160-Anthropic-Labor-Market-Impacts]] + [[sources/165-Anthropic-AI-Assistance-Coding-Skills]] |
| [[concepts/Vibe-Coding]] | [[sources/156-Anthropic-Vibe-Physics]] |
| [[concepts/AIOps-生产实践与反共识]] | [[sources/153-Anthropic-Trustworthy-Agents]] |

**Anthropic 的 2026H1 研究几乎为本 wiki 每一条主线都提供了官方一手支持**。

---

## 📅 时间线

```
2026-01-15 · Economic Index 方法论 + 一月报告
2026-01-28~29 · Disempowerment + AI-Coding-Skills 学习范式反思
2026-02-05 · LLM 独立找 0-day
2026-02-16~23 · India 国别简报 + AI Fluency Index + Persona Selection
2026-03-05~13 · Labor Market Impacts + Diff Tool
2026-03-23 · Science Blog 三连发（Vibe Physics + Long-running + Introducing）
2026-03-31 · Australia 国别简报
2026-04-02 · Emotion Concepts
2026-04-09 · Trustworthy Agents ⭐
2026-04-22 · Economic Index Survey + 81k Economics
2026-04-29 · BioMysteryBench
2026-05-07~08 · Petri 开源 + Teaching Claude Why
2026-05-22~27 · Glasswing + Coding Agents in Social Sciences
2026-06-03~08 · Attack Navigator + Chemistry + Biology + N-day
2026-06-18 · Project Fetch Phase Two
2026-06-26 · Economic Index Cadences
2026-07-06~08 · Global Workspace + Off-switch Dual-use
```

---

## 💡 一句话总结

> **Anthropic 2026H1 = "从研究模型能做什么，转向研究模型该怎么可靠地做事"**。
>
> **6 大主线（Alignment / Interp / Red Team / Agentic Science / Economic / Education）在半年内密集铺开**，几乎为本 wiki 每一条主脉络都提供了官方一手支持。
