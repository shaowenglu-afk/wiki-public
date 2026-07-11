Title: Anthropic Economic Index report: Cadences

URL Source: https://www.anthropic.com/research/economic-index-june-2026-report

Markdown Content:
## **Introduction**
> **引言**

One year ago, most Claude usage took the form of a conversation between a user and an assistant. With the rapid growth of Claude Code and Cowork, Claude sessions now increasingly consist of long-running agentic tasks. Chat transcripts no longer fully capture how people are using AI, and our methods for studying Claude's economic impacts have had to adapt.
一年前，Claude 的大多数使用形式是用户与助手之间的对话。随着 Claude Code 和 Cowork 的快速增长，Claude 会话现在越来越多地由长时间运行的智能体任务构成。对话记录已无法完整捕捉人们使用 AI 的方式，我们研究 Claude 经济影响的方法也不得不随之调整。

To keep pace, we made several changes to our data pipeline for the Economic Index. In this version, we:
为跟上这一变化，我们对经济指数的数据流水线进行了几项调整。在本版本中，我们：

*   Sample data at a higher rate, allowing us to view usage patterns down to the hourly level.｜以更高频率采样数据，使我们能够以小时为粒度观察使用模式。
*   Introduce a new classifier that labels the output of each conversation.｜引入新的分类器，为每次对话的输出添加标签。
*   Share more granular data, breaking out results for chat and Cowork conversations (together, "Claude conversations") and the 1P API, aggregated at a monthly level.1｜共享更细粒度的数据，区分展示聊天与 Cowork 对话（合称"Claude 对话"）和 1P API 的结果，按月汇总。1

We describe additional methodological changes in the [Appendix](https://cdn.sanity.io/files/4zrzovbb/website/03ed1410f74a65ae4cc2a27120d0875e1e569535.pdf). Together, these changes provide a clearer picture of how AI mirrors and diffuses into economic life.
我们在附录中描述了其他方法论变更。这些变化共同提供了 AI 如何映射并渗透到经济生活的更清晰图景。

In addition, we've previously lacked visibility into Claude's impact _outside_ of user sessions. How do people perceive AI to be changing their work, or the opportunities available to them? Does their usage of AI shape their expectations? In an ideal world, what would they want from AI? We report initial findings from the [Anthropic Economic Index Survey](https://www.anthropic.com/research/economic-index-survey-announcement), launched in April 2026.
此外，我们此前对 Claude 在用户会话_之外_的影响缺乏洞察。人们如何看待 AI 正在改变他们的工作或可获得的机会？他们使用 AI 的方式是否塑造了他们的预期？在理想世界中，他们希望从 AI 获得什么？我们报告了于 2026 年 4 月启动的 Anthropic 经济指数调查的初步发现。

We preview our main findings below.
我们在下文预览主要发现。

*   In Chapter 1, we show how the rhythms of the external world shape Claude usage. Work-related queries subside on the weekend, though less dramatically in the most highly paid occupations; people tend to ask for the news in the morning, and sleep advice peaks around 5 a.m.; tax-related requests surge around filing deadlines.｜在第 1 章，我们展示外部世界的节律如何塑造 Claude 的使用模式。与工作相关的查询在周末减少，但在收入最高的职业中减幅不那么明显；人们倾向于在早晨询问新闻，睡眠建议的需求在凌晨 5 点前后达到峰值；与税务相关的请求在报税截止日前后激增。
*   Chapter 2 explores the concrete outputs that people take away from their Claude sessions. These are highly dependent on what product they're using. Chat and Cowork provide more explanations than Claude Code, for example. The nature of the output also shapes people's interactions with Claude. Building a website leaves much more to Claude's judgment than translating a document, where the answer is largely determined by the text. We also see that more compute is associated with more valuable artifacts; the tokens a given output consumes rise with the estimated value of the work.｜第 2 章探讨人们从 Claude 会话中带走的具体产出。这些产出高度依赖于所使用的产品。例如，聊天和 Cowork 提供的解释比 Claude Code 更多。产出的性质也塑造了人们与 Claude 的互动方式。构建网站比翻译文档留给 Claude 更多的判断空间，而翻译的答案很大程度上由原文决定。我们还观察到，更多计算量与更有价值的产物相关联；给定产出所消耗的词元数量随工作的估计价值而上升。
*   Chapter 3 presents the first results from the Anthropic Economic Index Survey, which we link to Claude usage data through our [privacy-preserving system](https://www.anthropic.com/research/clio). Expectations and experiences vary systematically with how people use Claude: people who use Claude in the most automated way expect AI to take on more of their tasks in the next year, yet feel the most optimistic about what that means for their work, anticipating positive impacts on pay, job security, and meaning.｜第 3 章呈现 Anthropic 经济指数调查的首批结果，我们通过隐私保护系统将调查结果与 Claude 使用数据关联起来。预期和体验随人们使用 Claude 的方式而系统性地变化：以最自动化方式使用 Claude 的人预期 AI 在明年承担更多任务，但对这对他们工作意味着什么感到最为乐观，预期薪酬、工作保障和工作意义将获得积极影响。

Our new privacy-preserving telemetry, which continuously samples a slice of conversations every day, allows us to study daily and hourly patterns in usage, in contrast to the seven-day samples each previous Economic Index report drew on. These analyses capture ebbs and flows in work patterns around the world.2
我们的新隐私保护遥测系统每天持续对一部分对话进行采样，使我们能够研究使用模式的每日和每小时规律，而以往每份经济指数报告都依赖七天样本。这些分析捕捉到了全球工作模式的涨落变化。2

We find that Claude usage mirrors the workweek, with personal prompts spiking on the weekend. The hourly data captures within-day patterns—people most often ask for sleep advice around 5 a.m. and for recipes around 6 p.m. We also see usage reflecting key dates. For instance, tax-related requests surged just before the US filing deadline on April 15.
我们发现 Claude 的使用量与工作周呈镜像关系，个人提示在周末激增。每小时数据捕捉到日内规律——人们最常在凌晨 5 点左右寻求睡眠建议，在下午 6 点左右询问食谱。我们还看到使用量反映了关键日期。例如，就在 4 月 15 日美国报税截止日前，与税务相关的请求激增。

### The workweek
> 工作周

The share of chat and Cowork 3 conversations categorized as personal use spikes from around 35% on weekdays to just under 50% on weekends during the sample period (Figure 1.1). Outside the workweek, users' conversations shift from business correspondence, marketing copy, and slide decks to emotional support, medical questions, and investment advice. This shift is biggest for high-income countries.
在采样期间，被归类为个人使用的聊天和 Cowork3 对话比例从工作日的约 35% 激增至周末的接近 50%（图 1.1）。在工作周之外，用户的对话从商务往来、营销文案和幻灯片转向情感支持、医疗问题和投资建议。这一转变在高收入国家最为显著。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F153b647190951536f59f8051f4470c0b6216b2ad-1920x1075.png&w=3840&q=75)

**_Figure 1.1: Personal conversations increase on the weekend_**_Daily share of conversations that are personal use across [Claude.ai](http://claude.ai/), Claude Desktop, Claude Code, and 1P API. Saturday and Sunday are shaded grey._
**图 1.1：个人对话在周末增加** 跨 Claude.ai、Claude Desktop、Claude Code 和 1P API 的每日个人使用对话占比。周六和周日以灰色标注。

A similar pattern is present in Claude Code and the 1P API traffic (i.e., API traffic routed directly through Anthropic), though both have lower baseline rates of personal use.4
类似的模式也出现在 Claude Code 和 1P API 流量中（即直接通过 Anthropic 路由的 API 流量），尽管两者的个人使用基线率均较低。4

Request clusters 5 allow us to go one level deeper and see which specific Claude Code tasks swing most between weekdays and weekends. On weekends, the Claude Code usage clusters that fall the most include backend architecture, API debugging, and data storage. Those that increase the most include AI agent design, quant trading, and gaming.
请求簇5使我们能够深入一个层次，查看哪些具体的 Claude Code 任务在工作日和周末之间波动最大。在周末，降幅最大的 Claude Code 使用簇包括后端架构、API 调试和数据存储；增幅最大的则包括 AI 智能体设计、量化交易和游戏。

Weekends may also create space for people to pursue new ventures. Across countries, conversations related to starting a business are highest on Saturday and Sunday. However, job application activities drop on the weekend along with other work-related tasks.6
周末也可能为人们追求新事业创造空间。跨国来看，与创业相关的对话在周六和周日最为频繁。然而，求职活动与其他工作相关任务一同在周末减少。6

### Daily rhythms
> 日常节律

Hour by hour, Claude usage reflects the rhythms of daily life. Figure 1.2 shows the hourly frequency of different request clusters relative to their overall average in global traffic.7
逐小时来看，Claude 的使用量反映了日常生活的节律。图 1.2 展示了不同请求簇相对于全球流量总体平均值的每小时频率。7

People ask for news at 7 a.m. local time. Business correspondence (e.g., email drafting) traces the arc of the workday, with a slight peak at 10–11 a.m. One of the biggest spikes is recipe requests, which are 2.3 times more frequent at 6 p.m. compared to the average. Media recommendations are most concentrated in the evening, while people seek sleep advice in the few hours just before dawn.
人们在当地时间早上 7 点询问新闻。商务往来（如邮件起草）沿着工作日的弧线变化，在上午 10-11 点略有峰值。最大的峰值之一是食谱请求，下午 6 点的频率是平均水平的 2.3 倍。媒体推荐最集中在晚间，而人们在黎明前的几个小时里寻求睡眠建议。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F193ada7d43425a8e3c234b1b177995692b3bdc21-1920x1474.png&w=3840&q=75)

**_Figure 1.2: Request clusters over the course of the day_**_Normalized hourly share of conversations that fall into different request clusters, restricted to Claude chat and Cowork data._
**图 1.2：一天内的请求簇变化** 归入不同请求簇的对话的标准化每小时占比，仅限 Claude 聊天和 Cowork 数据。

On nights and weekends, when people do turn to Claude for work, the tasks skew toward higher-wage occupations (Figure 1.3). While we can't conclusively identify the jobs of the people making these requests, this could reflect the fact that people in higher-paying occupations—like marketing managers or computer programmers—are more likely to work outside traditional hours. In contrast, tasks related to jobs in the bottom two quartiles—like telemarketing and clerical work—fall to a smaller share of total conversations. This pattern isn't driven exclusively by computer and mathematical tasks: when we removed those occupations from the analysis in a robustness check, higher-quartile tasks still increased on nights and weekends.
在夜间和周末，当人们确实为工作目的使用 Claude 时，任务偏向于较高薪酬的职业（图 1.3）。虽然我们无法最终确定发出这些请求的人的职业，但这可能反映出以下事实：从事高薪职业的人——如营销经理或计算机程序员——更可能在传统工作时间之外工作。相比之下，与薪酬分布中后两个四分位数职业相关的任务——如电话营销和文员工作——在总对话中的占比有所下降。这一模式并非仅由计算机和数学任务驱动：当我们在稳健性检验中将这些职业从分析中移除后，较高四分位数任务在夜间和周末仍然有所增加。

![Image 3](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F67ce15a73fd4e779238026f721591be90fecb526-1920x1033.png&w=3840&q=75)

**_Figure 1.3: Change in share of work-related conversations during nights and weekends, split by occupation wage quartile_**_Each bar shows the percent change in the share of work-related tasks coming from the specified wage quartile on nights and weekends versus weekday working hours. Wage quartiles are calculated using BLS data, weighted by number of transcripts._
**图 1.3：夜间和周末工作相关对话占比的变化，按职业薪酬四分位数分类** 每个柱状图显示夜间和周末相较于工作日工作时间，来自指定薪酬四分位数的工作相关任务占比的百分比变化。薪酬四分位数使用 BLS 数据计算，按记录数量加权。

### Tax day
> 报税日

The sample period for this report covers tax filing deadlines for people in the United States. Figure 1.4 shows a large spike in the share of tax-related conversations around the deadline. On April 14, tax-related clusters were eight times as common as on the average day in May and remained about as high on April 15. On April 16, they dropped sharply.
本报告的采样期涵盖了美国的报税截止日。图 1.4 显示，在截止日前后，税务相关对话的占比出现了大幅峰值。4 月 14 日，税务相关簇的频率是 5 月平均水平的八倍，4 月 15 日维持在大致相同的高位，4 月 16 日则急剧下降。

![Image 4](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F5e3359f7847efc3a72e7650afbdc40251aaa107b-1920x1075.png&w=3840&q=75)

**_Figure 1.4: Tax-related conversations spike just before the US filing deadline_**_Share of conversations related to taxes in the US and the rest of the world._
**图 1.4：税务相关对话在美国报税截止日前激增** 美国及世界其他地区税务相关对话的占比。

## Artifacts
> 产物

In this chapter, we classify each conversation on chat and Cowork (hereafter "Claude conversations")8 by its artifact, which we sort into more than 30 categories. We refer to the primary output Claude produces in a conversation—a document, an explanation, a piece of code, an academic paper, and so on, whether presented in a chat window or as a separate document—as an artifact. The full list of artifacts is in the [Appendix](https://cdn.sanity.io/files/4zrzovbb/website/03ed1410f74a65ae4cc2a27120d0875e1e569535.pdf).
在本章中，我们将聊天和 Cowork（以下称"Claude 对话"）8 中的每次对话按其产物分类，划分为 30 多个类别。我们将 Claude 在对话中产生的主要输出——无论是文档、解释、代码片段、学术论文等，无论是呈现在聊天窗口中还是作为单独文档——称为产物（artifact）。产物的完整列表见附录。

Our classifier identified 93% of Claude conversations as producing an artifact (Figure 2.1).9 The most common artifacts are explanations (17% of conversations), documents and reports (15%), and guidance (11%). Conversational outputs (like explanations or guidance) and written deliverables (like documents or presentations) each account for about a third of conversations; code and technical work (like apps or scripts) for about a sixth.
我们的分类器识别出 93% 的 Claude 对话产生了产物（图 2.1）。9 最常见的产物是解释（占对话的 17%）、文档和报告（15%）以及指导（11%）。对话性输出（如解释或指导）和书面交付物（如文档或演示文稿）各占约三分之一的对话；代码和技术工作（如应用程序或脚本）约占六分之一。

![Image 5](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F453f808bfc9df630e89bb55e79b8194eb6df5a71-1920x1078.png&w=3840&q=75)

**_Figure 2.1: Claude's outputs_**_The share of conversations with a specific output. The figure shows the twelve most common output types in Claude conversations. The 1P API mix is in the Appendix._
**图 2.1：Claude 的产出** 具有特定产出的对话占比。该图显示了 Claude 对话中十二种最常见的产出类型。1P API 的产出组合见附录。

What an output is doesn't tell you what it's for: the same artifact could be a work deliverable or a personal project. We look at that split next.
产出是什么并不能告诉你它的用途：同样的产物既可能是工作交付物，也可能是个人项目。接下来我们审视这种划分。

### What is each artifact used for?
> 每种产物的用途是什么？

Our [January Economic Index](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report) introduced a primitive that classifies each conversation as work, personal, or coursework. Here, we apply that split to the artifacts produced in Claude conversations (Figure 2.2).
我们的 1 月经济指数引入了一种将每次对话分类为工作、个人或课业的基础划分。在此，我们将这种划分应用于 Claude 对话中产生的产物（图 2.2）。

Some categories of artifacts are almost always personal. More than 80% of conversations producing creative writing, guidance, and recipes were classified as personal. Within categories, the personal and work-related uses can look quite different. Personal creative writing, for instance, is dominated by fanfiction, worldbuilding, and poetry; the 13% that is work-related is mostly in the form of short-form video scripts, screenwriting, and speeches. Categories most likely to be work-related include creating marketing content (80%), creating blogs or articles (81%), and writing database queries (82%).
某些类别的产物几乎总是个人性质的。80% 以上产生创意写作、指导和食谱的对话被归类为个人。在各类别内部，个人和工作相关用途可能呈现出截然不同的面貌。例如，个人创意写作以同人小说、世界观构建和诗歌为主；而 13% 的工作相关部分主要以短视频脚本、剧本写作和演讲稿的形式出现。最可能属于工作相关的类别包括创建营销内容（80%）、撰写博客或文章（81%）以及编写数据库查询（82%）。

Many outputs are equally likely to be used for personal and work reasons, including creating plans or strategies (44% work-related, 49% personal) or translation (42% work, 44% personal). For example, the most common types of personal planning artifacts include travel itineraries and workout schedules, while work-related plans most often pertain to entrepreneurial or content strategies.
许多产出被用于个人和工作目的的可能性大致相当，包括制定计划或策略（44% 工作相关，49% 个人）或翻译（42% 工作，44% 个人）。例如，最常见的个人规划产物类型包括旅行行程和锻炼计划，而工作相关的规划最常涉及创业或内容战略。

Finally, artifacts that are characteristic of coursework include creating academic papers and theses, educational materials, and math-related queries, though a non-negligible share of each falls into both work and personal categories.
最后，具有课业特征的产物包括撰写学术论文和学位论文、制作教育材料以及与数学相关的查询，尽管每类中都有相当比例同时归属于工作和个人类别。

![Image 6](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F085c36c60ad5b8a5b4bbdcce707bfc91c2f0b01b-1920x1871.png&w=3840&q=75)

**_Figure 2.2: Share of artifacts by use case_**_Share of conversations with a specific output classified by its purpose into work, personal, and coursework._
**图 2.2：按用途划分的产物占比** 具有特定产出的对话占比，按用途分类为工作、个人和课业。

We can also flip the question. Instead of asking what each output is used for, we can ask what sort of artifacts work, personal, and coursework conversations each tend to produce. Work conversations most often produce documents and reports (20%), followed by explanations (9%), email drafts (7%), and analyses and summaries (6%). Coursework conversations look broadly similar, with documents and reports leading there too (21%), closely followed by explanations (20%), educational materials (11%), and academic papers (6%). In contrast—and unsurprisingly—only 6% of personal conversations produce a document. Instead, the most common results are explanations (25%) and recommendations (22%).
我们也可以反过来问这个问题。与其询问每种产出的用途，不如问工作、个人和课业对话各自倾向于产生哪类产物。工作对话最常产生文档和报告（20%），其次是解释（9%）、邮件草稿（7%）以及分析和摘要（6%）。课业对话的情况大体相似，文档和报告也位居首位（21%），其次是解释（20%）、教育材料（11%）和学术论文（6%）。相比之下——不出所料——只有 6% 的个人对话产生文档，最常见的结果是解释（25%）和推荐（22%）。

### Cost tracks the value of work
> 成本追踪工作价值

Producing these outputs requires compute, and we find that compute tends to scale with the value of the work. We measure each conversation's computational costs in tokens—the amount of text processed and generated, including Claude's internal reasoning—and compare across occupations by mapping each conversation's classified task to the occupation that typically performs it. Throughout this section, we restrict our analysis to work-related conversations.
产生这些产出需要计算资源，我们发现计算量往往随工作价值的增加而增加。我们以词元数量来衡量每次对话的计算成本——包括 Claude 的内部推理在内的已处理和已生成文本量——并通过将每次对话的分类任务映射到通常执行该任务的职业来跨职业进行比较。在本节中，我们将分析限定于工作相关对话。

The left panel of Figure 2.3 shows a positive relationship between the median conversation-level number of tokens and the median wage in mapped occupation.10 For example, marketing managers earn roughly twice as much as editors ($80 vs. $37 per hour) and conversations mapping to their tasks consume approximately 2.5 times as many tokens. Admittedly, the relationship is noisy, and there are notable outliers. Pharmacists, for example, earn nearly three times what statistical assistants do ($68 vs. $24 per hour), yet conversations mapped to pharmacist tasks use only about one twentieth as many tokens.
图 2.3 左图展示了对话层面词元数量中位数与映射职业薪酬中位数之间的正相关关系。10 例如，营销经理的收入大约是编辑的两倍（每小时 80 美元对 37 美元），而映射到其任务的对话消耗的词元数量约为编辑的 2.5 倍。诚然，这种关系存在噪声，也有明显的异常值。例如，药剂师的收入几乎是统计助理的三倍（每小时 68 美元对 24 美元），然而映射到药剂师任务的对话所使用的词元数量却只有后者的约二十分之一。

![Image 7](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F68053cef011a9f0d9aecf4508d7a4d312a65736e-1920x1078.png&w=3840&q=75)

**_Figure 2.3: Conversations in higher-wage occupations consume more tokens_**_Left panel: Relationship between median wage for a given occupation and the typical (geometric mean) number of tokens in conversations classified to one of the tasks belonging to that occupation, normalized by overall mean. Both variables are represented on a logarithmic scale. Right panel: Distribution of tokens used to generate given artifacts. Black line illustrates the median, box represents p25 and p75, whiskers represent p10 and p90. All numbers are normalized by the overall median number of tokens and presented on the logarithmic scale. Data in both panels is restricted to chat and Cowork and restricted to conversations classified as work-related. Token counts are not adjusted for which model served the conversation._
**图 2.3：较高薪酬职业的对话消耗更多词元** 左图：给定职业薪酬中位数与归入该职业任务的对话典型词元数量（几何平均值）之间的关系，按总体平均值归一化。两个变量均以对数刻度表示。右图：用于生成给定产物的词元分布。黑线表示中位数，方框表示 p25 和 p75，须线表示 p10 和 p90。所有数字均按总体词元数量中位数归一化，并以对数刻度呈现。两图中的数据均限于聊天和 Cowork，并限于被归类为工作相关的对话。词元数量未根据服务对话的模型进行调整。

The tokens consumed to generate different types of artifacts tell a similar story. More complicated and valuable outputs tend to consume significantly more tokens than simpler outputs. For example, conversations about building apps use more than three times the tokens of the median conversation. On the other end of the spectrum, a typical explanation uses about a fifth of the tokens of the median conversation. About 44% of the wage gradient in token consumption is explained by output mix—higher wage occupations are more likely to produce compute-intensive artifacts.
用于生成不同类型产物的词元数量呈现出类似的规律。更复杂、更有价值的产出往往比更简单的产出消耗更多词元。例如，关于构建应用程序的对话消耗的词元数量是中位数对话的三倍以上。另一端，典型解释类对话消耗的词元约为中位数对话的五分之一。词元消耗中约 44% 的薪酬梯度差异可由产出组合解释——薪酬较高的职业更可能产生计算密集型产物。

Why does this matter economically? In conversations mapped to higher-wage occupations, Claude produces more (1.34 times as much output per turn), while users engage more (1.53 times as many turns) and enable extended thinking more frequently (34% of conversations versus 31%; Table 2.4). Crucially, these move together: more production from Claude does not mean less from the user. If the human remains involved in the highest-value tasks, the pattern looks more labor-augmenting than labor-displacing. It also shows that, to some extent, more valuable outputs cost more. The next section examines how much of the decision-making within each conversation is delegated to Claude.
这在经济上为何重要？在映射到较高薪酬职业的对话中，Claude 产生更多输出（每轮产出量为中位数的 1.34 倍），用户参与度也更高（轮次为中位数的 1.53 倍），扩展思考的启用频率也更高（34% 的对话对比 31%；表 2.4）。关键在于，这些指标是同向移动的：Claude 产出更多并不意味着用户贡献更少。如果人类持续参与最高价值任务，这种模式看起来更像是劳动力增强而非替代。这也表明，在一定程度上，更有价值的产出成本更高。下一节将考察每次对话中有多少决策权被委托给 Claude。

![Image 8](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F7ef90af0846bf3f0dde99626e59ae8ed27bef05f-1920x630.png&w=3840&q=75)

**_Table 2.4: What accounts for higher token consumption in higher-wage occupations_**_Features of conversations that contribute to higher token consumption in conversations mapped to higher-wage occupations. Occupations were grouped into terciles by their median wage, weighted by the number of conversations matched to each. Compute-related measures were normalized by their bottom-tercile's geometric means. E.g. the first row shows that a typical conversation mapped to a top-tercile occupation consumes 2.07 times as many tokens as a typical conversation mapped to a bottom-tercile occupation._
**表 2.4：较高薪酬职业中较高词元消耗的成因** 映射到较高薪酬职业的对话中，导致词元消耗更高的对话特征。职业按薪酬中位数分为三等分，按匹配到各职业的对话数量加权。计算相关指标按最低三分位数的几何平均值归一化。例如，第一行显示，映射到最高三分位职业的典型对话消耗的词元数量是最低三分位职业的 2.07 倍。

### How much autonomy does Claude have to decide on its own?
> Claude 拥有多少自主决策权？

We measure this on a 1-5 scale, from "none" to "extreme." Tasks that are easy to describe or specify involve little autonomy: the lowest-autonomy outputs are math or calculations, translations, and Q&As. High-autonomy tasks are those that require selection among many possible choices, e.g., creating apps and websites, games, or presentations. Such work, which requires sustained judgment, has historically been difficult to automate. By comparing the level of autonomy in Claude chat and Cowork to Claude Code, we show that this is starting to change.
我们在 1 到 5 的量表上衡量这一点，从"无"到"极高"。易于描述或指定的任务自主性较低：自主性最低的产出是数学或计算、翻译和问答。高自主性任务是那些需要在众多可能选择中进行选择的任务，例如创建应用程序和网站、游戏或演示文稿。这类需要持续判断力的工作历来难以自动化。通过比较 Claude 聊天和 Cowork 与 Claude Code 的自主性水平，我们表明这种情况正在开始改变。

Across almost all types of outputs (26 of 31 outputs shown) the level of AI autonomy is higher on Claude Code than chat or Cowork.11 For example, conversations producing scripts and code snippets involve 0.53 points more autonomy (on average, on the 1-5 scale) when created with Claude Code than conversations producing the same output on chat or Cowork. Across all conversations, the average difference in autonomy is 0.37 points, and it has two main sources.12
在几乎所有类型的产出中（展示的 31 种产出中有 26 种），Claude Code 的 AI 自主性水平高于聊天或 Cowork。11 例如，当使用 Claude Code 创建脚本和代码片段时，相关对话的自主性比在聊天或 Cowork 上产生相同产出的对话高出 0.53 分（在 1-5 量表的平均值上）。在所有对话中，自主性的平均差异为 0.37 分，主要来自两个方面。12

Approximately two thirds of the difference is explained by the same tasks being executed with more delegation on Claude Code. Blog posts and articles illustrate this: the requests and tasks behind them are similar on the two surfaces, but the way people work with Claude differs sharply. The median chat and Cowork conversation producing a blog post or an article involves 13 rounds of back-and-forth, while the median blog-producing Claude Code session contains a single human prompt. The remaining third reflects the different mix of output types across the two surfaces.
约三分之二的差异可以用相同任务在 Claude Code 上以更高委托度执行来解释。博客文章和文章说明了这一点：两个平台背后的请求和任务相似，但人们与 Claude 的合作方式截然不同。在聊天和 Cowork 上产生博客文章或文章的中位数对话涉及 13 轮来回交流，而在 Claude Code 上产生博客的中位数会话只包含一个人类提示。其余三分之一反映了两个平台产出类型组合的不同。

![Image 9](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fa4ee0e5b664bca5f0494c911f8ff77f3c86db6c2-1920x1629.png&w=3840&q=75)

**_Figure 2.5:_ AI autonomy by output type**Average level of AI Autonomy by conversation output and surface. AI Autonomy is rated on a 1-5 scale from "none" to "extreme."
**图 2.5：按产出类型划分的 AI 自主性** 按对话产出和平台划分的 AI 自主性平均水平。AI 自主性在"无"到"极高"的 1-5 量表上评分。

One might suspect this difference simply reflects model choice. Claude Code sessions run on the most capable models far more often (54% are served by Opus, against 10% of chat and Cowork conversations). However, the gap persists when we compare conversations served by the same model. For example, among conversations using Sonnet, Claude Code sessions still show 0.26 points more autonomy, suggesting that the product used is likely more important than the underlying model.
有人可能会认为这种差异只是反映了模型选择。Claude Code 会话使用最强大模型的频率远高于聊天和 Cowork（54% 由 Opus 提供服务，而聊天和 Cowork 对话仅占 10%）。然而，当我们比较由相同模型服务的对话时，差距仍然存在。例如，在使用 Sonnet 的对话中，Claude Code 会话的自主性仍然高出 0.26 分，这表明所使用的产品可能比底层模型更为重要。

Stepping back from the surface comparison, the output types where users delegate the most are the same ones that consume the most compute: across artifacts, mean autonomy and median token use rise together (r = 0.68 on chat and Cowork; [Appendix](https://cdn.sanity.io/files/4zrzovbb/website/03ed1410f74a65ae4cc2a27120d0875e1e569535.pdf) Figure A.2).
从平台比较中退一步来看，用户委托最多的产出类型恰好也是消耗计算资源最多的类型：在各产物中，平均自主性和词元使用中位数一同上升（聊天和 Cowork 上 r = 0.68；附录图 A.2）。

### Claude answers above the level it was asked
> Claude 的回答水平高于被问的水平

For each conversation, a classifier estimates two reading levels—one for the user's prompt, one for Claude's response—expressed as the years of education needed to understand the text.13 We find that reading level varies widely depending on artifact type. An average query resulting in an academic paper would require more than 16 years of education, roughly equivalent to bachelor's level, and 15% of these conversations are at PhD level or above (20 or more years of education). On the other end of the spectrum are conversations resulting in recipes or guidance, where fewer than 10 years of education are required to understand the prompt.
对于每次对话，分类器会估算两个阅读水平——一个用于用户提示，一个用于 Claude 的回应——以理解文本所需的受教育年限来表示。13 我们发现，阅读水平因产物类型而存在显著差异。产生学术论文的平均查询需要超过 16 年的教育背景，大致相当于本科水平，且 15% 的此类对话处于博士水平或以上（20 年或更长的受教育年限）。另一端是产生食谱或指导的对话，理解提示所需的受教育年限不足 10 年。

In general, artifact types with higher-reading-level outputs also have higher-reading-level prompts (a correlation of 0.87 across conversations). However, we also observe that in almost every category, Claude's output is at a higher comprehension level than the prompt, by roughly one year of education on average. The gap is widest where users describe something to be built, such as image and graphics (+2.6 years), games (+1.9), and apps and websites (+1.7). Some of the gap may simply be register; prompts are often terse and informal, while Claude tends to reply in polished prose. However, the gap is near zero for audience-facing writing (blogs −0.1, academic papers +0.0, email +0.3), possibly because prompts typically draft language or source material written in the same register as the intended output.
总体而言，具有较高阅读水平产出的产物类型，其提示的阅读水平也较高（对话间相关性为 0.87）。然而，我们也观察到，在几乎每个类别中，Claude 的产出理解水平都高于提示，平均约高出一年的教育水平。差距最大的是用户描述要构建的内容时，例如图像和图形（+2.6 年）、游戏（+1.9 年）以及应用程序和网站（+1.7 年）。部分差距可能只是语体差异——提示通常简洁非正式，而 Claude 倾向于用精炼的散文回复。然而，对于面向受众的写作（博客 −0.1，学术论文 +0.0，邮件 +0.3），差距接近于零，这可能是因为提示通常起草与预期产出语体相同的语言或素材。

![Image 10](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F2dae1cc3e0cce051493bbd9dc4a64c6017aaef44-1920x1674.png&w=3840&q=75)

**_Figure 2.6: Reading level of user prompts and Claude's responses, by artifact_**Estimated number of years of education needed to understand the user's prompt and Claude's response. Restricted to chat and Cowork.
**图 2.6：按产物划分的用户提示和 Claude 回应的阅读水平** 理解用户提示和 Claude 回应所需的估计受教育年限。仅限聊天和 Cowork。

## **Perceptions**
> **感知**

The first two chapters show how people use Claude, but don't give much insight into the ways people experience AI at work—how they expect their jobs and workplaces to change, how they feel about AI's current and potential impact, and what they hope for from the technology. Our [interviews with 81,000 Claude users](https://www.anthropic.com/features/81k-interviews), conducted in December 2025 with [Anthropic Interviewer](https://www.anthropic.com/research/anthropic-interviewer), [gave a picture](https://www.anthropic.com/research/81k-economics): respondents reported large productivity gains, but also expressed worry about displacement. Those worries were concentrated among early-career workers and occupations where we observe Claude doing the most work.14
前两章展示了人们如何使用 Claude，但对人们在工作中体验 AI 的方式——他们预期工作和职场将如何改变、他们对 AI 当前和潜在影响的感受，以及他们对这项技术的期望——并未提供太多洞察。我们于 2025 年 12 月通过 Anthropic 访谈员对 81,000 名 Claude 用户进行的访谈描绘了一幅图景：受访者报告了巨大的生产力提升，但也表达了对被取代的担忧。这些担忧主要集中在职业早期的工作者和我们观察到 Claude 工作量最多的职业中。14

In April 2026, we launched the [Anthropic Economic Index Survey](https://www.anthropic.com/research/economic-index-survey-announcement) to build on this work. The survey allows us to ask people directly about their experience with AI and work, and to explore how responses vary with Claude usage. We link survey responses to usage data from mid-May to early June using [privacy-preserving methods](https://www.anthropic.com/research/clio). To characterize each respondent's usage patterns, we randomly sample up to 20 sessions per person within this time window (across Claude.ai, Cowork, and Claude Code, so that the mix of sessions reflects each person's typical usage across surfaces). We exclude respondents with fewer than five sessions to reduce sampling noise. Our final linked sample consists of about 9,700 survey respondents.
2026 年 4 月，我们启动了 Anthropic 经济指数调查，在此基础上继续推进这项工作。该调查允许我们直接询问人们关于 AI 和工作的体验，并探索回应如何随 Claude 使用情况而变化。我们使用隐私保护方法将调查回应与 5 月中旬至 6 月初的使用数据关联起来。为了描述每位受访者的使用模式，我们在此时间窗口内为每人随机抽取最多 20 个会话（跨 Claude.ai、Cowork 和 Claude Code，以使会话组合反映每个人跨平台的典型使用情况）。我们排除少于五个会话的受访者以减少采样噪声。我们最终的关联样本由约 9,700 名调查受访者组成。

We find that most respondents expect significant AI progress over the next year. While people's perception of AI capabilities depends on their experience, where they live, and how exposed their job is to AI, their expectations about the pace of future progress are strikingly uniform, consistent with a "[rising tide](https://arxiv.org/abs/2604.01363)," in which AI capabilities improve broadly.
我们发现，大多数受访者预期 AI 在未来一年将取得重大进展。虽然人们对 AI 能力的感知取决于他们的经验、居住地以及工作受 AI 影响的程度，但他们对未来进展速度的预期却惊人地一致，与"涨潮"一说相符——AI 能力在广泛层面持续提升。

Views on what that progress means for their own careers are less uniform. Early-career workers report that AI can do the highest share of their work and express the most concern about job loss. Yet—contrary to a common concern—the people who delegate to Claude the most are the _most_ optimistic about their future labor market outcomes, and feel their skills are growing in value. And despite (or perhaps because of) their proximity to AI's frontier, the average respondent's hopes for the next decade center not on replacement but on collaboration. They hope AI can preserve meaningful work and automate the drudgery, and that its gains will be shared widely.
关于这一进展对他们自身职业生涯意味着什么，各方看法则不那么一致。职业早期的工作者报告 AI 能够完成他们最高比例的工作，并对失业表达了最大的担忧。然而——与常见的担忧相反——委托给 Claude 最多任务的人对其未来劳动力市场结果_最为_乐观，并感到自己的技能正在增值。尽管（或者也许正是因为）他们与 AI 前沿的距离如此接近，普通受访者对未来十年的期望并非聚焦于被替代，而是着眼于合作。他们希望 AI 能够保留有意义的工作并将繁琐的部分自动化，且其收益能够广泛共享。

### **Who responded to the Economic Index Survey**
> **谁参与了经济指数调查**

The Economic Index Survey is not representative of the general population. We reach a random sample of Claude users, there may be selection in who completes the survey, and we filter out infrequent users from our analysis. Figure 3.1 shows the occupational mix of survey respondents (orange) alongside US employment (grey). Computer and Mathematical occupations are the most heavily over-represented, making up roughly 30% of survey respondents—comparable to their share of Claude usage, but far above their 4% share of US employment. Management, at 23% of respondents,15 is also heavily over-represented relative to its 7% employment share, even though it accounts for only 4% of sessions. This gap is consistent with managers using Claude for tasks other than management itself: in the survey, judgment and management are named by many respondents (especially those with more experience) as capabilities AI lacks. Physical occupation categories like Transportation & Material Moving, Food Preparation & Serving Related, and Construction & Extraction are all under-represented in the survey, as they are in Claude sessions as well.
经济指数调查并不代表普通大众。我们覆盖的是 Claude 用户的随机样本，问卷完成者可能存在选择偏差，我们也从分析中过滤掉了不常使用的用户。图 3.1 展示了调查受访者的职业组合（橙色）与美国就业情况（灰色）的对比。计算机和数学职业的过度代表性最为突出，约占调查受访者的 30%——与其在 Claude 使用中的占比相当，但远高于其在美国就业中 4% 的份额。管理职业占受访者的 23%，15 相对于其 7% 的就业占比也严重过度代表，尽管它在会话中只占 4%。这种差距与管理者使用 Claude 完成非管理任务的情况一致：在调查中，许多受访者（尤其是经验更丰富者）将判断力和管理能力列为 AI 所缺乏的能力。交通运输和物流、食品准备和服务相关以及建筑和提取等实体职业类别在调查中代表性不足，在 Claude 会话中亦是如此。

![Image 11](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F619991c961c29bd3de210669be404fa4ff9643fd-1920x1650.png&w=3840&q=75)

**Figure 3.1: _Survey respondents skew heavily toward computer & mathematical and management occupations relative to US employment_**_Share of survey respondents reporting their occupation in each of the 22 major SOC groups,16 compared to each occupation's share of US employment from OEWS._
**图 3.1：调查受访者相对于美国就业情况严重偏向计算机和数学及管理职业** 在 22 个主要 SOC 职业群体中报告其职业的调查受访者占比，16 与来自 OEWS 的各职业美国就业占比对比。

### **AI and work tasks**
> **AI 与工作任务**

Research on AI impacts often focuses on occupational exposure, or what share of tasks within a given job are doable with AI. In [prior work](https://www.anthropic.com/research/labor-market-impacts), we constructed a measure of _observed exposure_, which captures the share of occupational tasks we already see being done with Claude. We compared it to a commonly used measure of [_theoretical exposure_](https://arxiv.org/abs/2303.10130), or the share of occupational tasks that a large language model could theoretically do.
关于 AI 影响的研究通常聚焦于职业暴露，即给定工作中有多大比例的任务可以借助 AI 完成。在此前的工作中，我们构建了一个_观测暴露（observed exposure）_指标，用于捕捉我们已观察到使用 Claude 完成的职业任务占比。我们将其与一个常用的_理论暴露（theoretical exposure）_指标进行比较，后者衡量的是大型语言模型理论上可以完成的职业任务占比。

Another way to understand occupational exposure is to simply ask people how much of their job AI is capable of doing. We asked respondents what share of their work tasks AI could do entirely on its own today (hereafter _reported exposure_), and what share they expect it to handle in 12 months (_anticipated exposure_), with the option to select from five bands ranging between "almost none" and "nearly all." Close to 6 in 10 respondents chose a higher band for next year than for today. Over a third expect AI to be able to do most or nearly all of their work tasks next year (Figure 3.2).
理解职业暴露的另一种方式是直接询问人们 AI 能够完成他们工作的多少。我们询问受访者，AI 目前可以完全独立完成他们多大比例的工作任务（以下称_报告暴露_），以及他们预期 AI 在 12 个月内将处理多大比例（_预期暴露_），可从"几乎没有"到"几乎全部"五个区间中选择。近十分之六的受访者为明年选择了比今天更高的区间。超过三分之一的人预计 AI 明年将能够完成他们大部分或几乎全部的工作任务（图 3.2）。

![Image 12](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F4fd57aa144cbd1bbbdb616813ef375700db19959-1920x1047.png&w=3840&q=75)

**Figure 3.2: _Most respondents expect the share of their work tasks AI can do to grow over the next 12 months_**_This figure shows the distribution of the share of their work tasks respondents say AI could do today versus in 12 months._
**图 3.2：大多数受访者预期 AI 能够完成的工作任务占比将在未来 12 个月增长** 该图显示了受访者表示 AI 今天与 12 个月后能够完成的工作任务比例的分布。

Figure 3.3 compares reported and anticipated exposure to observed and theoretical exposure. We ask whether what people report and anticipate AI can do lines up with the observed and theoretical exposure measures across occupations, and whether respondents whose occupations score higher on observed or theoretical exposure expect faster progress over the next year. On the first question, the answer is yes: reported exposure (grey dots) is positively correlated with both observed and theoretical exposure. On the second, the answer is no: the best-fit lines for reported and anticipated exposure 12 months from now (orange dots) are essentially parallel, meaning that people in roles with high observed or theoretical exposure expect roughly the same _increase_ in the share of their work tasks AI can do over the next year as those in roles with less observed and theoretical exposure.17 In other words, a software engineer and a construction manager anticipate roughly the same increment of progress within their profession.
图 3.3 将报告暴露和预期暴露与观测暴露和理论暴露进行比较。我们询问人们报告和预期 AI 能够完成的内容是否与跨职业的观测和理论暴露指标相符，以及职业在观测或理论暴露上得分较高的受访者是否预期明年的进展更快。对于第一个问题，答案是肯定的：报告暴露（灰点）与观测暴露和理论暴露均呈正相关。对于第二个问题，答案是否定的：12 个月后的报告暴露和预期暴露的最佳拟合线（橙点）基本平行，这意味着在观测或理论暴露较高职业中的人预期 AI 在未来一年中能够完成的工作任务占比的_增加幅度_，与在观测和理论暴露较低职业中的人大致相同。17 换言之，一位软件工程师和一位建筑经理在各自职业中预期大致相同的进展增量。

It is also worth noting that reported exposure systematically exceeds observed exposure. One explanation for this is that not everybody does every task in an occupation, and our survey disproportionately reaches those who use AI more.18 Analogously, since theoretical exposure is an upper bound on what is possible instead of a measure of current use, theoretical exposure systematically overstates reported exposure.
还值得注意的是，报告暴露系统性地超过观测暴露。一种解释是，并非每个人都完成一个职业中的每项任务，而我们的调查不成比例地覆盖了更多使用 AI 的人。18 类似地，由于理论暴露是可能性的上限而非当前使用的衡量，理论暴露系统性地高于报告暴露。

![Image 13](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F6db7ce24c86fc1ff15b8aeac9708f4b65b9f0331-1920x993.png&w=3840&q=75)

**Figure 3.3: _Reported and anticipated exposure vs other measures_**_The share of tasks people say AI could do today (reported exposure, in grey) and in 12 months (anticipated exposure, in orange) plotted against observed exposure (left panel) and theoretical exposure (right panel). Each point is an occupation, with occupations containing small samples grouped with exposure neighbors to ensure privacy. Reported and anticipated exposure are computed as the midpoint of the bin selected by the survey respondent._
**图 3.3：报告暴露和预期暴露与其他指标的对比** 人们表示 AI 今天（报告暴露，灰色）和 12 个月后（预期暴露，橙色）能够完成的任务比例，与观测暴露（左图）和理论暴露（右图）的对比。每个点代表一个职业，样本量较小的职业与邻近暴露水平的职业合并，以保护隐私。报告暴露和预期暴露以调查受访者选择的区间中点计算。

We also examine how perceptions of AI's current and future capabilities relate to the characteristics and usage patterns of respondents. The left panel of Figure 3.4 shows that perceptions of AI's capabilities are negatively correlated with country GDP:19 the average share of tasks people report AI can do for them now is about 10 percentage points lower among high-income countries. This pattern is consistent with the possibility that AI substitutes for a larger share of the tasks that workers in lower-income countries do day-to-day, even if occupation-level exposure metrics—which tend to be higher in advanced economies—suggest otherwise. Indeed, [the IMF has noted](https://www.imf.org/-/media/files/publications/sdn/2024/english/sdnea2024001.pdf) that while advanced economies face broader AI exposure overall, workers in lower-income countries may have less access to the complementary skills and infrastructure that allow AI to augment rather than replace their work. In [earlier work](https://www-cdn.anthropic.com/7b76335c444876a93fa22a63aabb4aeb820aff25.pdf) we documented that lower-income economies tend to use Claude in more automated ways even when adjusting for differences in task mix.
我们还研究了对 AI 当前和未来能力的感知与受访者特征和使用模式之间的关系。图 3.4 左图显示，对 AI 能力的感知与国家 GDP 负相关：19 在高收入国家，人们报告 AI 现在能够为他们完成的任务平均比例约低 10 个百分点。这一模式与以下可能性一致：AI 替代了低收入国家工作者日常任务中更大比例的工作，即使职业层面的暴露指标——在发达经济体中往往更高——另有所示。事实上，国际货币基金组织指出，虽然发达经济体总体上面临更广泛的 AI 暴露，但低收入国家的工作者可能获得互补技能和基础设施的渠道更少，而这些渠道使 AI 能够增强而非替代他们的工作。在早期工作中，我们记录了低收入经济体即使在调整任务组合差异后，也倾向于以更自动化的方式使用 Claude。

The middle panel shows that reported and anticipated exposure are also negatively correlated with years of work experience.20 People with at least 15 years of experience put that share of tasks AI can do roughly 10 percentage points lower than those in their first year of work. We find evidence that this may be because experienced workers have accumulated tacit or context-specific expertise that is difficult for an AI to mimic. In follow-up questions, we asked people what tasks they thought AI would never be able to do and why; the most common responses emphasized that AI lacks the judgment, contextual awareness, and situational reasoning that their work requires. Respondents, and disproportionately those with at least 15 years of experience, also pointed to the relational and interpersonal dimensions of their jobs—building trust and managing people—as things AI cannot replicate.
中图显示，报告暴露和预期暴露也与工作年限负相关。20 至少拥有 15 年工作经验的人将 AI 能够完成的任务比例估计得比第一年工作者约低 10 个百分点。我们发现证据表明，这可能是因为经验丰富的工作者积累了 AI 难以模仿的隐性或情境特定专业知识。在后续问题中，我们询问人们认为 AI 永远无法完成哪些任务以及原因；最常见的回答强调 AI 缺乏他们工作所需的判断力、情境意识和情景推理能力。受访者，尤其是拥有至少 15 年经验者，还将工作的关系和人际维度——建立信任和管理人员——列为 AI 无法复制的事项。

As with occupational exposure to AI, we find that perceptions about future improvements in AI capabilities are essentially uncorrelated with GDP per capita and years of experience. The expected share of tasks that AI will be able to do in 12 months is uniformly higher than perceptions about AI's capabilities today.
与对 AI 的职业暴露一样，我们发现关于 AI 能力未来改进的看法与人均 GDP 和工作年限基本不相关。AI 在 12 个月内将能够完成的预期任务占比，一致性地高于对 AI 当前能力的感知。

![Image 14](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F00dc4f9324712e6907c68c76e981ae4ac2901bb0-1920x933.png&w=3840&q=75)

**Figure 3.4: _Reported and anticipated exposure are lower in higher-GDP countries and among more experienced workers, and rise with automated Claude use_**_Reported and anticipated (12 month) exposure against country GDP per working-age adult (left), years of experience (middle), and the share of Claude sessions classified as automated (right)._
**图 3.4：报告暴露和预期暴露在 GDP 较高国家和经验更丰富的工作者中较低，并随 Claude 自动化使用的增加而上升** 报告暴露和预期暴露（12 个月）与国家劳动年龄人口人均 GDP（左）、工作年限（中）以及被归类为自动化的 Claude 会话占比（右）的对比。

We next examine the relationship between how people interact with Claude and their current perceptions of Claude's capabilities. As with past reports, we distinguish between "automation" and "augmentation" modes of collaborating with Claude. We identify conversations as automated when Claude is asked to complete a task with little to no input from the user. Concretely, automation share is the share of conversations whose pattern is either directive ("translate this document") or a feedback loop ("edit this email…make it more casual").21
接下来，我们研究人们与 Claude 交互方式和他们对 Claude 能力当前感知之间的关系。与过去的报告一样，我们区分了与 Claude 合作的"自动化"和"增强"模式。当 Claude 被要求在几乎没有用户输入的情况下完成任务时，我们将对话识别为自动化。具体而言，自动化占比是对话模式为指令式（"翻译这份文件"）或反馈循环式（"编辑这封邮件……让它更随意"）的对话占比。21

The right panel of Figure 3.4 shows that reported and anticipated exposure rise with automation share. This could be because delegation is informative about capabilities—people who hand over entire tasks observe directly what AI can complete on its own—or because people who already believe AI can do their work are the most willing to hand it over. The same patterns hold when we replace automation share with the share of sessions devoted to work tasks, or the share conducted in Claude Code.22
图 3.4 右图显示，报告暴露和预期暴露随自动化占比的上升而上升。这可能是因为委托本身能够揭示能力信息——将整项任务交出的人可以直接观察 AI 能够独立完成什么——也可能是因为已经相信 AI 能够完成他们工作的人最愿意将任务交出。当我们用工作任务会话占比或在 Claude Code 中进行的会话占比替换自动化占比时，同样的模式成立。22

### **AI and jobs**
> **AI 与工作**

We also ask how people think their jobs will change in the next 12 months. More than a third of respondents said it was likely or very likely that responsibilities would significantly change (for themselves, a peer, a junior colleague, and a senior colleague). 10% rated losing their own jobs as likely or very likely. This is slightly below the annualized hazard rate of losing a job in the US;23 however, since our respondents skew toward knowledge workers in stable employment (a group that plausibly faces below-average separation risk at baseline), this may still indicate elevated perceived risk. When asked an open-ended question about what was driving their forecasts, 38% of the respondents who rated their job loss as likely or very likely attributed their forecasts to AI.24 Notably, respondents were on average more worried about job loss for others than for themselves.25 Respondents were especially worried about job loss for their junior colleagues, with over one third stating that the probability of a junior colleague losing their job in the next year was over 60%. Respondents were also more concerned about job loss (for everyone) in lower-income countries.
我们还询问人们认为自己的工作在未来 12 个月将如何改变。超过三分之一的受访者表示职责有可能或非常有可能发生重大变化（针对他们自己、同事、初级同事和高级同事）。10% 的人将失去自己的工作评定为可能或非常可能。这略低于美国失业的年化风险率；23 然而，由于我们的受访者偏向稳定就业的知识工作者（这一群体在基准情形下面临低于平均水平的离职风险），这可能仍表明感知风险有所上升。当被问及是什么驱动了他们的预测时，38% 将失业评定为可能或非常可能的受访者将其预测归因于 AI。24 值得注意的是，受访者平均对他人失业的担忧大于对自己的担忧。25 受访者尤其担心初级同事的失业，超过三分之一的人表示初级同事在明年失业的概率超过 60%。受访者对低收入国家（所有人的）失业也更为担忧。

![Image 15](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fe750c70fb2b3f621fc2e8977bfd468364dd91dce-1920x1078.png&w=3840&q=75)

**Figure 3.5: _Share of people reporting it is likely or very likely job responsibilities will change significantly or people will involuntarily lose a job next year_**_Share of respondents that reported it was likely job responsibilities would change (left panel) or an individual would lose a job they wanted to keep (right panel) for themselves, a peer, a junior colleague, or a senior colleague._
**图 3.5：报告职责有可能或非常有可能发生重大变化或人们将在明年非自愿失业的受访者比例** 报告职责可能发生变化（左图）或个人可能失去其希望保留的工作（右图）的受访者比例，分别针对他们自己、同事、初级同事或高级同事。

Are people who use Claude in more automated ways also more worried about losing work? We examine what people said about AI's expected impact over the next year on six dimensions of work: pay, job security, ability to find a new job (economic dimensions) and meaning, autonomy, and human interaction (intrinsic dimensions); and look at how these expectations differ by the automation share of Claude usage.
以更自动化方式使用 Claude 的人是否也更担心失去工作？我们研究了人们对 AI 在未来一年对六个工作维度的预期影响所说的话：薪酬、工作保障、找到新工作的能力（经济维度）以及意义、自主性和人际互动（内在维度）；并研究这些预期如何随 Claude 使用的自动化占比而变化。

Across all six dimensions, people with a higher share of automated sessions feel _more optimistic_ about the effect of AI on their job outcomes next year compared to those who use Claude more augmentatively. We saw the largest effects on expectations about positive impacts on future pay and ability to find a job.26
在所有六个维度上，与更多以增强方式使用 Claude 的人相比，自动化会话占比更高的人对 AI 对其明年工作结果的影响感到_更加乐观_。我们在对未来薪酬和找工作能力的积极影响预期上看到了最大的效应。26

![Image 16](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F7cddf6cfaa30bf44395459f948b52233853a5dfe-1920x1030.png&w=3840&q=75)

**Figure 3.6: _The share of people reporting positive expected impacts of AI on economic and intrinsic dimensions of job quality is higher among more automated Claude users_**_This figure shows coefficient estimates from linear regressions of an indicator for whether a person expected AI to have a positive effect on each of the six dimensions of job quality onto normalized AI automation share._
**图 3.6：报告 AI 对工作质量经济和内在维度有积极预期影响的人比例在更多自动化 Claude 用户中更高** 该图显示了线性回归的系数估计，因变量为个人是否预期 AI 对六个工作质量维度各自产生积极影响的指标，自变量为归一化的 AI 自动化占比。

A natural question is why automated usage and sentiment move together. It's possible that this relationship is explained by selection, that the people most enthusiastic about AI are also the most willing to hand over entire tasks to it. We can't rule this out entirely, but these estimates don't meaningfully change when we control for user tenure on [Claude.ai](http://claude.ai/redirect/website.v1.281285a0-a972-493f-852d-b0c09b78ff5b)—which we can think of as a proxy for enthusiasm, because it captures early versus later adopters.
一个自然的问题是，为什么自动化使用和情绪会同向移动。这种关系可能由选择效应解释——对 AI 最热情的人也最愿意将整个任务交给它。我们无法完全排除这一点，但当我们控制用户在 Claude.ai 上的使用时长时（我们可以将其视为热情程度的代理，因为它捕捉了早期与后期采用者的区别），这些估计没有有意义的变化。

Another possibility is that people who use AI in more automated ways experience more of its benefits today. Consistent with our [previous findings](https://www.anthropic.com/research/81k-economics), large majorities of people report productivity gains in speed, scope, and quality of their work (86%, 82%, and 69%, respectively), while 27% report gains through cost savings on services they would otherwise have to purchase.
另一种可能是，以更自动化方式使用 AI 的人今天体验到了更多其带来的好处。与我们之前的发现一致，绝大多数人报告了工作速度、范围和质量方面的生产力提升（分别为 86%、82% 和 69%），而 27% 的人通过节省原本需要购买的服务费用实现了收益。

In addition to significant productivity gains, the majority of people also report learning more with AI (68%) and feeling like AI has made their skills more valuable (57%). Figure 3.7 shows how these two outcomes vary with the share of automated sessions. We see that the share of people reporting that AI is increasing the market value of their skills rises with automation share, while the share reporting they learn more is roughly flat.
除了显著的生产力提升外，大多数人还报告说使用 AI 学到了更多（68%），感觉 AI 使他们的技能更有价值（57%）。图 3.7 显示了这两个结果如何随自动化会话占比的变化而变化。我们看到，报告 AI 正在提升其技能市场价值的人比例随自动化占比的上升而上升，而报告学到更多的人比例则大体持平。

A commonly voiced concern about delegation is that handing entire tasks to AI means offloading thinking, with gains in output coming at the cost of learning and skill atrophy. We do not see this pattern here: heavier delegators report learning at the same rate as everyone else. However, these are self-assessments, and skills can erode even as they become more valuable and as someone reports learning more, so the data do not rule out skill erosion.
关于委托的一个常见担忧是，将整个任务交给 AI 意味着将思考卸载出去，产出的提升是以学习和技能萎缩为代价的。我们在这里没有看到这种模式：较多委托者的学习频率与其他所有人相同。然而，这些都是自我评估，即使技能变得更有价值且有人报告学到了更多，技能也可能在侵蚀，因此数据并不排除技能侵蚀的可能性。

![Image 17](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F52f245620d7ccbf052b85c6443cf4f52c1cfd220-1920x1075.png&w=3840&q=75)

**Figure 3.7: _The share of people reporting positive expected returns to their skills is increasing in automation share, while the share reporting they're learning more is flat_**_This figure shows the relationship between automation share of tasks and the share of people reporting AI increases the market value of their skills (blue) and they learn more when using AI (orange)._
**图 3.7：报告技能预期积极回报的人比例随自动化占比的上升而上升，而报告学到更多的人比例持平** 该图显示了任务自动化占比与报告 AI 提升技能市场价值的人比例（蓝色）以及使用 AI 时学到更多的人比例（橙色）之间的关系。

### **How usage differs between genders**
> **性别间的使用差异**

So far we have explored how usage patterns relate to expectations and behavior. Next, we study _who_ uses Claude in various ways. The most striking differences are by gender. Women, who make up only 12% of our linked respondent sample, use Claude differently from men. Even after accounting for occupational differences, they are marginally less likely to use Claude for work, their share of sessions in Claude Code is 0.24 standard deviations lower (6.3 percentage points), and their automation share is 0.33 standard deviations lower (7.3 percentage points). Instead, women tend to use Claude more iteratively, and they log more active time on chat than men, a signal of more collaborative engagement.27
到目前为止，我们已经探索了使用模式如何与预期和行为相关。接下来，我们研究_谁_以各种方式使用 Claude。最显著的差异按性别划分。仅占我们关联受访者样本 12% 的女性使用 Claude 的方式与男性不同。即使在控制职业差异后，她们使用 Claude 处理工作的可能性略低，在 Claude Code 中的会话占比低 0.24 个标准差（6.3 个百分点），自动化占比低 0.33 个标准差（7.3 个百分点）。相反，女性倾向于更迭代地使用 Claude，在聊天上记录的活跃时间多于男性，这是更多协作参与的信号。27

![Image 18](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F9d210f0da6b48a8ea09124f13b9ecbe5d32567dd-1920x1007.png&w=3840&q=75)

**Figure 3.8: _Women have distinctly different usage patterns, even after conditioning on occupational differences_**_This figure shows women's usage patterns compared to men's. Each bar is the difference between women's and men's average on that usage measure, controlling for occupation (SOC minor groups), expressed in standard deviations of the outcome. Whiskers show 95% confidence intervals. The sample is restricted to respondents identifying as women or men. Women have significantly lower Claude Code and automation shares, while having higher total active minutes._
**图 3.8：即使在控制职业差异后，女性的使用模式仍明显不同** 该图显示了女性与男性的使用模式对比。每个柱状图是女性和男性在该使用指标上的平均值差异，控制职业（SOC 小分类），以结果的标准差表示。须线显示 95% 置信区间。样本限于自认为是女性或男性的受访者。女性的 Claude Code 和自动化占比显著较低，而总活跃分钟数较高。

### **What do people hope for from an AI-transformed economy?**
> **人们希望从 AI 转型经济中获得什么？**

The Anthropic Economic Index Survey surfaces a mix of positive and negative experiences and sentiments with respect to AI, but we end the survey on a hopeful note. The final open-ended question asks respondents to "dream big: what do you hope an economy shaped by AI looks like in ten years?" We ran each survey response through a classifier which tagged responses with relevant themes. We show the top five most commonly cited themes below. Additional descriptions of each can be found in the [Appendix.](https://cdn.sanity.io/files/4zrzovbb/website/03ed1410f74a65ae4cc2a27120d0875e1e569535.pdf)
Anthropic 经济指数调查呈现了对 AI 的正面和负面体验与情绪的混合，但我们以充满希望的笔调结束调查。最后一道开放式问题请受访者"放开畅想：你希望十年后由 AI 塑造的经济是什么样的？"我们通过分类器对每个调查回应进行处理，为回应标注相关主题。我们在下文展示最常被提及的五个主题。每个主题的其他描述可在附录中找到。

![Image 19](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fb678b24653b9fde7bc5eb453755cc417f87a9ab0-1920x1048.png&w=3840&q=75)

**Figure 3.9: _People hope for human-AI collaboration, automation of drudgery and more free time, and that economic gains from AI are broadly shared_**_This figure shows the five most common themes from people's responses to an open-ended question on what they hope an AI-transformed economy looks like in 10 years._
**图 3.9：人们希望实现人机协作、繁琐工作的自动化和更多空闲时间，以及 AI 带来的经济收益广泛共享** 该图显示了人们对"希望 AI 转型经济在 10 年后是什么样的"这一开放式问题回应中最常见的五个主题。

The most common theme expressed was one of AI _augmentation_ of work. Over half of survey respondents expressed some version of wanting to collaborate with AI on work that feels meaningful, of wanting their career to still matter, and/or hoping that new industries arise and create new job opportunities. Simultaneously, just over half of respondents hoped for AI _automation_—specifically of the tedious parts of their jobs—so they could have more free time and more space for meaning outside of work. The third most common theme, expressed by about one third of survey respondents, was one of shared prosperity: the hope that the economic gains from AI will be widely shared.
最常被表达的主题是 AI 对工作的_增强_。超过一半的调查受访者表达了某种版本的愿望：希望与 AI 在有意义的工作上进行协作，希望自己的职业生涯依然重要，和/或希望新兴产业出现并创造新的就业机会。与此同时，略超过一半的受访者希望实现 AI _自动化_——特别是工作中繁琐的部分——这样他们就能拥有更多空闲时间和工作之外的意义空间。第三个最常见的主题由约三分之一的调查受访者表达，是共同繁荣：希望 AI 带来的经济收益能够广泛共享。

## **Discussion**
> **讨论**

AI is diffusing rapidly throughout the economy, across an increasing number of surfaces, with increasingly intelligent outputs. In earlier AI chat interfaces, usage was simple, contained in the chat window without web search, tool calls, artifacts, or other affordances. Now, Claude models can operate autonomously for hours through Claude Code and Cowork. As these forms change, the user base is shifting as well. Early adopters were highly technical. Our most recent users apply Claude to tasks that command [lower wages](https://www.anthropic.com/research/economic-index-march-2026-report) in the labor market.
AI 正在迅速扩散到整个经济体，覆盖越来越多的使用场景，产出越来越智能。在早期的 AI 聊天界面中，使用方式简单，被限制在聊天窗口中，没有网络搜索、工具调用、产物或其他功能扩展。现在，Claude 模型可以通过 Claude Code 和 Cowork 自主运行数小时。随着这些形式的改变，用户群体也在发生变化。早期采用者技术能力很强，而我们最新的用户将 Claude 应用于劳动力市场薪酬较低的任务。

In this report, we took several steps toward more informative measurement. First, we began measuring more and more frequently, processing data in hourly samples. This reveals how the cadences of daily life are etched into our usage logs and opens avenues for future research. Second, we began recording artifacts, or the outputs that people take away from Claude. These make Claude's work output more legible, and show some intuitive patterns.
在本报告中，我们向更具信息价值的衡量方式迈出了几步。首先，我们开始以更高频率进行测量，以小时样本处理数据。这揭示了日常生活的节律如何被刻印在我们的使用日志中，并为未来研究开辟了新途径。其次，我们开始记录产物，即人们从 Claude 带走的输出。这使 Claude 的工作产出更易读懂，并展示了一些直观的规律。

Finally, usage data only carries so much information. Our survey allowed us, for the first time, to ask people directly about how they use AI and what they feel about it. We found that our survey respondents use AI for more than we give it credit for—they report AI can do a higher share of their work than the observed exposure measure for their occupation would suggest. Asked to forecast next year's capabilities, over 35% predicted that AI would be able to do _most_ of their work.
最后，使用数据所携带的信息是有限的。我们的调查让我们第一次能够直接询问人们如何使用 AI 以及他们对此的感受。我们发现，调查受访者实际上比我们所认可的程度更多地使用 AI——他们报告 AI 能够完成的工作比例高于其职业的观测暴露指标所暗示的水平。当被要求预测明年的能力时，超过 35% 的人预测 AI 将能够完成他们_大部分_工作。

Accurately classifying the work that Claude does will remain a moving target. For example, as AI capabilities increase, AIs may increasingly interact and exchange with each other, perhaps in ways inscrutable to humans or simple classifiers. Ultimately, Claude's impact on the economy will be visible in economic aggregates like [employment](https://www.anthropic.com/research/labor-market-impacts) and productivity as much as its usage logs. Still, AI is likely to have its earliest impacts in the areas where it does the most work, so shedding light on these ever-changing usage patterns will remain a key way to inform the public.
准确分类 Claude 所做的工作将是一个不断变化的目标。例如，随着 AI 能力的提升，AI 可能越来越多地相互交互和交换，方式可能对人类或简单分类器难以理解。归根结底，Claude 对经济的影响将体现在就业和生产力等经济总量上，与体现在使用日志中同样重要。尽管如此，AI 最早的影响可能出现在它工作最多的领域，因此阐明这些不断变化的使用模式仍将是向公众提供信息的关键方式。

## Appendix
> 附录

Available [here.](https://cdn.sanity.io/files/4zrzovbb/website/03ed1410f74a65ae4cc2a27120d0875e1e569535.pdf)
可点击此处查看。

## Citation
> 引用

```
@online{anthropic2026aeiv6,
        author = {Maxim Massenkoff and Eva Lyubich and Szymon Sacher and Zoe Hitzig and Shaoyi Zhang and Ryan Heller and Peter McCrory},
        title = {Anthropic Economic Index report: Cadences},
        date = {2026-06-26},
        year = {2026},
        url = {https://www.anthropic.com/research/economic-index-june-2026-report},
}
```

Maxim Massenkoff, Eva Lyubich, Szymon Sacher, Zoe Hitzig, Shaoyi Zhang, Ryan Heller, Peter McCrory.

### **Acknowledgements**
> **致谢**

Scott Booth, Keir Bradwell, Meredith Callan, Dexter Callender III, Boris Cherny, Chris Doenlen, Eleanor Dorfman, Jake Eaton, Evan Frondorf, Deep Ganguli, Romello Goodman, Ankit Gupta, Kunal Handa, Rebecca Hiscott, Andrew Ho, Hanah Ho, Jerry Hong, Saffron Huang, Mo Julapalli, Katie Kennedy, Jennifer Martinez, Miles McCain, Kelsey Nanan, Tyler Neylon, Adnan Pirzada, Dianne Penn, Kerry Persen, Sarah Pollack, Ankur Rathi, Santi Ruiz, David Saunders, Ankit Siva, Michael Stern, Ami Vora, Scott White, Heather Whitney, Kim Withee, Ryan Zauk, Jack Clark.
