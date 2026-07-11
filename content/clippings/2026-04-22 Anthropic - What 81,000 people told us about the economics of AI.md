Title: What 81,000 people told us about the economics of AI

URL Source: https://www.anthropic.com/research/81k-economics

Markdown Content:
### Key findings:
> 核心发现：

*   _Our recent survey of 81,000 Claude users shows that people who work in roles that are more exposed to AI have more concerns about AI-driven job displacement. These concerns are also higher among early-career respondents._｜_我们近期对 81,000 名 Claude 用户的调查显示，从事 AI 暴露度较高职位的人对 AI 驱动的就业替代有更多担忧。初期职业阶段的受访者中，这种担忧也更为强烈。_
*   _Those in the highest- and lowest-paid occupations report the largest productivity gains, most commonly from increases in scope (doing new tasks)._｜_薪酬最高和最低职业的从业者报告了最大的生产率提升，最常见的来源是职能范围的扩展（从事新任务）。_
*   _Respondents experiencing the largest speedups from AI express higher concern about job displacement._｜_从 AI 中获得最大速度提升的受访者，对就业替代表达了更高的担忧。_

In order to inform the public about the economic changes we're observing with AI, our [Economic Index](https://www.anthropic.com/research/economic-index-march-2026-report) shares what work Claude is being asked to do, and in which jobs Claude is doing the largest share of tasks. To date, however, we've lacked information on how these usage patterns map onto people's thoughts and impressions of AI.

为了让公众了解我们观察到的 AI 带来的经济变化，我们的[经济指数](https://www.anthropic.com/research/economic-index-march-2026-report)分享了 Claude 被要求从事哪些工作，以及在哪些职位中 Claude 承担了最大比例的任务。然而迄今为止，我们缺乏关于这些使用模式如何映射到人们对 AI 的想法和印象的信息。

Our recent [survey study with 81,000 Claude users](https://www.anthropic.com/features/81k-interviews) provides a way to connect people's economic concerns with what we've quantified in Claude traffic.

我们近期开展的[81,000 名 Claude 用户调查研究](https://www.anthropic.com/features/81k-interviews)提供了一种将人们的经济担忧与我们在 Claude 流量中量化的数据相连接的方式。

The survey asked people about their visions and fears around advances in AI. Many of the thoughts that people shared touched on economic topics. We learned that many people fear job displacement—though they also feel more productive and empowered at work. In some cases, AI has enabled them to start businesses, or given them time for more important things; in others, AI feels stifling, or imposed on them by their employers.

调查询问了人们对 AI 进步的憧憬与忧虑。人们分享的许多想法涉及经济话题。我们了解到，许多人担忧就业替代——尽管他们也感觉在工作中生产率更高、更有能力。在某些情况下，AI 使他们得以创业，或让他们有时间做更重要的事；在另一些情况下，AI 则令人感到窒息，或是被雇主强加于他们。

The survey's results provide initial evidence that [observed exposure](https://www.anthropic.com/research/labor-market-impacts) (our measure of AI displacement risk) is correlated with economic concern around AI. People in highly exposed occupations—as defined by the tasks Claude is observed performing—were more nervous about economic displacement. This is consistent with people being broadly aware of AI's diffusion and potential impacts. We expand on our findings below.

调查结果提供了初步证据，表明[观察到的暴露度](https://www.anthropic.com/research/labor-market-impacts)（我们衡量 AI 替代风险的指标）与对 AI 的经济担忧相关。处于高暴露度职业的人——依据 Claude 被观察到执行的任务来定义——对经济替代更为忧虑。这与人们对 AI 扩散及其潜在影响的广泛认知相符。我们将在下文详述研究发现。

## Who worries about job displacement?
> 谁在担忧就业替代？

_"Well like anyone who has a white collar job these days I'm 100% concerned, pretty much 24/7 concerned about losing my job eventually to A.I."—Software engineer.1_

_"嗯，就像如今任何有白领工作的人一样，我 100% 担忧，几乎全天候担忧着最终被 A.I. 取代我的工作。"——软件工程师_

One fifth of the respondents in our survey voiced concern about economic displacement. Some worried about this in the abstract: one software developer cautioned about "the possibility of AI in its current state being used to replace junior positions." Others lamented that their jobs, or aspects of their jobs, were being automated away. One market researcher said, "In terms of improving my capability, it's no doubt. [B]ut in the future AI may replace my work." In some jobs, people felt it made their work harder. One software developer observed that "when AI arrived, the project managers started giving harder and harder tickets and bugs to solve."

我们调查中五分之一的受访者表达了对经济替代的担忧。有些人的担忧较为抽象：一位软件开发者警示了"AI 在当前状态下被用来取代初级职位的可能性"。另一些人则哀叹自己的工作，或工作的某些方面，正在被自动化取代。一位市场调研员说："在提升我的能力方面，这毫无疑问。但未来 AI 可能取代我的工作。"在某些工作中，人们感觉 AI 使他们的工作更难了。一位软件开发者观察到："AI 到来后，项目经理开始给出越来越难的工单和 Bug 来解决。"

Throughout this report, we use Claude-powered classifiers to infer people's attributes and sentiments from their responses. For example, many participants mention their line of work in passing or give informative details about their work life, which allows us to infer their occupation. Similarly, we quantify concerns about job loss by prompting Claude to identify and interpret direct quotes in which respondents indicate that their own role is at risk of AI-driven displacement. We give example prompts in [the Appendix](https://cdn.sanity.io/files/4zrzovbb/website/3a8d990bc90098038eabd77b0d12ff636ed58d50.pdf).

在整份报告中，我们使用 Claude 驱动的分类器，从受访者的回复中推断其属性和情绪。例如，许多参与者在陈述中提到了自己的工作领域，或提供了有关工作生活的详细信息，使我们能够推断其职业。类似地，我们通过提示 Claude 识别和解读受访者表明自身角色面临 AI 驱动替代风险的直接引语，来量化对失业的担忧。我们在[附录](https://cdn.sanity.io/files/4zrzovbb/website/3a8d990bc90098038eabd77b0d12ff636ed58d50.pdf)中提供了示例提示词。

Respondents' perceived threat from AI was correlated with our [own measure of observed exposure](https://www.anthropic.com/research/labor-market-impacts), which reflects the percentage of a job's tasks for which Claude is used. A respondent was more concerned about AI when our observed exposure measure for that respondent was higher. Elementary school teachers were less worried about their own displacement than software engineers, for example, consistent with the fact that Claude usage skews toward coding tasks.

受访者对 AI 威胁的感知与我们[自身的观察暴露度指标](https://www.anthropic.com/research/labor-market-impacts)相关，该指标反映了一份工作中 Claude 被用于执行的任务比例。当某受访者的观察暴露度指标越高，其对 AI 的担忧就越大。例如，小学教师比软件工程师对自身替代的担忧更少，这与 Claude 使用偏向编程任务的事实相符。

We show this in Figure 1 below. The y-axis is the percentage of respondents in a given occupation who said that AI is already replacing their role or is likely to do so soon. The x-axis is observed exposure. The plot shows that, on average, people in more exposed occupations tended to express more concern about their jobs being automated away. For every 10-percentage-point increase in exposure, perceived job threat increased by 1.3 percentage points. People in the top 25% of exposure mentioned the worry three times as often as those in the bottom 25%.

我们在下方图 1 中展示了这一结论。纵轴是给定职业中表示 AI 已经取代或可能很快取代其职位的受访者百分比，横轴是观察暴露度。图表显示，平均而言，处于更高暴露度职业的人倾向于对自身工作被自动化取代表达更多担忧。暴露度每增加 10 个百分点，对就业威胁的感知就增加 1.3 个百分点。暴露度位于前 25% 的人提及这种担忧的频率是后 25% 的三倍。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F3cc91526f31561f390700d113a9091e6ad8c094b-1920x1080.png&w=3840&q=75)

**Figure 1: Perceived job threat from AI and Observed Exposure.**Percentage of respondents indicating some job threat from AI vs. the Observed Exposure measure from [Massenkoff and McCrory (2026)](https://www.anthropic.com/research/labor-market-impacts). A respondent was coded as indicating job threat if they said their role was already being replaced or substantially reduced, or that such changes were likely in the near term (coded using Claude). The green line shows a simple linear fit.

Another important worker characteristic is career stage. In previous research, we reported [tentative signs](https://cdn.sanity.io/files/4zrzovbb/website/a42bc3fc08283562f08fd8bdee8f6f9a3d506e87.pdf) of a slowdown in the hiring of recent graduates and early-career workers in the United States. For about half of respondents in this survey, we were able to infer career stage from their answers.2 We found that early-career respondents were much more likely to express concern about job displacement than senior workers.

另一个重要的工人特征是职业阶段。在之前的研究中，我们报告了美国应届毕业生和早期职业工作者招聘放缓的[初步迹象](https://cdn.sanity.io/files/4zrzovbb/website/a42bc3fc08283562f08fd8bdee8f6f9a3d506e87.pdf)。在这项调查的约半数受访者中，我们能够从他们的回答中推断出职业阶段。我们发现，初期职业阶段的受访者比资深工作者更有可能表达对就业替代的担忧。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fe734cb6470a143e7fafa0ec0e0b1070ea63118db-1920x1080.png&w=3840&q=75)

**Figure 2: Concern about economic displacement by career stage.**Percentage of respondents indicating some job threat from AI, by career stage. Both fields are inferred from free-form responses using Claude-powered classifiers.

## Who benefits from AI?
> 谁从 AI 中受益？

Using Claude to assess the survey responses, we rated the extent of people's self-reported productivity gains from AI on a 1–7 scale, where 1 is "less productive," 2 is "no change," and each subsequent level denotes a larger gain. Responses that scored 7 included testimonials like, "It used to take months to make the website I [made] in 4-5 days"; Claude gave a 5 to statements like, "What might have taken four hours was accomplished in half the time," and a 2 to ones like, "Personally, I had AI help me fix code on a website. But it took multiple passes to get the result I was after."3

使用 Claude 评估调查回复时，我们在 1 至 7 的量表上对人们自我报告的 AI 生产率提升程度进行了评级，其中 1 为"生产率降低"，2 为"无变化"，此后每一级代表更大的提升。得 7 分的回复包括诸如"制作一个曾经需要数月的网站，我现在 4-5 天就完成了"之类的陈述；Claude 给出 5 分的陈述如"可能需要四个小时的工作，半小时就完成了"；给出 2 分的如"个人而言，我让 AI 帮我修复了网站代码，但经过多次尝试才得到我想要的结果"。

Overall, people reported meaningful productivity gains on average. The mean productivity rating was 5.1, corresponding to "substantially more productive." Our respondents were, of course, active Claude users who were willing to take a survey. This could make them more likely to report productivity benefits than the average user. Some 3% reported negative or neutral impacts, and 42% did not give a clear indication on productivity.

总体而言，人们平均报告了有意义的生产率提升。生产率评分均值为 5.1，对应"实质性地更有生产率"。当然，我们的受访者都是愿意参与调查的活跃 Claude 用户，这可能使他们比普通用户更有可能报告生产率收益。约 3% 的人报告了负面或中性的影响，42% 的人没有对生产率给出明确指示。

This splits somewhat across income lines. The left panel in Figure 3 shows that people in high-paying jobs, like software developers, conveyed the largest productivity gains from AI. This result is not driven only by coding; it holds when we leave out computer and math occupations. It echoes a previous [Economic Index finding](https://www-cdn.anthropic.com/096d94c1a91c6480806d8f24b2344c7e2a4bc666.pdf) that also favored higher-paid workers: in tasks requiring greater levels of education, Claude tended to reduce the time taken to complete a task (relative to doing it without AI) by a higher percentage.

这一结论在收入线上存在一定分化。图 3 左图显示，从事高薪工作的人（如软件开发者）报告了来自 AI 的最大生产率提升。这一结论并非仅由编程驱动；在排除计算机和数学职业后，该结论依然成立。这与此前一项同样有利于高薪工作者的[经济指数研究发现](https://www-cdn.anthropic.com/096d94c1a91c6480806d8f24b2344c7e2a4bc666.pdf)相呼应：在需要更高教育水平的任务中，Claude 减少完成任务时间的百分比（相对于不使用 AI 的情况）往往更高。

Some of the lowest-paid workers describe high productivity gains as well. This included a customer service representative using "AI to save me a lot of time with creating a response based on another one." And in some cases, people in low-wage jobs were using AI on technical side projects. One delivery driver, for example, was using Claude to start an e-commerce business, and a landscaper was building a music application.

一些薪酬最低的工作者也描述了较高的生产率提升。这包括一位使用"AI 在基于另一条回复创建响应方面节省了我大量时间"的客户服务代表。在某些情况下，低薪工作者将 AI 用于技术性副业。例如，一位送货员正在使用 Claude 创办电商业务，一位园艺工正在构建一个音乐应用程序。

![Image 3](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F054ba6248545bfe2908345aa00abb7baf0ad0e42-1920x1080.png&w=3840&q=75)

**Figure 3: Inferred productivity gain by occupation.**The left panel shows the mean inferred productivity benefit from AI (inferred using a Claude-powered classifier) by quartile of occupational median wage from the BLS. The right panel shows the same outcome, split by major occupational group. Error bars show 95% confidence intervals.

We look at this in more detail in the right panel of Figure 3, showing the inferred productivity gain by major occupational group. At the top are management occupations. These respondents are mostly entrepreneurs using Claude to build a business.4 The next highest category is computer and math, which includes software developers. The two groups exhibiting the mildest productivity improvements were workers in scientific and legal professions. Some lawyers worried about AI's ability to follow precise instructions. For example: "I have given very specific rules about what is where, how to read a legal document, what I want it to do… but it diverges every time."

我们在图 3 右图中对此进行了更详细的分析，显示了按主要职业类别划分的推断生产率提升。位于顶部的是管理职业。这些受访者大多是使用 Claude 构建业务的创业者。其次是计算机和数学职业，包括软件开发者。生产率提升最为温和的两个群体是科学和法律专业的工作者。一些律师对 AI 遵循精确指令的能力感到担忧。例如："我给出了非常具体的规则，关于什么在哪里、如何阅读法律文件、我想让它做什么……但它每次都会偏离。"

A key question as AI diffuses through the economy is where the benefits will accrue—to workers, their managers, consumers, or corporations. Respondents indicated the recipient of these gains in about a quarter of interviews. Overall, most of these people cited benefits to themselves, through faster tasks, expanded scope, and freed-up time.5 But 10% of respondents who named a recipient said that employers or clients were asking for and getting more work. A smaller share mentioned benefits to AI companies, and an even smaller share said that AI would be a net negative. This depended on career stage: only 60% of early-career workers indicated that they personally benefited from AI, compared to 80% of senior professionals.

随着 AI 在经济中的扩散，一个关键问题是收益将落入谁手——工作者、管理者、消费者还是企业。约四分之一的访谈中，受访者指出了这些收益的接受者。总体而言，大多数人将收益归因于自身，通过更快完成任务、扩展职能范围和节省时间实现。但 10% 指出了受益者的受访者表示，雇主或客户正在要求并获得更多工作。较少比例的人提到了 AI 公司的收益，更少的人表示 AI 将产生净负面影响。这取决于职业阶段：仅 60% 的初期职业工作者表示他们个人从 AI 中受益，而资深专业人员中这一比例为 80%。

![Image 4](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F4c1138907fd70ea69195da8100056a9e4801b030-1920x1080.png&w=3840&q=75)

**Figure 4: Where does the surplus from AI productivity go?** Among respondents who named a beneficiary of their AI productivity gains, the share identifying each destination.

## Scope and speed
> 范围与速度

Respondents also shared where they experienced gains in productivity. We separate this into scope, speed, quality, and cost. For example, many people using AI for coding tasks said things like, "I'm a non tech guy but now I'm a full stack developer." This is an expansion of scope; AI unlocks new abilities for them. In contrast, some users sped up tasks they were already doing, like the accountant who said, "I built a tool that helps me finish a financing task in 15 minutes that used to take 2 hours." Quality gains often came from more thorough checks of code, contracts, and other paperwork. And a small share of respondents mentioned the low cost of using AI: "[I]f I hire a social media manager it's over my budget."

受访者还分享了他们在哪些方面体验到了生产率提升。我们将其分为范围、速度、质量和成本四类。例如，许多将 AI 用于编程任务的人说："我不是技术人员，但现在我已经是全栈开发者了。"这是范围的扩展；AI 为他们解锁了新能力。相比之下，一些用户加速了他们原本就在做的任务，比如那位说"我构建了一个工具，帮助我在 15 分钟内完成以前需要 2 小时的财务任务"的会计师。质量提升往往来自对代码、合同和其他文件的更彻底审查。还有少部分受访者提到了使用 AI 的低成本："如果我雇一个社交媒体经理，那已经超出我的预算了。"

We find that the most common productivity enhancement is in scope, which was cited by 48% of users who explicitly mentioned productivity effects. 40% of users who mentioned productivity emphasized speed.

我们发现，最常见的生产率提升来自范围扩展，48% 明确提及生产率效果的用户引用了这一点。40% 提到生产率的用户强调了速度。

![Image 5](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F197366411f5546a640214b38baaeb1402f950c74-1920x1080.png&w=3840&q=75)

**Figure 5: What kind of productivity gain do users report?**Share of respondents describing each type of productivity benefit.

People's experience with Claude might also shape their concerns about AI. To assess this, we measured the speedup reported by respondents, by extracting whether their work was now much slower (which we coded as 1), showed no change in speed (4), or had become much faster (7).

人们使用 Claude 的体验也可能影响他们对 AI 的担忧。为评估这一点，我们通过提取受访者的工作是否变慢很多（编码为 1）、速度无变化（编码为 4）或变快很多（编码为 7）来衡量他们报告的速度提升。

We found that the relationship between speedup and perceived job threat is U-shaped (see Figure 6). The leftmost bar shows respondents who reported that AI slowed them down. These respondents were more likely to indicate that AI posed a significant threat to their livelihoods. For example, some creative workers, like fine artists and writers, found AI too stifling and rigid to help them at their own work. At the same time, they feared the diffusion of AI into creative fields would make it harder for them to find work.

我们发现，速度提升与感知就业威胁之间的关系呈 U 形（见图 6）。最左侧的柱状图显示了报告 AI 让他们变慢的受访者。这些受访者更有可能表示 AI 对其生计构成重大威胁。例如，一些创意工作者，如纯艺术家和作家，发现 AI 太过死板和限制性，无法在他们自己的工作中帮助他们。与此同时，他们担心 AI 向创意领域的扩散将使他们更难找到工作。

![Image 6](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fed7b1b8b258c348ad2127b6de33a3802160fac28-1920x1080.png&w=3840&q=75)

**Figure 6: Job threat from AI and speedup.**Percentage of respondents who said that displacement at their own job was already happening or likely in the near term, by the level of inferred speedup.

For the remaining respondents, perceived job threat increases consistently with the level of speedup implied by their answers. This makes some economic sense: if the time required to do one's tasks is shrinking quickly, there may be more uncertainty about the future viability of the role.

对于其余受访者，感知就业威胁随其回答所暗示的速度提升水平而持续增加。这在经济上有一定道理：如果完成任务所需的时间快速缩短，该职位未来的可行性可能存在更大的不确定性。

## Discussion
> 讨论

The Economic Index reveals what people do with AI. But another key input for understanding AI's economic impact is to hear directly from people about their experience. The responses explored here show that people's intuitions track the usage data: they worry most about AI's effect in the jobs where we observe Claude doing the most work. We also find higher levels of economic anxiety among early-career workers, which aligns with past research.

经济指数揭示了人们如何使用 AI。但理解 AI 经济影响的另一个关键输入，是直接听取人们的亲身体验。本文探讨的回复表明，人们的直觉与使用数据吻合：他们最担忧 AI 在我们观察到 Claude 承担最多工作的职位上产生的影响。我们还发现初期职业工作者中存在更高程度的经济焦虑，这与以往研究相符。

There are also signs that Claude empowers its users. People are most likely to talk about benefits flowing to themselves rather than to employers or AI companies. High-wage workers were the most enthusiastic about the productivity impacts of AI, but people with low-wage jobs and lower levels of education also reported large productivity gains. Most respondents reported that Claude enhanced their capabilities in the form of broadening the scope of their work or speeding it up. But users experiencing the largest speedups were also the most nervous about AI's job impacts.

同时也有迹象表明 Claude 赋权于用户。人们最有可能谈及收益流向自身，而非雇主或 AI 公司。高薪工作者对 AI 生产率影响最为热情，但低薪工作者和受教育程度较低的人也报告了较大的生产率提升。大多数受访者报告称，Claude 通过扩展工作范围或加快工作速度增强了他们的能力。但那些获得最大速度提升的用户，也对 AI 的就业影响最为忧虑。

There are key caveats to our analysis, owing to the nature of the data. First, our survey is limited to users of personal accounts on Claude.ai who chose to respond. Among other potential biases, these users could be more likely to perceive the benefits as flowing to themselves. Second, the users weren't asked directly about many of the derived variables here, so our inferences on occupation, career stage, and other variables from contextual clues could be wrong. Relatedly, because the survey is open-ended, our measures are based on what respondents happen to mention; these findings should be confirmed in structured surveys that ask about these topics directly.

由于数据的性质，我们的分析存在若干需要注意的局限性。首先，我们的调查仅限于选择回复的 Claude.ai 个人账号用户。在其他潜在偏差中，这些用户可能更倾向于认为收益流向自身。其次，用户未被直接询问这里许多衍生变量，因此我们从情境线索对职业、职业阶段和其他变量的推断可能有误。相关地，由于调查是开放性的，我们的测量基于受访者碰巧提及的内容；这些发现应通过直接询问这些话题的结构化调查加以确认。

Still, the interviews surface real insights about people's feelings around the economics of AI, showing how qualitative data can surface quantitative hypotheses. And the large share of economic-related concerns is a strong signal in itself.

尽管如此，这些访谈呈现了关于人们对 AI 经济学感受的真实洞见，展示了定性数据如何能够浮现定量假设。经济相关担忧占据的大比例本身就是一个有力的信号。

### Citation

```
@online{massenkoff2026interviewer,
author = {Maxim Massenkoff and Saffron Huang},
title = {What 81,000 people told us about the economics of AI},
date = {2026-04-22},
year = {2026},
url = {anthropic.com/research/81k-economics},
}
```

### Appendix

See the final section of the [linked PDF](https://cdn.sanity.io/files/4zrzovbb/website/3a8d990bc90098038eabd77b0d12ff636ed58d50.pdf).

### Acknowledgements

We thank the 80,508 Claude users who shared their stories.

Maxim Massenkoff led the analysis and wrote the blog post. Saffron Huang led the interview project and provided guidance throughout.

Zoe Hitzig and Eva Lyubich provided critical feedback and methodological guidance. Keir Bradwell and Rebecca Hiscott gave editorial support. Hanah Ho and Kim Withee contributed to design. Grace Yun, AJ Alt, and Thomas Millar implemented Anthropic Interviewer within Claude.ai. Chelsea Larsson, Jane Leibrock, and Matt Gallivan contributed to survey and experience design. Theodore Sumers contributed to the data processing and clustering infrastructure. Peter McCrory, Deep Ganguli, and Jack Clark provided critical feedback, direction and organizational support.

Additionally, we thank Miriam Chaum, Ankur Rathi, Santi Ruiz, and David Saunders for their discussion, feedback, and support.
