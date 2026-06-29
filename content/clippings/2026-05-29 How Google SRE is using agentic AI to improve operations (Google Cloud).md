---
title: "How Google SRE is using agentic AI to improve operations"
title_zh: "Google SRE 如何用 agentic AI 改进运营"
source: "https://cloud.google.com/blog/products/devops-sre/how-google-sre-is-using-agentic-ai-to-improve-operations"
author:
  - "[[Stevan Malesevic]]"
  - "[[Christopher Heiser]]"
publisher: "Google Cloud Blog"
published: 2026-05-29
created: 2026-06-29
description: "Google SRE 20 年首次系统披露 agentic AI 落地：6 大方向（可靠性设计 / 异常检测 / 事件管理 / 事件调查 / 洞察风险 / 设计原则），底层 Gemini + ADK + MCP，强调透明度优先黑盒。"
tags:
  - clippings
  - AIOps
  - SRE
  - Google
  - en-zh
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自 https://cloud.google.com/blog/products/devops-sre/how-google-sre-is-using-agentic-ai-to-improve-operations｜2026-05-29 发布｜2026-06-29 由 agent-reach + 段对段中英双语。

# How Google SRE is using agentic AI to improve operations
# Google SRE 如何用 agentic AI 改进运营

> **作者**：Stevan Malesevic（Distinguished Software Engineer）、Christopher Heiser（Distinguished Site Reliability Engineer）

---

## 中文 TL;DR

Google 用 SRE（站点可靠性工程）保持 Search/Gmail/Maps/YouTube/GCP 高可用已 20+ 年。AI 带来**多次系统复杂度跃迁**：微服务跨地域、企业云产品丰富、业务/合规拓扑复杂、AI 代码生成让"可靠性问题机会"激增。Google 把对 agentic AI 的全面采纳称为 **"SRE AI"**，覆盖整个 SDLC（不只是 RCA）。**6 大应用方向**：① 可靠性设计 ② 异常检测与告警（用 TimesFM 而非静态阈值）③ 事件管理 IMAG（agentic orchestration 层）④ 事件调查（自主 mitigation）⑤ 洞察与风险管理（AI Insights + 风险分类）⑥ 设计原则（透明度优先黑盒、合规、安全、SLO、可解释、业务连续性）。底层基础设施：**Gemini + Gemini Enterprise Agent Platform（前 Vertex AI）+ Agent Development Kit（ADK）+ MCP 服务器**。完整白皮书 *AI in SRE Practice: Moving Beyond Automation at Google* 可下载。

---

## 段对段对照

**EN**: Since its inception over 20 years ago, Google has used Site Reliability Engineering (SRE) to keep services like Search, Gmail, Maps, YouTube and Google Cloud reliable and highly available, adhering to the principles and practices of the reliability-first mindset.

**中**: 自 20 多年前诞生以来，Google 一直用站点可靠性工程（SRE）保持 Search、Gmail、Maps、YouTube、Google Cloud 等服务的可靠性和高可用性——坚守"可靠性优先"心智的原则与实践。

**EN**: Recently though, the emergence of AI has driven multiple step-changes in system complexity. Interactions between components are now more complicated due to a variety of factors:
- With microservice architectures, systems are distributed across wider geographical locations and data centers that have greater hardware diversity.
- Enterprise cloud products offer an extensive array of capabilities with an incredibly complex set of products.
- Google services now cover more unique business and regulatory requirements...
- AI code generation capabilities have enabled software developers to deliver orders of magnitude more code, resulting in more opportunities to introduce reliability issues.

**中**: 但近期 **AI 的出现驱动了多次系统复杂度的跃迁**。组件间的交互因多个因素变得更复杂：
- 微服务架构让系统跨更广阔地理位置和硬件多样化的数据中心分布
- 企业云产品提供极丰富能力，产品集复杂到难以置信
- Google 服务现在覆盖更多独特业务和监管需求，整体拓扑/分类愈发复杂，**持续部署管道带来的不断变化让难度被放大**
- AI 代码生成让开发者**数量级地**多产出代码，导致引入可靠性问题的机会也多了数量级

**EN**: While AI is in some ways making the SRE team's work more challenging, it also provides new ways to understand and improve software development lifecycles, including production operations. Google SRE is on the path to fully adopt AI and agentic technologies, leveraging AI as a force multiplier while also maintaining control. **We call this SRE AI.**

**中**: 虽然 AI 在某种程度让 SRE 工作更难，但它也为理解和改进软件开发生命周期（含生产运营）提供了新方式。Google SRE 正在走全面采纳 AI 和 agentic 技术的道路，把 AI 作为**力量倍增器**同时保持控制权。**我们把这称为 SRE AI。**

### The SRE AI opportunity landscape｜SRE AI 机会全景

**EN**: To help define our SRE AI strategy, we considered the overall software development lifecycle (SDLC) for areas of opportunity. Perhaps the most obvious SRE area that could benefit from agentic AI is investigation and mitigation, sometimes referred to as root cause analysis (RCA), a cornerstone of the traditional SRE discipline. **But RCA is by no means the whole SRE AI.** Our plans for SRE AI go far beyond RCA and troubleshooting, and address the entire SDLC.

**中**: 为定义 SRE AI 战略，我们从整个软件开发生命周期（SDLC）找机会。Agentic AI 最显而易见能受益的 SRE 领域可能是**调查与缓解（即根因分析 RCA）**——这是传统 SRE 学科的基石。**但 RCA 绝非 SRE AI 的全部。** 我们的 SRE AI 计划远超 RCA 和故障排查，**覆盖整个 SDLC**。

## 1. Reliability design｜可靠性设计

**EN**: SRE has been working on the policies, tooling and procedures you need to ensure reliability is an integral part of system design through the design, launch, and deployment phases. An agentic approach does not necessarily imply removing people from the process, specifically for higher-risk services and features, but it does significantly reduce the time people need to spend, as a number of issues can be detected and auto-addressed before they need to be reviewed by a person.

**中**: SRE 一直在做策略、工具、流程，确保可靠性是系统设计/上线/部署各阶段的内置部分。Agentic 方式**并不必然把人从流程中拿掉**（尤其是高风险服务/功能），但它显著减少人需要花的时间——大量问题在需要人审之前就能被检测并自动处理。

**EN**: Runbooks (playbooks) and other documentation to be used during incidents are important production artifacts. Google SRE has developed AI agents to continuously monitor and improve playbooks and production documentation based on their usage during incidents. AI agents can also generate new playbooks from incidents.

**中**: Runbook（故障应急手册）等文档是关键生产 artifact。Google SRE 已开发 AI Agent **持续监控和改进 playbook + 生产文档**（基于事件中的实际使用情况）。AI Agent 还能**从事件中自动生成新 playbook**。

## 2. Anomaly detection and alerting｜异常检测与告警

**EN**: A core SRE practice is to define service level indicators (SLIs) and service level objectives (SLOs), and to configure alerts for them. This approach tends to be ok if service use cases are fairly uniform... However, for products that support a range of customer use cases and workloads, like many in Google Cloud, it can be difficult to define a static threshold that works across a variety of workloads.

**中**: SRE 的核心实践是定义 **SLI / SLO**，配置告警。当服务用例相对统一、能定义对齐客户期望的目标时，这种方法尚可。但**对于支持多样客户用例的产品（如 GCP 很多产品），很难定义跨工作负载都适用的静态阈值**。

**EN**: With AI, Google SRE is augmenting our more traditional approaches with anomaly detection, with alerts based on detecting anomalies in regular behavior rather than statically predefined thresholds. This approach relies on agents to collect signals and feed them to a model (e.g., TimesFM) to perform anomaly detection.

**中**: 用 AI，Google SRE 用**异常检测**增强传统方法——告警基于"检测出常规行为的异常"而非"静态预设阈值"。这种方法依赖 Agent 收集信号 + 喂给模型（如 **TimesFM**）做异常检测。

**EN**: Historical signals from prior customer cases help the AI agent to predict customer-oriented SLOs. Further, AI-based anomaly detection can consult sources beyond signals produced by service itself — for instance, customer feedback.

**中**: 之前客户案例的历史信号帮助 AI Agent 预测**面向客户的 SLO**。此外，AI 异常检测可以咨询服务本身信号之外的来源——比如**客户反馈**。

**EN**: In this model, when the SRE AI agent detects an anomaly, it triggers an alert. Then, the SRE AI alerting agent groups, pre-processes, and enriches the alerts with the necessary context and information. These alerts in turn are run through autonomous AI alert handlers, which can address or mitigate a multitude of issues. **What's key in this ecosystem of agents is to be consistently transparent about what the data agents are evaluating — and how — and having consistent controls to prevent unwanted mutations of production state.**

**中**: 在这个模型里，当 SRE AI Agent 检测到异常，它触发告警。然后 SRE AI 告警 Agent **分组、预处理、用必要上下文丰富告警**。告警接着流过自主 AI 告警处理器，可以处理或缓解多类问题。**Agent 生态里的关键是：一致地对"Agent 在评估什么数据、怎么评估"保持透明，并有一致的控制手段防止对生产状态的非预期变更。**

## 3. Incident management｜事件管理

**EN**: Within Google SRE, incident management, or IMAG, is a well-established process with clear roles and responsibilities, as well as tooling. SRE AI includes an agentic orchestration layer on top of the current IMAG process, which consists of agents that:
- Monitor the communication surfaces used during the incident...
- Support handoff between SREs participating in the incident, by creating handoff documents with necessary context
- Automatically create drafts of incident postmortems...
- Manage internal and external incident communications

**中**: Google SRE 的事件管理（**IMAG**）是一个角色/职责/工具清晰的成熟流程。SRE AI 在当前 IMAG 流程之上加了一个 **agentic 编排层**，由若干 Agent 组成：
- 监听事件期间的所有通信面（事件响应工具、聊天空间、视频、跟踪文档），**整合/总结数据改善事件期间的沟通和信息共享**
- 支持事件参与 SRE 之间的**交接**——创建带必要上下文的交接文档
- 自动**起草事件复盘**（postmortem），提高质量、减少 SRE 工作、确保相关信息齐全
- 管理**内外部事件沟通**

## 4. Incident investigation｜事件调查

**EN**: The Google SRE team has also created agents to investigate incidents, and in some cases to autonomously mitigate issues. Before they can proceed to form hypotheses and propose mitigation steps, these agents use observability data (logging, monitoring, tracing), as well as system topology, taxonomy, and dependency data to establish domain and intent.

**中**: Google SRE 团队也建了**事件调查 Agent**，某些情况下能**自主缓解问题**。在形成假设/提出缓解步骤之前，这些 Agent 用**可观测性数据（日志/监控/追踪）+ 系统拓扑/分类/依赖数据**建立领域和意图。

**EN**: A few other building blocks that these agents use are distinct agents the team has created for navigating and executing playbooks, accessing alerting, performing anomaly detection, and deriving incident insights.

**中**: 这些 Agent 用的其他构件包括团队建的几个独立 Agent：**导航和执行 playbook、访问告警、做异常检测、推导事件洞察**。

## 5. Insights and risk management｜洞察与风险管理

**EN**: SRE requires an understanding of the end-to-end system and effective mitigation solutions, experience and lessons learned from past incidents, and the ability to perform risk management. Autonomous AI agents need similar skills to be able to manage production environments.

**中**: SRE 需要：**端到端系统理解 + 有效缓解方案 + 过往事件经验教训 + 风险管理能力**。自主 AI Agent 需要类似技能才能管理生产环境。

**EN**: While a common topology or taxonomy system can teach agents about the end-to-end system, and well-documented and described production Model Context Protocol (MCP) tools and skills can teach them about available tooling, **there needs to be a way to continuously teach agents about historical issues and their associated risks. To solve that problem, the Google SRE team created AI Insights**, a system that continuously reviews known incidents and extracts meaningful information from them, then makes it available to agents to drive better investigations and mitigation steps. Gemini embedding models and vector-enabled databases power this system.

**中**: 一个通用拓扑/分类系统可以教 Agent 关于端到端系统的知识，描述良好的生产 **Model Context Protocol（MCP）** 工具和 skill 可以教它们可用工具。**但还需要一种持续教 Agent 关于历史问题和相关风险的方法。为此，Google SRE 团队创建了 AI Insights**——一个持续审阅已知事件并提取有意义信息的系统，把信息供给 Agent 驱动更好的调查和缓解。**Gemini embedding 模型 + 向量数据库**驱动该系统。

**EN**: The other part of the system is risk insights. The AI system marks each incident with appropriate risk categories that can be used both by agents before applying mitigations, and by SREs to determine critical areas to address.

**中**: 系统的另一部分是**风险洞察**——AI 系统给每个事件标上合适的**风险类别**，既给 Agent 在应用缓解前用，也给 SRE 用来判断关键领域。

## 6. Design considerations｜设计原则（9 条）

**EN**: Before building out these agents, Google SRE defined a few high level principles for their adoption:
- Processes and operations that are already successfully automated, or that can be easily automated with classic non-AI based systems, do not need to be replaced (as long as they meet business needs).
- Any new AI-based system must comply with existing and upcoming policies and procedures...
- An SRE AI agent needs to meet security, safety, and privacy requirements the same way as current systems and humans.
- SRE AI agents must have a strong identity (agents have roles and permissions assigned).
- SRE AI agents need to provide a high level of reliability SLOs and have well-defined backup options (automated or manual).
- **SRE AI agents must be able to explain and reason about why and how they performed an action, as well as what options were considered and rejected. In other words, we favor transparency over black-box automation.**
- Business continuity plans must include contingencies for potential AI failures.
- AI-based systems need continuous access to production data to make correct decisions.
- AI systems need to be continuously evaluated against a quality framework, as well as to support auditing and reporting to enable security tooling like detection and response.

**中**: 构建 Agent 前，Google SRE 定义了高层采纳原则：
1. **已成功自动化的流程或经典非 AI 系统能轻松自动化的流程，不需要替换**（只要满足业务需求）
2. 任何新 AI 系统必须符合现有和即将出台的策略与流程
3. SRE AI Agent 必须像现有系统和人一样满足**安全、安全性、隐私**要求
4. SRE AI Agent 必须有**强身份**（Agent 有分配的角色和权限）
5. SRE AI Agent 需要提供**高可靠性 SLO + 定义良好的备份方案**（自动或人工）
6. **SRE AI Agent 必须能解释和推理"为什么和怎么"执行了某行为，以及考虑和拒绝了什么选项**。换言之，**我们偏好透明度优于黑盒自动化**。
7. 业务连续性计划必须包含 **AI 失效的应急预案**
8. AI 系统需要**持续访问生产数据**才能做正确决策
9. AI 系统需要**持续被质量框架评估**，且支持审计和报告以启用检测/响应等安全工具

**EN**: SRE AI systems should make Google services even better for users and customers by accomplishing at least one of the following:
- Relieve engineers from laborious and repetitive operations
- Help engineers improve the quality and speed of decision making and execution
- Allow SREs to better prevent, detect, and/or mitigate problems than they could address before
- Enable autonomous agentic feedback loops that drive toward service reliability improvements
- Reduce overall operational costs

**中**: SRE AI 系统应通过完成以下至少一条让 Google 服务更好：
- 把工程师从繁琐重复操作中解放
- 提升决策和执行的**质量和速度**
- 让 SRE 比以前**更好地预防、检测、缓解**问题
- 启用驱动服务可靠性改进的**自主 agentic 反馈循环**
- 降低整体运营成本

## Built on proven infrastructure｜底层基础设施

**EN**: Google SRE AI is built on proven Google infrastructure:
- **Gemini**: The base foundational model behind Google SRE AI. The SRE team also depends heavily on custom fine-tuned Gemini models based on internal Google data and knowledge.
- **Gemini Enterprise Agent Platform (formerly Vertex AI)**: A full AI stack for developing solutions.
- **Agent Development Kit (ADK)**: The development platform.
- **MCP servers**: Running on top of standard Google API infrastructure, this is the same infrastructure used to provide external customers with MCP support.
- Standard internal observability infrastructure (monitoring, logging, tracing).
- AI and ML capabilities built into Google BigQuery, and Google vector databases.

**中**: Google SRE AI 构建在被验证的 Google 基础设施上：
- **Gemini**：SRE AI 背后的基础大模型。SRE 团队也大量依赖**基于 Google 内部数据和知识做 fine-tune 的定制 Gemini 模型**
- **Gemini Enterprise Agent Platform**（原 Vertex AI）：开发解决方案的全栈 AI
- **Agent Development Kit (ADK)**：开发平台
- **MCP servers**：跑在标准 Google API 基础设施上——和提供给外部客户的 MCP 支持是同一套基础设施
- 标准内部可观测性基础设施（监控/日志/追踪）
- **Google BigQuery** 内置的 AI/ML 能力 + Google 向量数据库

**EN**: We group these infrastructure components together into autonomous systems. At Google, we've been developing and using autonomous systems to manage production for a long time. However, today's AI-based autonomous systems are very powerful and not always deterministic. To help us understand how autonomous the systems truly are, **we developed a way to track autonomous levels**.

**中**: 我们把这些基础设施组件组合成**自主系统**。Google 长期用自主系统管理生产。但今天 AI 驱动的自主系统**极强大且并不总是确定性的**。为帮我们理解系统**真正的自主程度**，**我们开发了一套跟踪自主等级（autonomous levels）的方法**。

---

## 关键启示（对中国企业 AIOps 建设）

1. **AI 让系统复杂度跃迁**——AI 既是 SRE 工作的额外难度来源，也是新工具
2. **SRE AI ≠ 只是 RCA**——Google 6 大方向：设计 / 异常检测 / 事件管理 / 调查 / 洞察风险 / 设计原则
3. **TimesFM 异常检测**取代静态阈值——值得国内借鉴
4. **AI Insights** 持续从历史事件抽取知识喂给 Agent——这是闭环的关键
5. **9 条设计原则核心**：透明度 > 黑盒；强身份 + RBAC；高 SLO + 备份；业务连续性含 AI 失效预案
6. **底层栈**：基础模型 + Agent 平台 + ADK + **MCP** + 可观测性 + 向量库
7. **自主等级跟踪**——量化 Agent 真正的自主程度

## 原文 / 白皮书链接

- 原文：https://cloud.google.com/blog/products/devops-sre/how-google-sre-is-using-agentic-ai-to-improve-operations
- 完整白皮书：*AI in SRE Practice: Moving Beyond Automation at Google*（https://goo.gle/4uUxy4y）
