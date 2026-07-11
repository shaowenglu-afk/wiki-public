Title: Mapping AI-enabled cyber threats

URL Source: https://www.anthropic.com/research/attack-navigator

Markdown Content:
_Kyla Guru, Alex Moix, and Jacob Klein_

_作者：Kyla Guru、Alex Moix、Jacob Klein_

_We've spent the past year investigating how threat actors are weaponizing AI to conduct cyber operations. Today, we're sharing a new analysis that maps these real-world attacks onto the_ _[MITRE ATT&CK® framework](https://attack.mitre.org/), a database of tactics and techniques used by cyberattackers. Doing so reveals patterns that challenge traditional assumptions about cybersecurity—for example, the level of risk a threat actor poses can be assessed via metrics like technical sophistication or breadth of techniques. We partnered with Verizon to include some of these results in the_ _[2026 Verizon Data Breach Investigation Report (DBIR)](https://www.verizon.com/business/resources/reports/dbir/), and are publishing this report to offer a longer-form analysis of trends we are seeing in AI-enabled cyber operations._[1]

_过去一年，我们持续调查威胁行为者如何将 AI 武器化以实施网络攻击行动。今天，我们发布了一项新分析，将这些真实世界的攻击映射到 [MITRE ATT&CK® 框架](https://attack.mitre.org/)——一个收录网络攻击战术与技术的数据库。这一映射揭示了若干挑战传统网络安全假设的规律，例如：威胁行为者的风险等级通常通过技术复杂度或技术手段覆盖广度等指标来评估。我们与 Verizon 合作，将部分研究结果纳入 [2026 年 Verizon 数据泄露调查报告（DBIR）](https://www.verizon.com/business/resources/reports/dbir/)，并发布本报告，对我们在 AI 赋能网络攻击中所观察到的趋势进行更深入的分析。_[1]

Open the [interactive Navigator in a new tab](https://red.anthropic.com/2026/attack-navigator/navigator.html).

## Key findings
> 主要发现

For this study, we analyzed 832 accounts associated with malicious cyber activity over the course of one year, from March 2025 to March 2026. Anthropic banned these accounts from using Claude for violating our [Usage Policy](https://www.anthropic.com/legal/aup). The accounts in this analysis are just a subset of those we investigated and banned during this time period; we selected them because we had enough detail about their malicious activities to map their techniques onto the MITRE ATT&CK framework.

本研究分析了 2025 年 3 月至 2026 年 3 月期间，与恶意网络活动相关的 832 个账号。这些账号因违反 Anthropic [使用政策](https://www.anthropic.com/legal/aup)而被禁止使用 Claude。本次分析所涉及的账号仅是我们在此期间调查并封禁账号的一部分子集；选取标准是：我们对其恶意活动掌握了足够详细的信息，能够将其技术手段映射到 MITRE ATT&CK 框架。

The 832 accounts in our analysis used AI models for all 14 tactics and 482 unique sub-techniques across the framework, from initial reconnaissance through final impact.[2] We also developed a risk-scoring framework (described later in this post) to assess how much AI assistance helped these actors plan their attacks. Most strikingly, we found that the percentage of actors labeled as being medium risk or higher jumped from 33% to 56% between the first and second halves of the year. This suggests that AI is helping attackers conduct increasingly sophisticated cyber operations with greater ease.

本次分析中的 832 个账号在 ATT&CK 框架的全部 14 个战术和 482 个独特子技术中均有所使用，涵盖从初始侦察到最终影响的完整攻击链。[2] 我们还开发了一套风险评分框架（见后文详述），用于评估 AI 辅助对这些行为者制定攻击计划的贡献程度。最为显著的发现是：在研究周期的前半段至后半段之间，被评定为中风险或更高风险的行为者比例从 33% 跃升至 56%。这表明 AI 正在帮助攻击者以更低的门槛实施日益复杂的网络攻击行动。

There are three key findings from our analysis:

我们的分析得出三项核心发现：

1.   **The number of actors using AI for cyber operations is growing, and their actions carry higher risk.** As mentioned above, the percentage of medium- or high-risk actors increased by a factor of about 1.7 in under a year, from 33% in the first half of our study window to 56% in the second. That growth is concentrated in actors using AI for some of the most harmful activities, including lateral movement, credential dumping, and web shells — that carry the highest per-actor risk weight in our scoring, rather than the commodity build-and-obfuscate work that dominates the rest of the population. Traditionally, only the most technically sophisticated actors could operate across the entire killchain, or the sequential stages of a cyberattack. But our analysis found that this is no longer the case. The platform through which they access the model (such as an API or an agentic coding platform like Claude Code) also has no bearing on how high-risk their actions are. What _does_ distinguish the highest-risk actors is which techniques they're asking the model for.
- **利用 AI 实施网络攻击的行为者数量正在增加，其行动风险等级也在上升。**|如上所述，中高风险行为者的比例在不到一年内提升了约 1.7 倍，从研究窗口前半段的 33% 升至后半段的 56%。这一增长主要集中在利用 AI 实施高危活动的行为者身上，包括横向移动（lateral movement）、凭据转储（credential dumping）和 Web Shell 部署——这些活动在我们的评分体系中每个行为者的风险权重最高，而非那些在群体中普遍存在的工具构建与混淆类工作。传统上，只有技术最为精湛的行为者才能贯穿整个攻击链（killchain，即网络攻击的各个序列阶段）进行作战。但我们的分析发现，这一情况已不复存在。行为者通过哪种平台访问模型（例如 API 或 Claude Code 等代理编程平台）对其行动风险等级并无影响。真正区分最高风险行为者的，是他们向模型请求使用哪些技术手段。
2.   **Agentic scaffolding will make it possible for cyberattacks to be far more autonomous.** As AI-enabled cyber techniques become more common among this population, it will become harder to differentiate an actor's risk level based on what they are asking a model to do. Instead, the differentiator will become the scaffolding—the surrounding code, architecture, and tooling that makes AI models more capable—that actors build _around_ the model so they can chain together attack stages autonomously. This was starkly apparent in the [cyber espionage campaign](https://www.anthropic.com/news/disrupting-AI-espionage) we disrupted in November 2025, which had a maximum risk score of 100 yet only used a number of techniques comparable to medium-risk actors. That attack was distinct not because of the number of techniques it employed but because of how the attackers used an AI agent to orchestrate them.
- **代理脚手架（Agentic scaffolding）将使网络攻击变得高度自主。**|随着 AI 赋能的网络攻击技术在这一群体中愈发普遍，仅凭行为者向模型请求的内容来区分其风险等级将变得愈加困难。取而代之的，差异化因素将是行为者围绕模型构建的"脚手架"——使 AI 模型能力更强的周边代码、架构与工具——以便自主串联各攻击阶段。这一点在我们于 2025 年 11 月挫败的[网络间谍行动](https://www.anthropic.com/news/disrupting-AI-espionage)中表现得尤为突出：该行动风险评分高达满分 100，但其所使用的技术数量却与中风险行为者相当。这次攻击之所以与众不同，并不在于其所使用的技术数量，而在于攻击者如何借助 AI 智能体来统筹协调这些技术。
3.   **The MITRE ATT&CK framework doesn't yet cover the autonomous actions that make these actors so dangerous.** Autonomous killchain orchestration, real-time pivot decisions, and AI-directed execution with no human intervention don't yet have ID numbers in the ATT&CK framework. Our report included 13,873 observations of malicious activity, all of which mapped to categories laid out in the framework—but the behaviors that distinguish the highest-risk actors, and determine the speed and scale of their operations, don't yet have such IDs. The taxonomy that modern threat intelligence relies on needs to grow to capture them.
- **MITRE ATT&CK 框架尚未涵盖使这些行为者极具危险性的自主行动。**|自主攻击链编排、实时转向决策，以及无需人工干预的 AI 主导执行，在 ATT&CK 框架中尚无对应的编号。我们的报告收录了 13,873 条恶意活动观察记录，全部可映射至该框架既有类别——但区分最高风险行为者并决定其行动速度与规模的那些行为，目前仍缺乏对应编号。现代威胁情报所依赖的分类体系需要持续扩展，才能捕捉这些新型行为。

While [Claude Mythos Preview](https://red.anthropic.com/2026/mythos-preview/) demonstrates where frontier AI cyber capabilities are heading—models able to find and exploit vulnerabilities at a level approaching the most skilled human researchers—this report tells us how threat actors are misusing generally available models today. It also serves as a guide to how threat actors are likely to misuse increasingly capable models in the near future, giving defenders a chance to get ahead of them.

[Claude Mythos Preview](https://red.anthropic.com/2026/mythos-preview/) 展示了前沿 AI 网络安全能力的发展方向——模型能够以接近顶尖人类研究员的水平发现并利用漏洞——而本报告则揭示了威胁行为者当前如何滥用普遍可用模型。本报告同时也是一份前瞻性指南，帮助我们预判威胁行为者在不久的将来可能如何滥用能力日益增强的模型，从而为防御者争取先机。

What we learned from this and other analyses directly shapes how we build Claude to prevent such misuse. For example, we've updated the classifiers built into Claude to detect the highest-risk actors, and have expanded our [probe](https://www.anthropic.com/research/next-generation-constitutional-classifiers) detections to cover high-risk behavioral indicators revealed by this analysis. These findings point to a landscape where the dividing line between low and high-risk actors is no longer technical skill but orchestration, and where defenses, detections, and the shared frameworks we all rely on will need to evolve as fast as the attacks they describe.

我们从本次及其他分析中获得的认知，直接影响着我们构建 Claude 以防范此类滥用的方式。例如，我们已更新 Claude 内置的分类器以检测最高风险行为者，并扩展了[探测器](https://www.anthropic.com/research/next-generation-constitutional-classifiers)的检测范围，以涵盖本次分析所揭示的高风险行为指标。这些发现指向一个新格局：区分低风险与高风险行为者的界线，不再是技术能力，而是编排协调能力——防御手段、检测系统以及我们共同依赖的框架体系，都需要以与其所描述的攻击同等的速度演进。

## About the dataset
> 关于数据集

The findings in this report are drawn from 832 accounts that Anthropic banned for violating cyber-related parts of our Usage Policy between March 2025 and March 2026. We identified these accounts through a combination of automated safeguards and investigations by our Threat Intelligence team. For each account, we produced a summary of the observed activity. We then extracted the tactics, techniques, and procedures (or TTPs) described in those summaries, and mapped them to the version of the [MITRE ATT&CK framework](https://attack.mitre.org/versions/v18/) that was live at that time (V18). In all, we observed 13,873 actions across 482 unique techniques and all 14 ATT&CK tactics.

本报告的研究发现来源于 2025 年 3 月至 2026 年 3 月间，Anthropic 因违反使用政策中网络安全相关条款而封禁的 832 个账号。我们通过自动防护措施与威胁情报团队的人工调查相结合的方式识别了这些账号。针对每个账号，我们整理了观察到的活动摘要，随后从摘要中提取战术、技术与程序（TTPs），并将其映射到当时生效的 [MITRE ATT&CK 框架](https://attack.mitre.org/versions/v18/)版本（V18）。总计，我们观察到跨越 482 个独特技术和全部 14 个 ATT&CK 战术的 13,873 项行动。

We gave each actor a risk score from 0 to 100 (with 0 being the lowest risk and 100 being the highest) based on a new methodology we've developed called the AI Risk Enablement Score (ARiES), described below. We've anonymized the data so that actors cannot be identified in the analysis that follows.

我们依据自行开发的新方法论——AI 风险赋能评分（ARiES，AI Risk Enablement Score）——对每个行为者给予 0 至 100 的风险评分（0 为最低风险，100 为最高风险），详见下文说明。数据均已匿名处理，以确保后续分析中无法识别具体行为者身份。

## The LLM ATT&CK Navigator and ARiES risk score
> LLM ATT&CK 导航器与 ARiES 风险评分

As part of this analysis, we developed the LLM ATT&CK Navigator: an interactive framework that maps observed AI-enabled misuse patterns onto the MITRE ATT&CK framework and assigns an ARiES risk score to the actor. ARiES is a composite score built from three signals: the actor's threat profile, the model's contribution to the requested harm, and the observed or potential impact. It is calculated based on the actor's activity across Claude.ai, Claude Code, and our API, drawing on our safety classifiers alongside open-source and internal threat-intelligence indicators. The higher the score, the higher-risk the AI enabled actor is.

作为本次分析的组成部分，我们开发了 LLM ATT&CK 导航器：一个将观察到的 AI 赋能滥用模式映射到 MITRE ATT&CK 框架并为行为者分配 ARiES 风险评分的交互式框架。ARiES 是由三个信号构成的综合评分：行为者的威胁画像、模型对所请求危害的贡献程度，以及已观察到或潜在的影响。评分基于行为者在 Claude.ai、Claude Code 和 API 上的活动计算，综合运用安全分类器以及开源和内部威胁情报指标。评分越高，AI 赋能的行为者风险等级越高。

Our framework scores both individual techniques and accounts across three dimensions:

我们的框架从三个维度对单个技术和账号进行评分：

*   **Threat (0–35 points):** Evaluates the clarity of the actor's intent, their technical sophistication, threat intelligence signals, and tactics employed by the account to evade detection. Technical sophistication is graded by Claude on the basis of the actor's prompts and tool usage, measuring expertise required, operator skill, bespoke-versus-commodity tooling, and capability depth.｜**威胁（0–35 分）：**评估行为者意图的明确程度、技术复杂度、威胁情报信号，以及该账号为规避检测所采用的战术。技术复杂度由 Claude 根据行为者的提示词和工具使用情况评定，衡量所需专业知识、操作者技能、定制工具与通用工具的使用，以及能力深度。
*   **Vulnerability (0–35 points):** Assesses the model's capacity to enable the requested harm and the risk profile of the interface used. Programmatic interfaces (i.e. API) and agentic coding tools like Claude Code score highest due to their potential to automate actions.｜**脆弱性（0–35 分）：**评估模型实现所请求危害的能力，以及所用接口的风险画像。程序化接口（如 API）和 Claude Code 等代理编程工具因其自动化行动的潜力而得分最高。
*   **Impact (0–30 points):** Captures the real-world effects of the user's behavior through scores assigned by our safety classifiers and investigators' assessment of actual or potential consequences attributable to AI's involvement in the operation.｜**影响（0–30 分）：**通过安全分类器的评分及调查人员对 AI 介入行动所产生的实际或潜在后果的评估，捕捉用户行为的现实世界影响。

Together, these components produce a total risk score from 0 to 100, allowing us to categorize threat actors and techniques into low, medium, high, and critical risk tiers.

三个维度合计产生 0 至 100 的总风险评分，使我们能够将威胁行为者和技术手段划分为低、中、高和严重四个风险层级。

### A note on the scoring formula
> 关于评分公式的说明

## How cyber threat actors are using AI today
> 网络威胁行为者当前如何使用 AI

Our empirical analysis of 13,873 observed techniques reveals clear patterns in how adversaries are using AI across the attack lifecycle, and the most common techniques that models are being used for today.

对 13,873 项观察技术的实证分析揭示了对手在整个攻击生命周期中使用 AI 的清晰规律，以及当前模型最常被用于的技术手段。

### AI-assisted capability development
> AI 辅助能力开发

The most common technique family we observed was ATT&CK ID T1587 (Develop Capabilities), used by 574 of the 832 actors in our analysis, or 69%. The majority of this behavior manifests as T1587.001 (Malware Development), used by 560 actors. In practice, we observe threat actors misusing models to build and refine custom scripts to run, write DLL injection code with detailed guidance on how to implement it, as well as canvas fingerprinting evasion and automated account management.

我们观察到的最常见技术系列是 ATT&CK ID T1587（开发能力），在分析的 832 个行为者中，有 574 个（69%）使用了该技术。此类行为大多表现为 T1587.001（恶意软件开发），被 560 个行为者使用。实际上，我们观察到威胁行为者滥用模型来构建和完善自定义运行脚本、编写附有详细实施指南的 DLL 注入代码，以及实施 Canvas 指纹规避和自动化账号管理。

The next most prevalent techniques are T1027 (Obfuscated Files or Information), employed by 64.7% of threat actors; T1005 (Data from Local System), employed by 55.9% of threat actors; and T1562 (Impair Defenses), employed by 54.9% of threat actors. Together, these top techniques show that threat actors most commonly seek LLM's help to build pre-engagement offensive tooling, make those tools harder to detect, and harvest data from compromised systems.

次为常见的技术包括：T1027（混淆文件或信息），被 64.7% 的威胁行为者使用；T1005（来自本地系统的数据），被 55.9% 使用；T1562（削弱防御），被 54.9% 使用。综合来看，这些最常用技术表明：威胁行为者最常向大语言模型（LLM）寻求帮助，以构建预攻击阶段的进攻性工具、使工具更难被检测，以及从已入侵系统中收集数据。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F874b2d4a58a39facdf11e94d3a5a5b738b97f9eb-1920x1080.png&w=3840&q=75)

On the other hand, actors are much less likely to use LLMs for real-time, adaptive decision-making once they've gotten inside a target network. For example, only 54 of 832 threat actors (6.5%) use models for lateral movement, and less than 12 actors use models for remote services like RDP, SSH, and SMB. Only 22.5% of actors use LLMs for privilege escalation and impact stages.

另一方面，一旦进入目标网络，行为者利用大语言模型进行实时自适应决策的可能性则大幅降低。例如，832 个威胁行为者中仅有 54 个（6.5%）使用模型实施横向移动，使用模型访问 RDP、SSH、SMB 等远程服务的行为者不足 12 个。仅有 22.5% 的行为者在权限提升和影响阶段使用大语言模型。

Some technique families that are staples of real-world cyberattacks—such as active directory exploitation, Kerberos ticket attacks, cloud infrastructure manipulation (AWS, Azure, GCP), and container escape —have notably lower representation within the dataset.

一些在真实世界网络攻击中惯常使用的技术系列——如活动目录利用、Kerberos 票据攻击、云基础设施操控（AWS、Azure、GCP）以及容器逃逸——在数据集中的占比明显较低。

The top techniques and the frequency with which actors used them didn't change much over the one-year period we studied. For both the first and second halves of the period, the median number of techniques the model is used for is 16. In the second half of the year, we observe a subtle directional shift, with threat actors using models less to build standalone malware or obfuscation scripts and more to help with specific operational phases in a cyberattack, and for on-target discovery and collection techniques. Specifically, we observe an 8.9% increase in T1087 (Account Discovery) occurrences, as well as a 6.2% increase in T1020 (Automated Exfiltration), alongside a 12% decrease in T1587 (Develop Capabilities) and a 8.6% decrease in T1566 (Phishing).

在我们研究的一年期间，最常用技术及其使用频率变化不大。在前半段和后半段，模型被用于的技术数量中位数均为 16。在后半年，我们观察到一个微妙的方向性转变：威胁行为者越来越少使用模型构建独立恶意软件或混淆脚本，而更多地用于协助网络攻击的特定操作阶段，以及针对目标的发现和数据收集技术。具体而言，T1087（账号发现）出现频率增加 8.9%，T1020（自动化渗漏）增加 6.2%，同时 T1587（开发能力）下降 12%，T1566（网络钓鱼）下降 8.6%。

### AI-assisted evasion tactics
> AI 辅助规避战术

Defense evasion is the single largest tactic category in the dataset, present in the behavior of 84.4% of the actors we studied. MITRE defines 64 techniques under "defense evasion" (across its [Enterprise](https://attack.mitre.org/tactics/TA0005/)- and [Mobile](https://attack.mitre.org/tactics/TA0030/)-specific frameworks); we observe 32 of these techniques in our dataset: 25 for enterprise and 7 for mobile.

防御规避是数据集中规模最大的单一战术类别，存在于 84.4% 研究行为者的行为模式中。MITRE 在"防御规避"下定义了 64 种技术（涵盖其[企业](https://attack.mitre.org/tactics/TA0005/)和[移动端](https://attack.mitre.org/tactics/TA0030/)专项框架）；我们在数据集中观察到其中 32 种：企业场景 25 种，移动端 7 种。

The top techniques observed within this tactic include:

该战术中观察到的主要技术包括：

*   **T1027 (Obfuscated Files or Information).** 64.7% of threat actors in our sample used AI to implement techniques like XOR/base64 encoding, polymorphic variants, and anti-detection wrappers to evade signature-based detection.｜**T1027（混淆文件或信息）。**样本中 64.7% 的威胁行为者使用 AI 实施 XOR/base64 编码、多态变体和反检测包装等技术，以规避基于特征码的检测。
*   **T1562 (Impair Defenses).** 54.8% of the threat actors studied used AI to bypass, disable, or tamper endpoint security tools.｜**T1562（削弱防御）。**研究中 54.8% 的威胁行为者使用 AI 绕过、禁用或篡改端点安全工具。
*   **T1055 (Process Injection).** 30.3% of actors used AI to write malicious code that could be injected into legitimate processes, such as process hollowing and DLL injection, to execute payloads from trusted process memory.｜**T1055（进程注入）。**30.3% 的行为者使用 AI 编写可注入合法进程的恶意代码，如进程空洞化和 DLL 注入，以从受信进程内存执行载荷。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F0b39dcf58771ac31ddf63bed85496734ebe935c0-1920x1080.png&w=3840&q=75)

Less frequently used tactics include impact (2.8%), exfiltration (2.8%), privilege escalation (2.4%), and lateral movement (0.7%). Together, these account for just 8.7% of all observations—less than defense evasion alone. These actions all occur later in the attack life cycle, suggesting that threat actors are using models more in the early stages of an attack but less in the later stages—that is, once they have infiltrated a network and are adapting to conditions in a live environment. This pattern remained stable over the one-year period we studied.

使用频率较低的战术包括：影响（2.8%）、数据渗漏（2.8%）、权限提升（2.4%）和横向移动（0.7%）。合计仅占全部观察记录的 8.7%——甚至低于防御规避单项。这些行动均发生在攻击生命周期的后期，表明威胁行为者在攻击早期阶段更多依赖模型，而在后期阶段——即渗入网络并适应真实环境条件之后——使用模型的频率则明显降低。这一规律在我们研究的一年间保持稳定。

### High-risk actors and their tactics
> 高风险行为者及其战术

While tactics such as lateral movement are much less prevalent in our dataset, they are highly correlated with the highest ARiES risk scores—meaning that the highest-risk actors are also the ones most likely to use models for the later stages of a cyberattack. Actors who use AI to perform lateral movement have risk scores that are, on average, 10.5 points higher than actors who do not use AI tools in this way. This suggests that going from using AI to prepare for a cyberattack to using it to take actions in live network operations is a key marker of high AI enablement.

尽管横向移动等战术在数据集中出现频率较低，但它们与最高 ARiES 风险评分高度相关——这意味着风险最高的行为者也最有可能将模型用于网络攻击的后期阶段。使用 AI 实施横向移动的行为者，其风险评分平均比不以此方式使用 AI 工具的行为者高出 10.5 分。这表明，从使用 AI 进行攻击准备转变为在实时网络运营中使用 AI 采取行动，是 AI 高度赋能的关键标志。

![Image 3](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fa49e9300340c4e11f1147d874bf097a9f1f55fe5-1920x1080.png&w=3840&q=75)

Overall, the actors with the highest risk scores used AI most heavily for post-compromise, hands-on-keyboard techniques, such as remote services, credential dumping, web shell deployment, and internal network and account discovery. Lateral movement was the strongest marker of a high-risk actor: the 54 actors in our dataset who used lateral movement had an average risk score of 56.4, nearly 10 points above the mean of 46.8. No other technique came close to having such predictive power.

总体而言，风险评分最高的行为者在后渗透、手动操控键盘类技术上对 AI 的依赖程度最高，包括远程服务、凭据转储、Web Shell 部署以及内部网络和账号发现。横向移动是高风险行为者最强的标志性指标：数据集中 54 个使用横向移动的行为者平均风险评分为 56.4，比均值 46.8 高出近 10 分。没有任何其他技术接近具有如此强的预测能力。

At the technique level, the techniques that were most commonly used by the highest-risk actors were T1021 (Remote Services: SSH/SMB), T1078.003 (Valid Accounts), T1003 (OS Credential Dumping), T1560 (Archive Collected Data), and T1505.003 (Web Shell). These were all three to five times more common among the highest-risk actors compared to the overall population.

在技术层面，最高风险行为者最常使用的技术包括：T1021（远程服务：SSH/SMB）、T1078.003（有效账号）、T1003（操作系统凭据转储）、T1560（归档已收集数据）和 T1505.003（Web Shell）。这些技术在最高风险行为者中的使用频率是整体群体的三到五倍。

Meanwhile, the most ubiquitous tactics (such as defense evasion and resource development) and commodity techniques (such as credential stuffing and spearphishing) were used at roughly the same frequency by both the highest- and lowest-risk actors, which is unsurprising given that these tactics are so common. Taken together, the data suggests that the majority of threat actors are using AI to build artifacts like malicious code in the preparatory stages of an attack, but the highest-risk actors are using models both in the preparatory stages of an attack as well during the hands-on work inside a compromised network.

与此同时，最为普遍的战术（如防御规避和资源开发）以及通用技术（如凭据填充和鱼叉式网络钓鱼）在最高风险和最低风险行为者中的使用频率大致相当，这与这些战术本身的普遍性相符，并不令人意外。综合来看，数据表明大多数威胁行为者在攻击准备阶段使用 AI 构建恶意代码等工件，而最高风险行为者不仅在准备阶段使用模型，也在渗透进网络后的手动操控阶段加以使用。

We also found that the attributes that threat-intelligence teams typically lean on to assess threat actors—such as their assessed technical skill, choice of interface, or number of techniques used—are weak predictors of how much uplift an AI model might provide to a given threat actor. Technical sophistication, once removed from the composite score to avoid circularity, correlates with the remaining risk components at only r = 0.28. In fact, removing this characteristic entirely leaves the top six actors in identical rank order (Spearman ρ = 0.96 across all 832). The high-risk tail is not an artifact of the Technical Sophistication component.

我们还发现，威胁情报团队通常用于评估威胁行为者的属性——如评估的技术技能、接口选择或使用技术数量——对于预测 AI 模型可能为特定威胁行为者提供多大提升而言，预测力较弱。技术复杂度一旦从综合评分中剔除以避免循环论证，其与其余风险组件的相关性仅为 r = 0.28。事实上，完全移除这一特征后，排名前六的行为者仍保持完全相同的排名顺序（在全部 832 个行为者中，Spearman ρ = 0.96）。高风险尾部并非技术复杂度组件的产物。

The correlation between breadth of technique coverage and risk score is also only weakly positive (r = 0.27). Most actors are using the models for a smattering of techniquesin fact, the median actor in our dataset deployed 16 distinct MITRE ATT&CK techniques—a breadth that, five years ago, may have signaled a well-resourced, technically mature operation.

技术覆盖广度与风险评分之间的相关性同样仅为弱正相关（r = 0.27）。大多数行为者仅将模型用于零散的技术手段——事实上，数据集中的中位行为者部署了 16 种不同的 MITRE ATT&CK 技术——而这一广度，在五年前或许还意味着一个资源充足、技术成熟的攻击行动。

![Image 4](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fa3c0c41c2035271e0d94d64a5561af5bfaad5f61-1920x1080.png&w=3840&q=75)

Lastly, interface choice tells a similar story — 80% of the actors in this study misused Claude Code, making agentic tooling the default mode of access rather than a distinguishing one, and actors restricted to the conversational interface, the API, or agentic coding tools converge on statistically indistinguishable risk profiles.

最后，接口选择呈现出类似的规律——本研究中 80% 的行为者滥用了 Claude Code，使代理工具成为默认访问模式而非差异化因素，而仅限于对话界面、API 或代理编程工具的行为者，其风险画像在统计上无法区分。

What this tells us is that the malicious actors who get the most uplift from AI are not necessarily more technically sophisticated than other actors, nor do they necessarily use coding tools or use Claude across multiple steps of the killchain; rather, they simply used Claude for more hands-on techniques.

这告诉我们：从 AI 中获得最大提升的恶意行为者，未必比其他行为者更具技术复杂度，也未必使用编程工具或在攻击链多个步骤中使用 Claude；他们的区别仅在于：他们将 Claude 用于更多需要亲自动手的技术操作。

### Live exploitation actors on the rise
> 实时利用漏洞的行为者日益增多

As we discussed above, the share of actors scoring medium-risk or higher on AI enablement grew from roughly 33.5% in the first six-month period of the study to roughly 56.1% in the second—a 1.7x increase in under a year. The cohort shifted between these two periods by about 22.6 percentage points: while the majority of actors had a low risk score in the first six-month period, the majority had a medium risk score in the second six-month period.

如上所述，AI 赋能评分达到中风险或更高风险的行为者比例，从研究前六个月的约 33.5% 增长至后六个月的约 56.1%——在不到一年内增加了 1.7 倍。这一群体在两个时期之间转移了约 22.6 个百分点：前六个月中大多数行为者风险评分较低，而后六个月中大多数行为者风险评分升至中等。

While improved threat detection techniques may have contributed to this increase, we also see an increasing number of actors asking the model for more operational, in-network work that used to appear only in a much smaller cohort of high-risk actors. In the second six-month period of the study, we saw more specialized actors using models to build exploitation tooling, C2 infrastructure, and remote access trojans —but we also saw more low- and mid-skill actors using models not just for preparatory tasks but for live operations. The 8.9% increase in T1087 (Account Discovery) and 6.2% increase in T1020 (Automated Exfiltration) techniques we observed from the first six-month period to the second are consistent with this: the techniques that are becoming more frequent are the ones that imply the actor has already accessed the network.

尽管检测技术的改进可能对这一增长有所贡献，但我们也看到越来越多的行为者向模型寻求更具操作性的网内作业——这些工作过去只出现在一个规模小得多的高风险行为者群体中。在研究后半段的六个月里，我们看到更多专业化行为者使用模型构建漏洞利用工具、C2 基础设施和远程访问木马——但同时也看到更多低技能和中技能行为者不仅将模型用于准备性任务，还将其用于实时行动。从前六个月到后六个月，T1087（账号发现）使用频率增加 8.9%、T1020（自动化渗漏）增加 6.2%，与这一趋势吻合：使用频率日益增加的技术，正是那些意味着行为者已经进入网络的技术。

What this means for defenders: the population of AI-enabled actors is not only growing but also drifting towards the riskiest activities in our framework, without requiring the actors themselves to become any more skilled. If this trend continues, these operational techniques won't be a differentiating factor anymore and will become the baseline tomorrow — and we'll need to find a new way to measure the riskiest actors. In the next section, we'll discuss how we might be able to do this going forward.

这对防御者意味着：AI 赋能行为者的群体不仅在增长，而且正在向我们框架中风险最高的活动漂移，而这一过程并不要求行为者自身变得更加娴熟。如果这一趋势持续下去，这些操作性技术将不再是差异化因素，而将成为明天的基准线——我们将需要找到一种新的方式来衡量风险最高的行为者。在下一节中，我们将探讨未来如何实现这一目标。

![Image 5](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Febeb4f94ff4235c8c1d70f799c28299277c792d2-1920x1080.png&w=3840&q=75)

## Novelty and sophistication in the age of AI agents
> AI 智能体时代的新颖性与复杂性

Looking at our highest-risk threat actors also underscores that calculating the risk of AI-enabled cyber operations based on number, type, or breadth of attack techniques is insufficient. We also need a way to understand the _scaffolding_ threat actors are able to build to chain these techniques together to use in live operations, which allows them to use AI models to autonomously execute large swaths of a cyberattack without human intervention.

审视最高风险威胁行为者的情况，进一步印证了仅凭攻击技术的数量、类型或广度来计算 AI 赋能网络攻击风险的方式已然不足。我们还需要一种方式来理解威胁行为者能够构建的"脚手架"——他们借此将这些技术串联起来用于实时操作，从而无需人工干预就能自主执行大量网络攻击活动。

We analyzed the behavior of the threat actor who orchestrated the AI-enabled cyber espionage campaign we [reported on in November 2025](https://www.anthropic.com/news/disrupting-AI-espionage), labeled GTG-1002, we see that this actor achieved the maximum possible risk score of 100, successfully compromised government and critical infrastructure targets across multiple countries, and developed a scaffolding to use Claude Code not as an advisor, but as an autonomous operator. Yet their overall MITRE profile—30 techniques across 13 tactics—is comparable to dozens of _medium_-risk actors in this dataset. The median actor deploys 16 techniques; several low-risk actors also exceed 30. In other words, technique count or tactic type alone could not explain what made GTG-1002 the most high-risk actor we have observed thus far.

我们分析了我们于 [2025 年 11 月报告](https://www.anthropic.com/news/disrupting-AI-espionage)的 AI 赋能网络间谍行动幕后威胁行为者（编号 GTG-1002）的行为。该行为者获得了最高可能风险评分 100 分，成功入侵多个国家的政府和关键基础设施目标，并构建了脚手架将 Claude Code 用作自主操作者而非顾问。然而，其整体 MITRE 画像——13 个战术下的 30 种技术——与本数据集中数十个中风险行为者相当。中位行为者部署 16 种技术；多个低风险行为者也超过 30 种。换言之，单凭技术数量或战术类型，无法解释是什么使 GTG-1002 成为我们迄今观察到的最高风险行为者。

What _does_ explain this actor's high risk score is the increasingly agentic components they used: how they were able to orchestrate and chain together techniques to take action on their objectives. GTG-1002 weaponized Claude Code running on a Kali Linux machine, integrating open-source penetration testing tools as MCP (Model Context Protocol) servers—effectively turning the AI into an autonomous attack platform rather than a code-writing assistant. The AI didn't just suggest commands or generate attack scripts; it executed them and reasoned about attack environments autonomously. Some indications of their 'agentic-ness' show up proxied through the types of techniques we track; GTG-1002 employed operational techniques such as T1021.004 (Remote Services: SSH), T1210 (Exploitation of Remote Services), and T1560 (Archive Collected Data). But the main differentiators were:

真正解释该行为者高风险评分的，是他们所使用的日益代理化的组件：他们如何能够统筹协调并串联技术手段来实现其目标。GTG-1002 将运行于 Kali Linux 机器上的 Claude Code 武器化，将开源渗透测试工具集成为 MCP（模型上下文协议）服务器——实际上将 AI 变成了自主攻击平台而非代码编写助手。AI 不仅提出命令建议或生成攻击脚本，而且自主执行命令并对攻击环境进行推理。其"代理特性"的部分迹象体现在我们追踪的技术类型上：GTG-1002 使用了 T1021.004（远程服务：SSH）、T1210（利用远程服务）和 T1560（归档已收集数据）等操作性技术。但主要差异化因素在于：

*   **Autonomous execution within stages**: GTG-1002 deployed Claude Code running on a Kali machine to orchestrate dozens of MCP tool operations autonomously — scanning and mapping dozens of internet-facing services during reconnaissance, then discovering internal admin portals, databases, logging servers, and temporal workflow systems once inside the network. The AI didn't just suggest commands; it executed them, making tactical decisions about what to probe next without waiting for operator input.｜**阶段内的自主执行：**GTG-1002 部署运行于 Kali 机器上的 Claude Code，自主编排数十次 MCP 工具操作——在侦察阶段扫描和映射数十个面向互联网的服务，进入网络后发现内部管理门户、数据库、日志服务器和时序工作流系统。AI 不仅提出命令建议，而且直接执行命令，在无需等待操作员输入的情况下自主决策下一步探测目标。
*   **Live exploitation and pivoting**: Operating within GTG-1002's scaffolding, the AI exploited an SSRF vulnerability in a public-facing web server to proxy commands into the internal cloud environment, harvested SSH private keys from internal infrastructure and service account tokens from cloud metadata services and AWS Secrets Manager, and used those harvested credentials to move laterally across the victim's cloud environment. These are the operational phases (discovery → credential access → lateral movement) that were more rare in our dataset.｜**实时漏洞利用与横向转移：**在 GTG-1002 的脚手架框架内运行，AI 利用公开 Web 服务器中的 SSRF 漏洞将命令代理进入内部云环境，从内部基础设施收集 SSH 私钥，从云元数据服务和 AWS Secrets Manager 获取服务账号令牌，并利用收集到的凭据在受害者的云环境中横向移动。这些是在我们数据集中较为罕见的操作阶段（发现→凭据访问→横向移动）。
*   **Human intent, AI execution:** GTG-1002 provided strategic direction while the AI handled tactical implementation. The AI operated autonomously during reconnaissance and internal discovery, adapted its approach when it encountered unanticipated infrastructure like container image signing workflows and service account identities, and staged and compressed tens of thousands of proprietary workflow records and internal architecture documentation for exfiltration. The final data extraction — downloading to the attacker's machine via curl MCP tool calls — was human-directed, suggesting the operator retained control over the consequential decisions while delegating the operational work to the AI.｜**人类意图，AI 执行：**GTG-1002 提供战略方向，而 AI 负责战术实施。AI 在侦察和内部发现阶段自主运行，在遇到容器镜像签名工作流和服务账号身份等意料之外的基础设施时调整方法，并将数万条专有工作流记录和内部架构文档进行暂存和压缩以便渗漏。最终的数据提取——通过 curl MCP 工具调用下载到攻击者机器——是由人工指导的，表明操作员保留了对关键决策的控制权，同时将操作工作委托给 AI。

GTG-1002's activity was novel for using an AI agent to autonomously chain together many stages of the cyberattack lifecycle—reconnaissance, exploitation, lateral movement, and exfiltration—into a coherent operation, making real-time decisions about what to do and what data to collect. This is the dimension of AI-enabled uplift that a technique-frequency table cannot capture, and it is the dimension we expect to matter most as agentic tooling matures.

GTG-1002 行动的创新性在于：使用 AI 智能体将网络攻击生命周期的多个阶段——侦察、漏洞利用、横向移动和数据渗漏——自主串联为一个连贯的行动，并实时决策下一步行动和数据收集目标。这是技术频率表无法捕捉的 AI 赋能维度，也是我们预期随着代理工具走向成熟将变得最为重要的维度。

## How we are using the Navigator to inform our safeguards
> 我们如何利用导航器指导防护措施

The findings in this report have shaped how we detect, investigate, and disrupt AI-enabled cyber misuse.

本报告的发现已影响了我们检测、调查和阻断 AI 赋能网络滥用的方式。

First, our risk scores show that the highest-risk actors are not always the loudest or the most prolific—they often appear ordinary in terms of the type and volume of techniques they employ, and instead are distinguished by how they orchestrate their AI to carry out an entire cyber operation. We are updating our detection systems accordingly, expanding our [classifiers and probes](https://www.anthropic.com/research/next-generation-constitutional-classifiers) to catch techniques that correlate with high ARiES scores. We're also developing detection signals for agentic misuse patterns that don't map cleanly to MITRE, such as multistep autonomous execution, AI-directed pivot decisions, and tool-augmented operations through MCP servers and similar interfaces.

首先，我们的风险评分表明，最高风险行为者并不总是最张扬或最多产的——他们在所使用技术的类型和数量上往往表现平常，真正的区别在于他们如何调度 AI 来执行整个网络行动。我们正相应更新检测系统，扩展[分类器和探测器](https://www.anthropic.com/research/next-generation-constitutional-classifiers)的范围，以捕捉与高 ARiES 评分相关的技术。我们还在为无法清晰映射到 MITRE 的代理滥用模式开发检测信号，例如多步骤自主执行、AI 主导的转向决策，以及通过 MCP 服务器和类似接口进行的工具增强操作。

Second, we have rolled out [real-time cyber safeguards](https://support.claude.com/en/articles/14604842-real-time-cyber-safeguards-on-claude) on our most capable models that automatically detect and block prohibited activity (such as ransomware development or mass data exfiltration) at the request level. We are also now routing higher-risk dual-use activities—those that both cyberattackers and defenders may undertake—through our [Cyber Verification Program (CVP)](https://claude.com/form/cyber-use-case), which allows defensive practitioners to continue using our models in their work.

其次，我们已在最强能力的模型上部署了[实时网络安全防护](https://support.claude.com/en/articles/14604842-real-time-cyber-safeguards-on-claude)，在请求层面自动检测和阻断被禁止的活动（如勒索软件开发或大规模数据渗漏）。我们现在还通过[网络验证计划（CVP）](https://claude.com/form/cyber-use-case)路由高风险双重用途活动——即攻击者和防御者都可能从事的活动——以允许防御实践者继续在其工作中使用我们的模型。

Third, through [Project Glasswing](https://www.anthropic.com/glasswing), we are studying the offensive cyber capabilities of our most capable model before making it available to the wider public, so that we understand where AI cyber capabilities are heading before threat actors can make use of them, and can design safeguards before such misuse happens.

第三，通过 [Glasswing 项目](https://www.anthropic.com/glasswing)，我们在向更广泛公众开放之前，对我们最强能力模型的进攻性网络能力进行研究，以便在威胁行为者加以利用之前，了解 AI 网络能力的发展方向，并在此类滥用发生之前设计好防护措施。

Finally, following on from our collaboration with Verizon on the 2026 Data Breach Investigation Report, we are now in active conversations with MITRE about how the ATT&CK framework can evolve to capture the AI-native operational behaviors we observed in this analysis. We also continue to share technical indicators; tactics, techniques, and procedures used by threat actors; and investigative findings with our partners in government and industry on an ongoing basis.

最后，在与 Verizon 合作完成 2026 年数据泄露调查报告之后，我们目前正在与 MITRE 就 ATT&CK 框架如何演进以捕捉本次分析中观察到的 AI 原生操作行为进行积极对话。我们也持续向政府和行业合作伙伴分享技术指标、威胁行为者所使用的战术技术程序以及调查发现。

## A new era for MITRE ATT&CK
> MITRE ATT&CK 的新时代

The most dangerous actors are now using AI to orchestrate attacks rather than simply build tools that enable such attacks, and the framework threat investigators use to track threats has yet to catch up. Traditional frameworks that bank on actors being technically sophisticated will fail when low-skill actors can build, command, and operate expert-level harnesses.

最危险的行为者现在使用 AI 来编排攻击，而非仅仅构建实现攻击的工具，而威胁调查人员用于追踪威胁的框架尚未跟上。当低技能行为者也能构建、指挥和操控专家级工具时，依赖行为者技术复杂度的传统框架将面临失效。

One clear lesson from a year of mapping this activity, as well as our work with Verizon, is that we must expand our shared threat vocabulary. The MITRE ATT&CK captures the individual techniques actors execute, but the behaviors that distinguish the highest-risk actors from others—things like agentic orchestration of an entire killchain, or the autonomous selection of targets—are not yet captured by this taxonomy.

通过一年对该活动的映射，以及与 Verizon 的合作，一个清晰的教训是：我们必须扩展共享威胁词汇表。MITRE ATT&CK 捕捉的是行为者执行的单个技术，但区分最高风险行为者与其他行为者的行为——如对整个攻击链的代理编排，或目标的自主选择——尚未被这一分类体系所捕捉。

We believe the next step is to add new cross-cutting categories to the ATT&CK framework that help threat investigators identify the agentic, autonomous, and decision-making behaviors that chain multiple techniques together. This will give defenders a vocabulary that keeps pace with how adversaries are using AI tools in the wild.

我们认为，下一步是在 ATT&CK 框架中增加新的横切类别，帮助威胁调查人员识别将多种技术串联起来的代理性、自主性和决策性行为。这将为防御者提供一套与对手在真实环境中使用 AI 工具的方式同步更新的词汇体系。

At the same time, it is clear that defenders will need to use AI with the same sophistication and urgency as attackers, share threat intelligence between organizations, and shorten the time from identifying a software vulnerability to patching it. As an industry, we must become much less tolerant of insecure code. The transitional period will be difficult. But, if industry, government, and civil society treat the current moment with the urgency it warrants, we believe capable AI systems will benefit defenders more than attackers in the long run: finding bugs before new code ships, and making the systems societies depend on more secure. The result could be better-defended infrastructure, and a digital environment with materially less fraud and abuse. We will continue to publish what we learn as the threat landscape evolves.

与此同时，防御者显然也需要以与攻击者同等的复杂度和紧迫性使用 AI，在组织间共享威胁情报，并缩短从识别软件漏洞到完成修补的时间。作为一个行业，我们必须对不安全代码变得更加零容忍。过渡期将充满挑战。但是，如果行业、政府和公民社会以当前局面所需的紧迫感来对待这一时刻，我们相信，从长远来看，有能力的 AI 系统将使防御者获益更多：在新代码发布前发现漏洞，使社会所依赖的系统变得更加安全。最终结果可能是防御更为完善的基础设施，以及欺诈和滥用大幅减少的数字环境。随着威胁格局的演变，我们将持续发布我们的研究发现。

#### Footnotes

[1] For the DBIR, we provided analysis of 11 months of threat actor data, and rounded this out to 12 months for this report.

[2] We observe sub-techniques from both the Enterprise and the Mobile technique matrices from MITRE. Enterprise techniques account for 99% of observations.
