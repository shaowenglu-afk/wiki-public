# 📊 Wiki 知识图谱

> 更新于 2026-06-29 第 6 轮 ingest 后
> 节点 **120**（含 12 新 source + 5 新 entity + 1 新 concept）| 中心节点入度 TOP：Agentic-AI / Enterprise-Agent-Architecture-2026（新增）/ 金融智能体落地 / Harness-Engineering
>
> ⚠️ Lint 待办：上次发现的 44 个孤儿 source + 60+ 失效引用仍未修，详见 [[lint-2026-06-29]]

---

## 🧭 阅读建议

- **图 1 主线四概念演进** — 从 Vibe Coding 到 Agentic Engineering 的范式跃迁
- **图 2 概念-实体生态** — 核心 concept 与工具的连接
- **图 3 低代码平台横评** — Coze/Dify/n8n 及关系
- **图 4 金融 vertical 子图** — 汽车金融 + 银行 + 行业概念
- **图 5 全 Wiki 鸟瞰** — 按类型分层
- **Obsidian Graph View 配套** — Cmd+G + Filters/Groups 见末尾

---

## 图 1 · 主线四概念演进

```mermaid
flowchart LR
    Vibe[Vibe Coding<br/><i>试运气</i>] --> SDD[Spec-Driven Development<br/><i>显式中间产物</i>]
    SDD --> Harness[Harness Engineering<br/><i>系统级闭环</i>]
    Harness --> AgEng[Agentic Engineering<br/><i>Karpathy 提出</i>]
    Harness --> BHD[Brain-Hands Decoupling]
    Harness --> LRA[Long-Running Agents]
    Harness --> PAT[Parallel Agent Teams]
    AgEng -.-> WvA[Workflow vs Agent]
    WvA -.-> SDD
    classDef main fill:#7aa2ff,color:#fff,stroke:#333,stroke-width:2px
    classDef sub fill:#c7e1ff,stroke:#333
    class Vibe,SDD,Harness,AgEng main
    class BHD,LRA,PAT,WvA sub
```

---

## 图 2 · Agentic-AI 概念-实体生态

```mermaid
flowchart TB
    AI[Agentic AI<br/>主动执行式 AI 框架]
    AI --> Codex
    AI --> ClaudeSDK[Claude Agent SDK]
    AI --> OpenClaw
    AI --> MCP[MCP Protocol]
    AI --> DeepSeek
    Codex -.->|生态依赖| OpenClaw
    ClaudeSDK -.->|实现| LRA[Long-Running Agents]
    MCP -.->|协议层| AI
```

---

## 图 3 · 低代码 / 高代码 平台横评

```mermaid
flowchart TB
    Top["💡 低代码 vs 高代码 智能体建设<br/><i>上层哲学：双轨制</i>"]
    Top --> 对比[AI 工作流平台对比]
    Top --> HighCode["🛠 高代码路径<br/>LangGraph / AutoGen / 自研 Harness"]
    Top --> Harness[Harness Engineering<br/><i>高代码进阶纪律</i>]

    subgraph LC["低代码智能体平台"]
        Coze[Coze<br/>字节 · 对话 Bot]
        Dify[Dify<br/>AI 应用 · RAG 最强]
        n8n[n8n<br/>自动化 · 600+ 节点]
    end
    subgraph SDD_TOOLS["SDD / Plan 系工具"]
        Plan[Plan Mode]
        Super[Superpowers · TDD]
        Kiro[Kiro · Spec 即 IDE]
        OpenSpec
        GStack[GStack · 23 角色]
    end

    Coze --> 对比
    Dify --> 对比
    n8n --> 对比
    Plan --> SDD[Spec-Driven Dev]
    Super --> SDD
    OpenSpec --> SDD
    Kiro --> SDD
    GStack --> SDD
    对比 --> WvA[Workflow vs Agent]
    HighCode --> Harness

    classDef new fill:#fde68a,stroke:#92400e,stroke-width:2px
    class Top new
```

> 🆕 2026-06-29 新增上层节点 [[concepts/低代码-vs-高代码-智能体建设]]，统领低代码（Coze/Dify/n8n）与高代码（Harness/LangGraph）两条路径。

---

## 图 4 · 金融 vertical 子图

```mermaid
flowchart TB
    Fin[金融智能体落地<br/>2026 元年]
    AutoFin[汽车金融 AI 建设方向]
    Fin --> Bank[🏦 银行]
    Fin --> Sec[📈 证券]
    Fin --> Ins[🛡 保险]
    Fin --> AutoFin
    Bank -.->|金发 8 号文| Harness
    AutoFin -.->|供应链风控| Harness
    Bank -.->|安全底线| MCP
    AutoFin --> 车企[新能源车企 Agent 战争]
    AutoFin --> 监管[频踩监管红线]
    AutoFin --> 风控[AI 供应链风控]
    Bank --> 招商[招行 800+ 场景]
    Bank --> 浦发[浦发 2500+ 智能体]
    Bank --> 中小[中小银行追赶]
    Fin --> AI[Agentic AI]
    AutoFin --> AI
```

---

## 图 5 · 全 Wiki 鸟瞰

```mermaid
flowchart TB
    subgraph C["🔵 Concepts (13 个)"]
        Agentic_AI["Agentic-AI<br/>← 56"]
        _______["金融智能体落地<br/>← 29"]
        Harness_Engineering["Harness-Engineering<br/>← 28"]
        AI________["AI-工作流平台对比<br/>← 18"]
        _____AI_____["汽车金融-AI-建设方向<br/>← 15"]
        WvA["Workflow-vs-Agent<br/>← 12 ⚠️孤页"]
        NewLC["低代码-vs-高代码<br/>← 4 🆕"]
    end

    subgraph E["🟢 Entities (15 个)"]
        Dify["Dify<br/>← 22"]
        OpenClaw["OpenClaw<br/>← 18"]
        Codex["Codex<br/>← 18"]
        Coze["Coze<br/>← 14"]
        Superpowers["Superpowers<br/>← 14"]
        Plan_Mode["Plan-Mode<br/>← 14"]
        MCP_Model_Context_Protocol["MCP-Model-Context-Protocol<br/>← 12"]
        OpenSpec["OpenSpec<br/>← 9"]
    end

    subgraph S["🟡 Sources (74 个，仅 TOP 5)"]
        10_SDD_______["10-SDD五个常识全错了...<br/>← 28"]
        07_OpenAI_Codex______["07-OpenAI-Codex-负责人访谈...<br/>← 18"]
        02_AI_PM______Harness_Engineer["02-AI-PM-必须掌握-Harness-Eng...<br/>← 17"]
        12_Parallel_Claude_C_Compiler["12-Parallel-Claude-C-Comp...<br/>← 11"]
        08_____Agentic_AI_____["08-企业级-Agentic-AI-架构设计...<br/>← 11"]
    end
    C --> E
    E --> S
```

---

## 🏆 入度 TOP 15（2026-06-29 重算）

| 排名 | 类型 | 节点 | 入度 | 变化 |
|---|---|---|---|---|
| 1 | concepts | Agentic-AI | 56 | ↓ (65→56，去重后) |
| 2 | concepts | 金融智能体落地 | 29 | ↑ |
| 3 | sources | 10-SDD五个常识全错了 | 28 | = |
| 4 | concepts | Harness-Engineering | 28 | ↓ |
| 5 | sources | 02-AI-PM-必须掌握-Harness-Engineering | 19 | ↑ |
| 6 | sources | 07-OpenAI-Codex-负责人访谈 | 18 | = |
| 7 | entities | Dify | 18 | ↓ |
| 8 | concepts | AI-工作流平台对比 | 18 | ↑ (←本轮 +1 来自新概念) |
| 9 | concepts | 汽车金融-AI-建设方向 | 15 | ↓ |
| 10 | entities | OpenClaw | 13 | ↓ |
| 11 | sources | 01-n8n-vs-Dify-vs-Coze | 13 | ↑ |
| 12 | sources | 13-Harness-Design-Long-Running-Apps | 12 | = |
| 13 | entities | MCP-Model-Context-Protocol | 12 | = |
| 14 | concepts | Workflow-vs-Agent | 12 | ⚠️ 缺失页（被 12 处引用但文件不存在）|
| 15 | sources | 12-Parallel-Claude-C-Compiler | 11 | = |

🆕 **新增节点**：[[concepts/低代码-vs-高代码-智能体建设]] 入度 4 / 出度 29（含 18 sources + 6 concepts + 5 entities）

🆕 **2026-06-29 第 6 轮新增**：
- **[[concepts/Enterprise-Agent-Architecture-2026]]** —— 跨 12 篇 source 的核心综述页，**预计入度成为 Top 5 内**（被 12 个 sources 反向引用 + 5 个 entities）
- **新 sources（68-79）**：12 个企业级架构 source（Tyk / ISG / MLflow / RTSLabs / VDF / Internative / ClarityArc / arXiv / 腾讯 ×3 / 葡萄城）
- **新 entities（5 个）**：[[entities/A2A-Protocol]] / [[entities/LangGraph]] / [[entities/Microsoft-AGT]] / [[entities/Google-ADK]] / [[entities/Temporal]]

## 🆕 图 6 · 企业级 Agent 架构 2026 综述子图

```mermaid
flowchart TB
    Hub["💎 Enterprise-Agent-Architecture-2026<br/><i>跨 12 源综述</i>"]:::hub

    subgraph EN["🌐 英文一手（8）"]
        Tyk[Tyk 4 组件 + A2A]
        ISG[ISG 控制平面]
        MLflow[MLflow 框架对比]
        RTSLabs[RTSLabs 7 层]
        VDF[VDF 7 模式]
        Internative[Internative 6 模式]
        ClarityArc[ClarityArc 3 层 + Manager]
        arXiv[arXiv 学术综述]
    end

    subgraph CN["🇨🇳 中文一手（4）"]
        T1[腾讯 MAS 综述]
        T2[腾讯 7+2 完整]
        T3[腾讯 7+2 技术栈]
        GC[葡萄城白皮书 L0-L4]
    end

    subgraph EE["🛠 关键 Entities"]
        A2A[A2A Protocol]
        MCP[MCP Protocol]
        LG[LangGraph]
        AGT[Microsoft AGT]
        ADK[Google ADK]
        TMP[Temporal]
    end

    Tyk --> Hub
    ISG --> Hub
    MLflow --> Hub
    RTSLabs --> Hub
    VDF --> Hub
    Internative --> Hub
    ClarityArc --> Hub
    arXiv --> Hub
    T1 --> Hub
    T2 --> Hub
    T3 --> Hub
    GC --> Hub

    Hub --> A2A
    Hub --> MCP
    Hub --> LG
    Hub --> AGT
    Hub --> ADK
    Hub --> TMP

    Hub -.->|上承| HE[Harness-Engineering]
    Hub -.->|上承| AAI[Agentic-AI]
    Hub -.->|下承| LCHC[低代码-vs-高代码]

    classDef hub fill:#fde68a,stroke:#92400e,stroke-width:3px,color:#000
```


---

## 🎨 Obsidian Graph View 配套设置

打开 `Cmd+G` 后建议这样设置：

### 1. Filters
- Files: `path:Clippings/wiki`（只看 wiki 层，过滤原始素材）
- 或 `path:Clippings/wiki/sources` 只看 source 子图

### 2. Groups（按类型上色）
| Query | 颜色 |
|---|---|
| `path:Clippings/wiki/concepts` | 🔵 蓝 |
| `path:Clippings/wiki/entities` | 🟢 绿 |
| `path:Clippings/wiki/sources` | 🟡 黄 |
| `path:Clippings/wiki/graph` | 🔴 红（主图谱本身）|

### 3. Display
- Show arrows: ✅
- Node size: 按入度（默认）
- Repel force: 调高让聚类更明显

---

## 🔄 如何重新生成

当 wiki 内容更新后，跑：

- 告诉 AI："**重新生成 wiki 知识图谱**"

AI 会自动扫所有 wiki 文件 → 重算入度/出度 → 重写 graph.md。
