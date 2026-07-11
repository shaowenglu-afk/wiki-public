Title: The Anthropic Economic Index report: New building blocks for understanding AI use

URL Source: https://www.anthropic.com/research/economic-index-primitives

Markdown Content:
Is artificial intelligence really making people faster at work? What sort of tasks does AI support best? And how might it change the nature of people's occupations?
人工智能真的让人们工作更快了吗？AI 最擅长支持哪类任务？它又将如何改变职业的本质？

At Anthropic, we're measuring real-world AI use on an ongoing basis to answer questions exactly like these. Our privacy-preserving [analysis method](https://www.anthropic.com/research/clio) allows us to learn more about conversations on [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) (capturing uses by consumers) and our first-party API (mostly capturing uses by businesses).1 In past reports, we've assessed AI tasks by [occupation and wage level](https://www.anthropic.com/news/the-anthropic-economic-index), looked more closely at [software development](https://www.anthropic.com/research/impact-software-development), and studied AI use [by country and by US state](https://www.anthropic.com/research/economic-index-geography).
在 Anthropic，我们持续测量真实世界中的 AI 使用情况，以回答诸如此类的问题。我们的隐私保护[分析方法](https://www.anthropic.com/research/clio)使我们得以深入了解 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) 上的对话（捕捉消费者的使用情况）以及我们自有 API 的使用情况（主要捕捉企业的使用情况）。¹ 在过去的报告中，我们已按[职业和薪资水平](https://www.anthropic.com/news/the-anthropic-economic-index)评估了 AI 任务，深入研究了[软件开发](https://www.anthropic.com/research/impact-software-development)，并按[国家和美国各州](https://www.anthropic.com/research/economic-index-geography)研究了 AI 使用情况。

We're now adding a new level of detail to our Economic Index. In our fourth report, we're introducing what we've called **economic primitives**（经济基元）: a set of five simple, foundational measurements to track the economic impacts of Claude over time. Our initial set includes task complexity, skill level, purpose (work, education, or personal use), AI autonomy, and success.2 We derive these primitives from asking Claude to answer a common set of questions about every conversation in our sample for this report.
我们现在正在为经济指数增加新的细节层面。在第四期报告中，我们引入了我们称之为**经济基元**（economic primitives）的概念：一组五个简单的基础性测量指标，用于随时间追踪 Claude 的经济影响。初始集包括任务复杂性、技能水平、目的（工作、教育或个人使用）、AI 自主度以及成功率。² 我们通过让 Claude 回答关于本报告样本中每次对话的一组通用问题来推导这些基元。

These primitives provide a leading indicator of AI's potential economic impacts—and allow us to answer far more complex questions about how AI is already changing jobs. Our latest report, which samples conversations from November 2025 (predominantly using Claude Sonnet 4.5), uses our primitives to explore a wide range of questions that we wouldn't otherwise be able to answer—including how Claude's task-level success rates change for more complex tasks, and whether the use of Claude to date might portend a net-deskilling effect on many jobs.
这些基元提供了 AI 潜在经济影响的领先指标——并使我们能够回答关于 AI 如何正在改变工作的更为复杂的问题。我们的最新报告对 2025 年 11 月的对话进行了采样（主要使用 Claude Sonnet 4.5），利用这些基元探索了一系列我们原本无法回答的问题——包括 Claude 的任务级成功率如何随任务复杂性的增加而变化，以及迄今为止 Claude 的使用是否可能预示着对许多工作岗位产生净去技能化效应。

You can read the fourth Economic Index report [here](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report). Below, we summarize its results.
您可以在[此处](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report)阅读第四期经济指数报告。以下是其结果摘要。

## **What we've learned from our economic primitives**
> **从经济基元中得到的发现**

We applied our economic primitives to questions about individual tasks, occupations, and then the possible aggregate impacts of the changes we observe. (Our full methodology—including details on how we tested the accuracy of our primitives—is described in chapter two of the [full report](https://www.anthropic.com/research/anthropic.com/research/anthropic-economic-index-january-2026-report).)
我们将经济基元应用于关于个别任务、职业，以及我们所观察到的变化可能产生的总体影响等问题。（我们的完整方法论——包括关于我们如何测试基元准确性的详情——在[完整报告](https://www.anthropic.com/research/anthropic.com/research/anthropic-economic-index-january-2026-report)第二章中有所描述。）

### Tasks
> 任务

#### **Which tasks does AI speed up, and by how much?**
> **AI 能加速哪些任务，加速幅度有多大？**

We found that more complex tasks were sped up the most by Claude. We measure this by what Claude estimates as the number of years of schooling required to understand the conversation's inputs: in Claude.ai, tasks with prompts requiring a high school education (12 years) were sped up by a factor of 9, while those requiring a college degree (16 years) were sped up by a factor of 12. (On the API, the speedup was greater still.) These results imply that AI's productivity gains are currently accruing in tasks that require relatively high human capital, which is consistent with the [evidence](https://www.nber.org/papers/w32966) that white collar professionals are more likely to use AI at work.
我们发现，Claude 对更复杂任务的加速最为显著。我们通过 Claude 估算理解对话输入所需的受教育年限来衡量这一点：在 Claude.ai 上，提示词要求高中教育水平（12 年）的任务被加速了 9 倍，而要求大学本科学历（16 年）的任务则被加速了 12 倍。（在 API 上，加速倍数更高。）这些结果意味着 AI 的生产力提升目前主要积累在需要相对较高人力资本的任务上，这与白领专业人士更可能在工作中使用 AI 的[证据](https://www.nber.org/papers/w32966)一致。

This same trend holds—albeit in weaker form—when we adjust for tasks' success rates. Claude successfully completes tasks that require a college degree 66% of the time, compared to 70% for those tasks that require less than a high school education. This reduces, but doesn't eliminate, the overall effect: Claude's impact on task speedup scales more sharply with complexity than complexity correlates with a decrease in success rate.
当我们根据任务成功率进行调整时，这一趋势仍然成立——尽管效果有所减弱。Claude 成功完成需要大学本科学历任务的比例为 66%，而需要低于高中教育水平任务的成功率为 70%。这减弱了但并未消除整体效果：Claude 对任务加速的影响随复杂性的增加而显著提升，其幅度超过了复杂性与成功率下降的相关程度。

![Image 1](https://www-cdn.anthropic.com/images/4zrzovbb/website/748b522964169a031f15579194d8c8976ba80a79-1920x792.svg)

_**Speedup and success rate vs. human years of schooling.**The chart on the left shows a scatterplot of the relationship between speedup and human years of schooling, measured at the O*NET task level. The dashed lines show the line of best fit. The chart on the right shows the relationship with the success rate._
_**加速倍数和成功率与人类受教育年限的关系。** 左图为加速倍数与人类受教育年限之间关系的散点图，在 O*NET 任务层面测量。虚线显示最佳拟合线。右图显示与成功率的关系。_

#### **What are the time horizons over which Claude can support tasks?**
> **Claude 能支持任务的时间跨度是多少？**

[METR](https://metr.org/)'s measure of AI's [task horizons](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/) shows that longer tasks are harder for AI models to complete. But the length of time over which AI models can work is steadily increasing as models get better: this measure has now become a key indicator of AI progress.
[METR](https://metr.org/) 对 AI [任务时间跨度](https://metr.org/blog/2025-03-19-measuring-ai-ability-to-complete-long-tasks/)的测量表明，任务越长对 AI 模型来说越难完成。但随着模型的改进，AI 模型能够工作的时间跨度正在稳步增加：这一指标现已成为衡量 AI 进展的关键指标。

We're able to complement METR's analysis using our economic primitives. In the graph below, we show Claude's task-level success rates relative to the amount of time a human would take to do the same task, both on [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) and on our API:
我们能够使用经济基元对 METR 的分析进行补充。在下图中，我们展示了 Claude 在 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) 和我们的 API 上的任务级成功率，与完成同一任务人类所需时间的对比：

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fbf18bd0b6c14a07cff03bad97dc720183a0ac507-3840x2800.png&w=3840&q=75)

_**Task success vs. human-only time.**This chart shows the relationship between task success (%) and the time the task would require a human to complete alone, all measured at the O*NET task level and split by platform. The dashed lines show the fit from a linear regression._
_**任务成功率与纯人工完成时间的关系。** 该图表显示任务成功率（%）与人类独立完成该任务所需时间之间的关系，均在 O*NET 任务层面测量，并按平台划分。虚线显示线性回归的拟合结果。_

METR's benchmark suggests that Claude Sonnet 4.5 (the model in our own analysis) achieves 50% success rates on tasks of 2 hours. By contrast, our own API data finds that Claude is 50% successful at tasks that take nearly twice as long (around 3.5 hours), and on Claude.ai, the duration is vastly longer still—around 19 hours. But this might not be as discordant as it seems: our methodology is different to METR's in some important ways. In our sample, users can break down complex tasks into smaller steps, creating a feedback loop that allows Claude to correct course. And rather than a fixed set of tasks, our sample contains a form of selection bias: users bring tasks to Claude that they're more confident will work.
METR 的基准测试表明，Claude Sonnet 4.5（我们自己分析中使用的模型）在 2 小时时长的任务上实现了 50% 的成功率。相比之下，我们自己的 API 数据发现，Claude 在耗时几乎是两倍的任务（约 3.5 小时）上成功率为 50%，而在 Claude.ai 上，这一时长更是大幅延长至约 19 小时。但这可能没有看起来那么矛盾：我们的方法论在一些重要方面与 METR 不同。在我们的样本中，用户可以将复杂任务分解成更小的步骤，形成允许 Claude 纠偏的反馈循环。而且，与固定的任务集不同，我们的样本含有某种形式的选择偏差：用户向 Claude 带来的是他们更有把握能成功的任务。

Our analysis shows how Claude's _effective_ time horizons might look different to those found in a study with a consistent set of tasks. We'll track this indicator in further reports.
我们的分析展示了 Claude 的_有效_任务时间跨度可能与使用固定任务集的研究所发现的结果存在差异。我们将在后续报告中追踪这一指标。

#### **How does the nature of Claude's work vary across countries?**
> **Claude 的工作性质在不同国家之间有何差异？**

We find that Claude completes very different kinds of tasks in countries at different stages of economic development. In countries with higher GDP per capita, Claude is used much more frequently for work or for personal use—whereas countries at the other end of the spectrum are more likely to use it for educational coursework. This fits a straightforward "adoption curve" story, in which lower-income countries show a large share of AI use on education and on a smaller number of work tasks, while AI use diversifies towards personal purposes as countries become richer.
我们发现，Claude 在处于不同经济发展阶段的国家中完成着截然不同类型的任务。在人均 GDP 较高的国家，Claude 更多地被用于工作或个人用途——而处于另一端的国家则更倾向于将其用于教育课程作业。这符合一个直接的"采用曲线"叙事，即低收入国家中较大比例的 AI 使用集中在教育和少量工作任务上，而随着国家变得富裕，AI 使用逐渐向个人目的多元化。

These results align with recent work [by Microsoft](http://microsoft.com/en-us/research/wp-content/uploads/2025/12/New-Future-Of-Work-Report-2025.pdf) that associates AI use in education with lower per-capita income, and AI use for leisure with higher incomes. Our [recent partnership](https://www.anthropic.com/news/rwandan-government-partnership-ai-education) with the Rwandan government and ALX, a technology training provider, is designed with this in mind: participants begin by developing AI literacy, and we're piloting a program for granting some graduates year-long access to Claude Pro, supporting the transition from educational use to a broader range of applications.
这些结果与[微软](http://microsoft.com/en-us/research/wp-content/uploads/2025/12/New-Future-Of-Work-Report-2025.pdf)近期将教育领域的 AI 使用与较低人均收入相关联、将休闲领域的 AI 使用与较高收入相关联的研究结果一致。我们与卢旺达政府及技术培训提供商 ALX 的[近期合作](https://www.anthropic.com/news/rwandan-government-partnership-ai-education)正是以此为导向设计的：参与者从培养 AI 素养开始，我们正在试点一项为部分毕业生提供为期一年 Claude Pro 使用权的项目，支持从教育用途向更广泛应用的过渡。

![Image 3](https://www-cdn.anthropic.com/images/4zrzovbb/website/6d102cf4365e7743de4413f22dda33035de71038-1072x356.svg)

_**Per capita income predicts how Claude is used across countries.**Each plot shows the relationship between the share of a specific kind of use (work, coursework, or personal) for Claude.ai conversations, and log GDP per capita._
_**人均收入预测了 Claude 在各国的使用方式。** 每幅图显示 Claude.ai 对话中特定使用类型（工作、课程作业或个人）的比例与对数人均 GDP 之间的关系。_

### Occupations
> 职业

#### **Coverage**
> **覆盖范围**

In our [first report](https://www.anthropic.com/news/the-anthropic-economic-index), with data from January 2025, we found that 36% of jobs in our sample saw Claude being used for at least a quarter of their tasks. Pooling data across reports, this has risen to 49%. But once we account for Claude's _success_ _rate_ (which we weight according to how often workers do that task and how long the task takes), we get a different picture of which jobs are most affected by the use of AI.
在我们使用 2025 年 1 月数据的[第一期报告](https://www.anthropic.com/news/the-anthropic-economic-index)中，我们发现样本中 36% 的工作岗位中 Claude 被用于完成至少四分之一的任务。汇总各期报告数据后，这一比例已上升至 49%。但一旦我们考虑到 Claude 的_成功率_（我们根据工人执行该任务的频率和任务所需时间对其进行加权），我们就会得到关于哪些工作受 AI 使用影响最大的不同图景。

On the graph below, we plot that earlier measure of occupations' task coverage along the _x_ axis, and our new, adjusted measure on the _y_ axis. Although the two are certainly correlated, we now find that some occupations (like data entry keyers and radiologists) are much more heavily affected by AI than task coverage alone would suggest, while others (like teachers and software developers) are relatively less affected.
在下图中，我们将此前职业任务覆盖率的测量结果绘制在 _x_ 轴上，将我们新的调整后测量结果绘制在 _y_ 轴上。尽管两者确实相关，但我们现在发现，一些职业（如数据录入员和放射科医生）受 AI 影响的程度远超单纯任务覆盖率所显示的，而另一些职业（如教师和软件开发者）则受影响相对较小。

![Image 4](https://www-cdn.anthropic.com/images/4zrzovbb/website/1fc34cf7333c83157f586f908b8f7ec2dc92afe2-857x712.svg)

_**Effective AI coverage vs. task coverage.**The plot shows the relationship between task effective AI coverage (%) and task coverage, measured at the occupation level. Effective AI coverage tracks the share of a worker's time-weighted duties that AI could successfully perform, based on Claude.ai data. Task coverage is the share of tasks that appear in Claude.ai usage. The dashed line shows where effective AI coverage share equals task coverage._
_**有效 AI 覆盖率与任务覆盖率的关系。** 该图显示任务有效 AI 覆盖率（%）与任务覆盖率之间的关系，在职业层面测量。有效 AI 覆盖率追踪 AI 能够成功执行的工人按时间加权职责的比例，基于 Claude.ai 数据。任务覆盖率是出现在 Claude.ai 使用中的任务比例。虚线显示有效 AI 覆盖率与任务覆盖率相等的位置。_

That said, even our revised assessment is still limited: we only assess tasks that are performed on Claude.ai, and it's not always clear how these conversations might map onto changes in the real world. This is an area we plan to dig into further in future.
尽管如此，即便是我们修订后的评估仍有局限：我们只评估在 Claude.ai 上执行的任务，而且这些对话如何映射到现实世界的变化并不总是清晰的。这是我们计划在未来深入探讨的领域。

#### **Task content**
> **任务内容**

A further question we asked is whether the tasks that AI covers represent the higher- or the lower-skilled components of a given occupation. Using an estimate that we create of the skill level required for each task, we find that Claude is relatively more likely to cover the tasks that require _higher_ education levels—specifically, tasks that require an average of 14.4 years of education (equivalent to a US associate's degree), relative to the economy's average of 13.2 (shown below). This aligns with our earlier finding that Claude is used more frequently by white-collar workers.
我们进一步追问的是：AI 所覆盖的任务代表的是特定职业中技能要求较高还是较低的部分。使用我们为每项任务创建的所需技能水平估算，我们发现 Claude 相对更可能覆盖需要_更高_教育水平的任务——具体而言，平均需要 14.4 年教育经历（相当于美国副学士学位）的任务，相对于经济体平均水平的 13.2 年（如下所示）。这与我们早先发现 Claude 更多地被白领工人使用的结论一致。

![Image 5](https://www-cdn.anthropic.com/images/4zrzovbb/website/ee80542ac5b4dc9fd097a391284e628ab5f5d239-713x425.svg)

_**Education level of all tasks vs. Claude-covered tasks.** The blue bars give the distribution of the predicted task-level education required for all tasks in the O*NET database, weighted by employment. The orange bars show the same, restricting to tasks that appear in Claude.ai data._
_**所有任务与 Claude 覆盖任务的教育水平比较。** 蓝色柱显示 O*NET 数据库中所有任务所需的预测任务级教育水平分布，按就业情况加权。橙色柱显示相同内容，但限定于出现在 Claude.ai 数据中的任务。_

As an experiment, we estimated how removing these Claude-covered tasks would shift the task composition of people's jobs. As a first-order effect, this would _deskill_ jobs on average, since it would remove those higher-education tasks. Professions like technical writers, travel agents, and teachers would be affected (as we discuss further in [the report](https://www.anthropic.com/research/anthropic.com/research/anthropic-economic-index-january-2026-report)), though a rarer few (like real estate managers) would see effects going the other way.
作为一项实验，我们估算了移除这些 Claude 覆盖任务将如何改变人们工作的任务构成。作为一阶效应，这将平均而言使工作_去技能化_，因为它将移除那些教育要求较高的任务。技术写作员、旅行代理人和教师等职业将受到影响（如我们在[报告](https://www.anthropic.com/research/anthropic.com/research/anthropic-economic-index-january-2026-report)中进一步讨论的），尽管少数职业（如房产经理）将看到相反方向的影响。

We're not necessarily _predicting_ that this deskilling will occur: it's possible that _even if_ AI fully automated the tasks it currently supports, the labor market would dynamically adjust in ways that this analysis doesn't account for. (Of course, as models improve, the composition of tasks that AI covers will change, too.) That said, we think this offers a useful signal as to the most immediate effects that AI might have on occupations in the near future.3
我们并不一定是在_预测_这种去技能化将会发生：即便 AI 完全自动化了它目前支持的任务，劳动力市场也可能以这一分析未能考虑到的方式进行动态调整。（当然，随着模型的改进，AI 所覆盖任务的构成也将发生变化。）尽管如此，我们认为这为 AI 在不久的将来可能对职业产生的最直接影响提供了一个有用的信号。³

### **Aggregate impact**
> **总体影响**

In our earlier research, we [estimated](https://www.anthropic.com/research/estimating-productivity-gains) that the widespread adoption of AI could increase US labor productivity growth by 1.8 percentage points per year over the next ten years—around double the trend rate. Our new primitives allow us to revisit this analysis.
在我们早先的研究中，我们[估算](https://www.anthropic.com/research/estimating-productivity-gains)AI 的广泛采用可能在未来十年内使美国劳动生产率年增长提高 1.8 个百分点——约为趋势增速的两倍。我们的新经济基元使我们能够重新审视这一分析。

Based on our estimates of task speedups alone, we replicated our earlier finding of a 1.8 percentage point increase (even when we added in our API data). But when we account for task _reliability_—that is, when we adjust our estimate of task-level time savings by the probability that the task is _successful_, our estimate falls by about one-third for tasks completed on [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) (to 1.2 percentage points per year), and by slightly more (to 1.0 percentage points) for the typically more challenging tasks completed on our API.
仅基于任务加速的估算，我们复现了此前 1.8 个百分点提升的发现（即便在加入 API 数据后亦然）。但当我们考虑任务_可靠性_——即根据任务_成功_的概率调整我们对任务级节省时间的估算时——对于在 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) 上完成的任务，我们的估算下降约三分之一（至每年 1.2 个百分点），对于通常更具挑战性的 API 上完成的任务，则下降略多（至 1.0 个百分点）。

Even a 1 percentage point increase in annual labor productivity growth would still be notable: it would return US productivity growth to the rates of the late 1990s and early 2000s. And, as we mentioned in our [earlier research](https://www.anthropic.com/research/estimating-productivity-gains), this top-line estimate does not account for the possibilities that AI models become much more powerful, or that the use of AI at work becomes much more sophisticated—which could push the number much higher. Indeed, since our survey, Claude has become substantially more powerful, with the release of Claude Opus 4.5.
即便每年劳动生产率增长提高 1 个百分点也相当显著：这将使美国生产率增长恢复到 1990 年代末和 2000 年代初的水平。而且，正如我们在[早先的研究](https://www.anthropic.com/research/estimating-productivity-gains)中提到的，这一顶线估算并未考虑 AI 模型变得更强大或 AI 在工作中的使用变得更为复杂的可能性——这些都可能使数字大幅提升。事实上，自我们的调查以来，随着 Claude Opus 4.5 的发布，Claude 已变得大幅更强。

## **Updates on our previous measures**
> **对此前指标的更新**

In addition to our primitives, we collected a new round of data on the measures we've been tracking in our previous reports. This allows us to pick out trends in AI use over the course of 2025, from January to November. Here, we mostly find only small evolutions from the results of previous analyses, which pointed to an uneven distribution of Claude use.
除了基元之外，我们还收集了一轮新的关于此前报告中一直追踪指标的数据。这使我们能够发现 2025 年 1 月至 11 月 AI 使用的趋势。在这里，我们大多数情况下发现与此前分析结果相比只有小幅演变，这些结果指向 Claude 使用分布不均。

First, we find that the use of Claude has remained highly concentrated among certain tasks: even though our sample includes 3,000 unique work tasks on Claude.ai, the top ten account for 24% of the set, which has steadily increased from 21% in January 2025. More specifically, computer and mathematical tasks continue to dominate Claude use: they're about a third of all conversations on Claude.ai, and nearly half of our API traffic.
首先，我们发现 Claude 的使用在某些任务中仍然高度集中：尽管我们的样本包含 Claude.ai 上 3,000 个独特的工作任务，前十项占总数的 24%，这一比例从 2025 年 1 月的 21% 稳步上升。更具体地说，计算机和数学任务继续主导 Claude 的使用：它们约占 Claude.ai 所有对话的三分之一，以及 API 流量的近一半。

Second, our new report finds that augmentation (52% of conversations) has overtaken automation (45%) as the most popular pattern of interaction with Claude on [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4). This is a reversal of what we saw in our August sample (when automation led by 49% to 47%), but, when we assess this question over a longer time-frame, we still see a slow rise in _automation_'s share of tasks: augmentation led by 55% to 41% in January of last year, and by 55% to 42% in March.
其次，我们的新报告发现，增强型（augmentation，52% 的对话）已超越自动化型（automation，45%），成为在 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) 上与 Claude 交互最受欢迎的模式。这与我们在 8 月样本中看到的情况相反（当时自动化型以 49% 对 47% 领先），但当我们在更长时间框架内评估这一问题时，我们仍然看到_自动化型_任务份额的缓慢上升：去年 1 月增强型以 55% 对 41% 领先，3 月以 55% 对 42% 领先。

Third, our latest analysis shows that the geographic concentration of AI use (as we [discussed last time](https://www.anthropic.com/research/economic-index-geography)) remains evident. The US, India, Japan, the UK, and South Korea still lead in overall Claude.ai use, and adoption remains well-explained by GDP per capita. That said, in the US, we've observed greater changes: Claude use has become noticeably more evenly distributed across US states. In fact, if this trend was sustained, our model predicts that Claude use would be equalized across the country within two to five years. We discuss this model in more detail [in the report](https://www.anthropic.com/research/anthropic.com/research/anthropic-economic-index-january-2026-report).
第三，我们的最新分析表明，AI 使用的地理集中度（如我们[上次讨论](https://www.anthropic.com/research/economic-index-geography)的）仍然显著。美国、印度、日本、英国和韩国仍在 Claude.ai 整体使用量上领先，而采用率仍然能够用人均 GDP 很好地解释。尽管如此，在美国，我们观察到更大的变化：Claude 使用在各州的分布明显更加均匀。事实上，如果这一趋势持续，我们的模型预测 Claude 使用将在两到五年内在全国实现均等化。我们在[报告](https://www.anthropic.com/research/anthropic.com/research/anthropic-economic-index-january-2026-report)中对这一模型进行了更详细的讨论。

## **Conclusion**
> **结论**

The most immediate conclusion from our latest Economic Index report is that the impact of AI on the global workforce remains a highly uneven one: AI use remains concentrated in specific countries and occupations, and it affects some occupations in a very different way to others, as the evidence on task coverage suggests.
我们最新经济指数报告最直接的结论是，AI 对全球劳动力的影响仍然是高度不均匀的：AI 使用仍然集中在特定国家和职业中，而且它对某些职业的影响方式与其他职业截然不同，这一点从任务覆盖率的证据中可以看出。

More generally, this report has given us a new baseline against which to compare our future surveys. As Claude improves, we expect it'll be asked to take on harder tasks, and that it'll likely find greater success. We also expect that tasks might move from [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) to the API (that is, from predominantly consumers to predominantly businesses) as they become more reliable—and if this happens, it'll give us another possible indication of coming economic impacts, given the importance of business adoption for AI's effect on productivity. Through our primitives, we'll be able to measure how changes like these are beginning to impact real-world outcomes, including the nature of people's work, and which people (and where) are likely to be most affected during this period of rapid technological transition.
更广泛地说，本报告为我们提供了一条新的基准线，可用于与未来的调查进行比较。随着 Claude 的改进，我们预计它将被要求承担更难的任务，并且可能取得更大的成功。我们还预计，随着任务变得更加可靠，任务可能从 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) 迁移到 API（即从主要是消费者迁移到主要是企业）——如果发生这种情况，鉴于企业采用对 AI 生产力影响的重要性，这将为我们提供另一个即将到来的经济影响的可能指示。通过我们的基元，我们将能够衡量此类变化如何开始影响真实世界的结果，包括人们工作的本质，以及在这段快速技术变革时期，哪些人（以及在哪里）最可能受到最大影响。

In the meantime, researchers, journalists, and the public can use our data to inform their own research and thinking, and to provide an empirical foundation for the potential policy responses we might need. For much more detail on each of the areas we've discussed above, see our [full report](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report).
与此同时，研究人员、记者和公众可以使用我们的数据来为他们自己的研究和思考提供依据，并为我们可能需要的潜在政策回应提供实证基础。有关我们上面讨论的每个领域的更多详情，请参阅我们的[完整报告](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report)。
