Title: Labor market impacts of AI: A new measure and early evidence

URL Source: https://www.anthropic.com/research/labor-market-impacts

Markdown Content:
## Key findings
> **主要发现**

*   We introduce a new measure of AI displacement risk, _observed exposure_, that combines theoretical LLM capability and real-world usage data, weighting automated (rather than augmentative) and work-related uses more heavily｜我们引入了一种新的AI替代风险衡量指标——_观测暴露度_（observed exposure），它结合了大型语言模型（LLM）的理论能力和实际使用数据，对自动化（而非增强性）和工作相关的使用赋予更高权重。
*   AI is far from reaching its theoretical capability: actual coverage remains a fraction of what's feasible｜AI远未达到其理论能力：实际覆盖率仍然只是可行覆盖率的一小部分。
*   Occupations with higher observed exposure are projected by the BLS to grow less through 2034｜观测暴露度较高的职业，根据美国劳工统计局（BLS）预测，到2034年增长将较少。
*   Workers in the most exposed professions are more likely to be older, female, more educated, and higher-paid｜暴露度最高职业的从业者更可能是年龄较大、女性、受教育程度更高、薪酬更高的群体。
*   We find no systematic increase in unemployment for highly exposed workers since late 2022, though we find suggestive evidence that hiring of younger workers has slowed in exposed occupations｜自2022年底以来，我们未发现高暴露度从业者的失业率出现系统性上升，但我们发现了初步证据表明暴露度较高职业的年轻从业者招聘有所放缓。

## Introduction
> **引言**

The rapid diffusion of AI is generating a wave of research measuring and forecasting its impacts on labor markets. But the track record of past approaches gives reason for humility.
AI的快速扩散正在催生一波衡量和预测其劳动力市场影响的研究。但过去方法的历史记录足以令人保持谦逊。

For example, a prominent attempt to measure job offshorability identified roughly a quarter of US jobs as vulnerable, but a decade on, most of those jobs maintained healthy employment growth. The government's own occupational growth forecasts, while directionally correct, have added little predictive value beyond linear extrapolation of past trends. Even in hindsight, the impact of major economic disruptions on the labor market is often unclear. Studies on the employment effects of industrial robots reach opposing conclusions, and the scale of job losses attributed to the China trade shock continues to be debated.1
例如，一项衡量工作可离岸性的重要尝试将大约四分之一的美国工作识别为脆弱，但十年后，大多数这些工作保持了健康的就业增长。政府自身的职业增长预测，虽然方向正确，但在过去趋势的线性外推之外几乎没有增加预测价值。即便事后来看，重大经济冲击对劳动力市场的影响也常常不甚清晰。关于工业机器人就业效应的研究得出了相互对立的结论，而归因于中国贸易冲击的就业损失规模至今仍有争议。

In this paper, we present a new framework for understanding AI's labor market impacts, and test it against early data, finding limited evidence that AI has affected employment to date. Our goal is to establish an approach for measuring how AI is affecting employment, and to revisit these analyses periodically. This approach won't capture every channel through which AI could reshape the labor market, but by laying this groundwork now, before meaningful effects have emerged, we hope future findings will more reliably identify economic disruption than post-hoc analyses.
在本文中，我们提出了一个理解AI劳动力市场影响的新框架，并用早期数据对其进行了检验，发现AI迄今为止影响就业的证据有限。我们的目标是建立一种衡量AI如何影响就业的方法，并定期重新审视这些分析。这种方法不会捕捉AI可能重塑劳动力市场的每一个渠道，但通过在有意义的影响出现之前现在就打下基础，我们希望未来的发现能比事后分析更可靠地识别经济冲击。

It is possible that the impacts of AI will be unmistakable. This framework is most useful when the effects are ambiguous—and could help identify the most vulnerable jobs before displacement is visible.
AI的影响可能是显而易见的。当影响不明确时，这个框架最为有用——并且可以在替代现象可见之前帮助识别最脆弱的工作。

## Counterfactuals
> **反事实推断**

Causal inference is easier when the effects are large and sudden. The COVID-19 pandemic and accompanying policy measures caused economic disruption so stark that sophisticated statistical approaches were unnecessary for many questions. For example, unemployment jumped sharply in the early weeks of the pandemic, leaving little room for alternative explanations.
当影响巨大且突然时，因果推断更容易进行。新冠疫情及其伴随的政策措施造成了如此显著的经济冲击，以至于对于许多问题，复杂的统计方法是不必要的。例如，疫情初期几周内失业率急剧上升，几乎没有留下替代性解释的空间。

The impacts of AI, however, might be less like COVID and more like the internet or trade with China. The effects may not be immediately clear from aggregate unemployment data; factors like trade policy and the business cycle could cloud interpretations of trend lines.
然而，AI的影响可能不像新冠疫情那样，而更像互联网或对华贸易。从总体失业数据中可能无法立即看清影响；贸易政策和商业周期等因素可能会使趋势线的解读变得模糊。

One common approach is to compare outcomes between more or less AI-exposed workers, firms, or industries, in order to isolate the effect of AI from confounding forces.2 Exposure is typically defined at the task level: AI can grade homework but not manage a classroom, for example, so teachers are considered less exposed than workers whose entire job can be performed remotely.
一种常见的方法是比较AI暴露程度高低不同的工人、企业或行业之间的结果，以便从混淆力量中分离出AI的影响。暴露度通常在任务层面定义：例如，AI可以批改作业但不能管理课堂，所以教师被认为比那些整个工作可以远程完成的工人暴露度更低。

Our work follows this task-based approach, incorporating measures of theoretical AI capability and real-world usage, before aggregating to occupations.3
我们的工作遵循这种基于任务的方法，在聚合到职业层面之前，纳入了AI理论能力和实际使用情况的衡量指标。

## Measuring exposure
> **衡量暴露度**

Our approach combines data from three sources.
我们的方法结合了来自三个来源的数据。

1.   The [O*NET database](https://www.onetcenter.org/database.html), which enumerates tasks associated with around 800 unique occupations in the US.｜O*NET数据库，该数据库列举了美国约800个独特职业相关的任务。
2.   Our own usage data (as measured in the [Anthropic Economic Index](https://www.anthropic.com/economic-index)).｜我们自己的使用数据（如Anthropic经济指数所衡量的）。
3.   Task-level exposure estimates from Eloundou et al. (2023), which measure whether it is theoretically possible for an LLM to make a task at least twice as fast.｜来自Eloundou等人（2023）的任务级暴露度估计，该估计衡量LLM是否在理论上可以将一项任务的速度提高至少两倍。

Eloundou et al.'s metric, β, scores tasks on a simple scale: 1 if a task can be doubled in speed by an LLM alone, 0.5 if it requires additional tools or software built on top of the LLM, and 0 otherwise.4
Eloundou等人的指标β以简单的等级对任务进行评分：如果一个任务可以单独由LLM将速度提高一倍，则为1；如果需要在LLM之上构建的额外工具或软件，则为0.5；否则为0。

Why might actual usage fall short of theoretical capability? Some tasks that are theoretically possible may not show up in usage because of model limitations. Others may be slow to diffuse due to legal constraints, specific software requirements, human verification steps, or other hurdles. For example, Eloundou et al. mark "Authorize drug refills and provide prescription information to pharmacies" as fully exposed (β=1). We have not observed Claude performing this task, although the assessment seems correct in that it could theoretically be sped up by an LLM.
实际使用为何可能低于理论能力？一些理论上可能的任务可能因为模型局限而未在使用中出现。其他任务可能由于法律限制、特定软件要求、人工验证步骤或其他障碍而缓慢扩散。例如，Eloundou等人将"授权药物补充并向药房提供处方信息"标记为完全暴露（β=1）。我们没有观察到Claude执行这项任务，尽管这一评估看起来是正确的，因为它理论上可以被LLM加速。

That said, these measures of theoretical capability and actual usage are highly correlated. As Figure 1 shows, 97% of the tasks observed across the previous four Economic Index reports fall into categories rated as theoretically feasible by Eloundou et al. (β=0.5 or β=1.0).
尽管如此，这些理论能力和实际使用的衡量指标高度相关。如图1所示，在之前四份经济指数报告中观察到的97%的任务属于Eloundou等人评为理论上可行的类别（β=0.5或β=1.0）。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F9d205667455ef8b78e8cbb407b6bd76556a7d859-4584x2579.png&w=3840&q=75)

**Figure 1: Share of Claude usage by Eloundou et al. task exposure rating**This figure shows Claude usage distributed across O*NET tasks grouped by their theoretical AI exposure. Tasks rated β=1 (fully feasible for an LLM alone) account for 68% of observed Claude usage, while tasks rated β=0 (not feasible) account for just 3%. Data on Claude usage comes from the previous four Economic Index reports.
**图1：按Eloundou等人任务暴露度评级划分的Claude使用份额**本图显示了按理论AI暴露度分组的O*NET任务中Claude使用量的分布。评级为β=1（单独由LLM完全可行）的任务占观察到的Claude使用量的68%，而评级为β=0（不可行）的任务仅占3%。Claude使用数据来自之前四份经济指数报告。

### A new measure of occupational exposure
> **职业暴露度的新衡量指标**

Our new measure, _observed exposure_, is meant to quantify: of those tasks that LLMs could theoretically speed up, which are actually seeing automated usage in professional settings? Theoretical capability encompasses a much broader range of tasks. By tracking how that gap narrows, observed exposure provides insight into economic changes as they emerge.
我们的新指标——_观测暴露度_——旨在量化：在LLM理论上可以加速的那些任务中，哪些实际上在专业环境中看到了自动化使用？理论能力涵盖了更广泛的任务范围。通过追踪这一差距如何缩小，观测暴露度提供了关于经济变化在其出现时的洞察。

Our measure qualitatively captures several aspects of AI usage that we think are predictive of job impacts. A job's exposure is higher if:
我们的指标定性地捕捉了我们认为预测工作影响的AI使用的几个方面。如果以下条件成立，一个工作的暴露度更高：

*   Its tasks are theoretically possible with AI｜其任务在理论上可以用AI完成
*   Its tasks see significant usage in the Anthropic Economic Index 5｜其任务在Anthropic经济指数中有显著的使用量
*   Its tasks are performed in work-related contexts｜其任务在与工作相关的情境中执行
*   It has a relatively higher share of automated use patterns or API implementation｜它有相对较高的自动化使用模式或API实现份额
*   Its AI-impacted tasks make up a larger share of the overall role 6｜其受AI影响的任务在整体职业中占据更大份额

We give mathematical details in the [Appendix](https://cdn.sanity.io/files/4zrzovbb/website/e5f77fc0e77c0185110b5e4b909602791ae76eae.pdf). We count tasks that are theoretically capable with an LLM as covered if they have seen sufficient work-related usage in Claude traffic. We then adjust for how the task is being carried out: fully automated implementations receive full weight, while augmentative use receives half weight. Finally, the task-level coverage measures are averaged to the occupation level weighted by the fraction of time spent on each task.
我们在附录中给出了数学细节。我们将LLM理论上能够完成的任务计为已覆盖，条件是它们在Claude流量中已经看到足够的工作相关使用量。然后我们根据任务的执行方式进行调整：完全自动化的实现获得全权重，而增强性使用获得半权重。最后，任务级覆盖度指标按每项任务花费的时间比例加权平均到职业层面。

Figure 2 shows observed exposure (in red) compared to β from Eloundou et al. (in blue), illustrating the difference between theoretical and actual use on our platform, grouped by broad occupational categories. We calculate this by first averaging to the occupation level weighting by our time fraction measure, then averaging to the occupation category weighting by total employment. For example, the β measure shows scope for LLM penetration in the majority of tasks in Computer & Math (94%) and Office & Admin (90%) occupations.
图2显示了观测暴露度（红色）与Eloundou等人的β（蓝色）的比较，说明了我们平台上理论与实际使用之间的差异，按广泛的职业类别分组。我们的计算方式是首先按我们的时间比例指标加权平均到职业层面，然后按总就业量加权平均到职业类别。例如，β指标显示LLM在计算机与数学（94%）和办公室与行政（90%）职业的大多数任务中具有渗透空间。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fc1952c81bca02a7c8cc05ef7801e67ca60831c55-4096x4096.png&w=3840&q=75)

**Figure 2: Theoretical capability and observed exposure by occupational category**Share of job tasks that LLMs could theoretically perform (blue area) and our own job coverage measure derived from usage data (red area).
**图2：按职业类别划分的理论能力与观测暴露度**LLM理论上可以执行的工作任务份额（蓝色区域）以及我们从使用数据得出的工作覆盖度指标（红色区域）。

The red area, depicting LLM use from the Anthropic Economic Index, shows how people are using Claude in professional settings. The coverage shows AI is far from reaching its theoretical capabilities. For instance, Claude currently covers just 33% of all tasks in the Computer & Math category.
红色区域描绘了来自Anthropic经济指数的LLM使用情况，显示了人们在专业环境中如何使用Claude。覆盖度表明AI远未达到其理论能力。例如，Claude目前仅覆盖计算机与数学类别中所有任务的33%。

As capabilities advance, adoption spreads, and deployment deepens, the red area will grow to cover the blue. There is a large uncovered area too; many tasks, of course, remain beyond AI's reach—from physical agricultural work like pruning trees and operating farm machinery to legal tasks like representing clients in court.
随着能力进步、采用扩散和部署深化，红色区域将扩大以覆盖蓝色区域。也存在大量未覆盖区域；当然，许多任务仍然超出AI的能力范围——从修剪树木和操作农业机械等体力农业工作，到在法庭上代理客户等法律任务。

Figure 3 shows the ten occupations most exposed under this measure. In line with other data showing that Claude is extensively used for coding, Computer Programmers are at the top, with 75% coverage, followed by Customer Service Representatives, whose main tasks we increasingly see in first-party API traffic. Finally, Data Entry Keyers, whose primary task of reading source documents and entering data sees significant automation, are 67% covered.
图3显示了在这一指标下暴露度最高的十个职业。与其他显示Claude被广泛用于编码的数据一致，计算机程序员位居榜首，覆盖率为75%，其次是客户服务代表，其主要任务我们越来越多地在第一方API流量中看到。最后，数据录入员的主要任务——读取原始文件并录入数据——被显著自动化，覆盖率为67%。

![Image 3](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fa16a5b9ba4a5280ef41e058dff6964a3f116c854-4584x2579.png&w=3840&q=75)

**Figure 3: Most exposed occupations**Top ten most exposed occupations using our task coverage measure.
**图3：暴露度最高的职业**使用我们的任务覆盖度指标排名前十的暴露度最高职业。

At the bottom end, 30% of workers have zero coverage, as their tasks appeared too infrequently in our data to meet the minimum threshold. This group includes, for example, Cooks, Motorcycle Mechanics, Lifeguards, Bartenders, Dishwashers, and Dressing Room Attendants.
在最低端，30%的工人覆盖率为零，因为他们的任务在我们的数据中出现太少，无法达到最低阈值。这一群体包括厨师、摩托车修理工、救生员、调酒师、洗碗工和更衣室服务员等。

## **How exposure tracks with projected job growth and worker characteristics**
> **暴露度与预期就业增长及从业者特征的关联**

The US Bureau of Labor Statistics (BLS) publishes regular employment projections, with the latest set, published in 2025, covering [predicted](https://data.bls.gov/projections/occupationProj) changes in employment for every occupation from 2024 to 2034. In Figure 4, we compare our job-level coverage measure to their predictions.
美国劳工统计局（BLS）定期发布就业预测，最新一套于2025年发布，涵盖2024年至2034年每个职业就业变化的预测。在图4中，我们将我们的职业级覆盖度指标与其预测进行比较。

A regression at the occupation level weighted by current employment finds that growth projections are somewhat weaker for jobs with more observed exposure. For every 10 percentage point increase in coverage, the BLS's growth projection drops by 0.6 percentage points. This provides some validation in that our measures track the independently derived estimates from labor market analysts, although the relationship is slight. Interestingly, there is no such correlation using the Eloundou et al. measure alone.
按当前就业量加权的职业级回归发现，观测暴露度较高的职业增长预测略显疲弱。覆盖率每增加10个百分点，BLS的增长预测下降0.6个百分点。这提供了一定程度的验证，表明我们的指标追踪了劳动力市场分析师独立得出的估计，尽管关系并不显著。有趣的是，单独使用Eloundou等人的指标时并不存在这种相关性。

![Image 4](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F4da91f7eeb62c2c7b09600282c9163f6bdf0d5ca-4584x2579.png&w=3840&q=75)

**Figure 4: BLS projected employment growth from 2024—2034 vs. observed exposure**Binned scatterplot with 25 equally-sized bins. Each solid dot shows the average observed exposure and projected employment change for one of the bins. The dashed line shows a simple linear regression fit, weighted by current employment levels. The small diamonds mark individual example occupations for illustration.
**图4：2024-2034年BLS预测就业增长与观测暴露度的关系**包含25个等大小分箱的分箱散点图。每个实心点显示一个分箱的平均观测暴露度和预测就业变化。虚线显示按当前就业水平加权的简单线性回归拟合。小菱形标记个别示例职业以供说明。

Figure 5 shows characteristics of workers in the top quartile of exposure and the 30% of workers with zero exposure in the three months before ChatGPT was released, August to October 2022, using data from the Current Population Survey.7 The groups are very different. The more exposed group is 16 percentage points more likely to be female, 11 percentage points more likely to be white, and almost twice as likely to be Asian. They earn 47% more, on average, and have higher levels of education. For example, people with graduate degrees are 4.5% of the unexposed group, but 17.4% of the most exposed group, an almost fourfold difference.
图5显示了在ChatGPT发布前三个月（2022年8月至10月），使用当前人口调查（Current Population Survey）数据，暴露度最高四分位数的从业者和30%零暴露度从业者的特征。这两组差异显著。高暴露度组更可能是女性（高16个百分点）、白人（高11个百分点），亚裔的可能性几乎是两倍。他们平均收入高47%，教育水平也更高。例如，拥有研究生学位的人占未暴露组的4.5%，但占暴露度最高组的17.4%，差距近四倍。

![Image 5](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fff251060d019f4fdf6579df08aaf61e94b4c2d27-4584x2579.png&w=3840&q=75)

**Figure 5: Differences between high and low exposure workers, Current Population Survey**
**图5：高暴露度与低暴露度从业者之间的差异，当前人口调查**

## Prioritizing outcomes
> **优先考量的结果指标**

With these exposure measures in hand, the question is what to look for. Researchers have taken different approaches. For example, Gimbel et al. (2025) track changes in the occupational mix using the Current Population Survey. Their argument is that any important restructuring of the economy from AI would show up as changes in distribution of jobs.¹ (They find that, so far, changes have been unremarkable.) Brynjolfsson et al. (2025) look at employment levels split by age group using data from the payroll processing firm ADP, while Acemoglu et al. (2022) and Hampole et al. (2025) use job posting data from Burning Glass (now Lightcast) and Revelio, respectively.
有了这些暴露度指标，问题在于要寻找什么。研究人员采取了不同的方法。例如，Gimbel等人（2025）使用当前人口调查追踪职业构成的变化。他们的论点是，AI对经济的任何重要重组都会在工作分布的变化中体现出来。（他们发现，迄今为止，变化并不显著。）Brynjolfsson等人（2025）使用薪资处理公司ADP的数据研究按年龄组划分的就业水平，而Acemoglu等人（2022）和Hampole等人（2025）分别使用Burning Glass（现为Lightcast）和Revelio的招聘数据。

We focus on unemployment as our priority outcome because it most directly captures the potential for economic harm—a worker who is unemployed wants a job and has not yet found one. In this case, job postings and employment do not necessarily signal the need for policy responses; a decline in job postings for a highly exposed role may be counteracted by increased openings in a related one. Most harmful labor market developments of AI should arguably include a period of increased unemployment, as displaced workers search for alternatives. The Current Population Survey is well suited to tracking this, as unemployed respondents report their previous job and industry.
我们将失业率作为优先考量的结果指标，因为它最直接地捕捉了经济损害的潜力——一个失业的工人想要工作但尚未找到。在这种情况下，招聘信息和就业水平并不一定预示政策回应的必要性；高暴露度职业招聘信息的减少可能被相关职业招聘机会的增加所抵消。AI对劳动力市场的大多数有害影响应该包括失业率上升的时期，因为被替代的工人在寻找替代方案。当前人口调查非常适合追踪这一点，因为失业受访者会报告他们之前的工作和行业。

## Initial results
> **初步结果**

We next study trends in unemployment, matching our occupation-level measures to respondents in the Current Population Survey.
我们接下来研究失业趋势，将我们的职业级指标与当前人口调查的受访者进行匹配。

A key question in interpreting our coverage measure is which workers should be considered treated? Should changes in employment be expected from just 10% task coverage? Gans and Goldfarb (2025) show that if an O-ring model best describes jobs, employment effects might be seen only when all tasks have some degree of AI penetration. Hampole et al. (2025) argue that mean exposure decreases labor demand, but _concentration_ of exposure in only certain tasks can counteract this. And Autor and Thompson (2025) highlight the level of expertise required for the remaining tasks.
解释我们的覆盖度指标的一个关键问题是哪些工人应该被视为受处理的？仅有10%的任务覆盖率就应该期待就业变化吗？Gans和Goldfarb（2025）表明，如果O型圈模型最好地描述了工作，只有当所有任务都有一定程度的AI渗透时，就业效应才可能显现。Hampole等人（2025）认为平均暴露度降低劳动力需求，但暴露度_集中_在某些任务上可以抵消这一点。Autor和Thompson（2025）则强调了剩余任务所需的专业知识水平。

With an eye toward simplicity, and noting that we are most concerned with large impacts, we center our analysis on the idea that impacts should be felt most in the groups with the highest mean exposure. We compare workers in the top quartile of time-weighted task coverage to those in the bottom. If AI capabilities advance quickly, task coverage might be high for lower percentiles of coverage, which might make an absolute threshold more helpful. But we make the assumption that impacts should affect the most exposed workers first, and present results varying the cutoff we use to define treatment.
着眼于简洁性，并注意到我们最关注的是重大影响，我们将分析集中在这一思路上：影响应该在平均暴露度最高的群体中感受最强烈。我们将时间加权任务覆盖度最高四分位数的工人与最低四分位数的工人进行比较。如果AI能力快速进步，较低百分位数的覆盖度可能变高，这可能使绝对阈值更有帮助。但我们假设影响应该首先影响暴露度最高的工人，并呈现我们用来定义处理的截止点变化的结果。

The upper panel of Figure 6 shows raw trends in the unemployment rate since 2016 for workers in the top quartile of exposure and the unexposed group. During COVID, the less AI-exposed workers—who are more likely to have in-person jobs—saw a much larger increase in unemployment. Since then, the trends have been largely similar between the two groups. The lower panel measures the size of the gap between the most and least exposed workers in a difference-in-differences framework, mirroring the findings from the raw data. The average change in the gap since the release of ChatGPT is small and insignificant, suggesting that the unemployment rate of the more exposed group has increased slightly but the effect is indistinguishable from zero.8
图6上图显示了2016年以来暴露度最高四分位数工人和未暴露组工人失业率的原始趋势。在新冠疫情期间，AI暴露度较低的工人——他们更可能拥有现场工作——失业率上升幅度大得多。自此以后，两组的趋势基本相似。下图在双重差分框架中衡量暴露度最高和最低工人之间差距的大小，反映了原始数据的发现。自ChatGPT发布以来差距的平均变化很小且不显著，表明高暴露度组的失业率略有上升，但效果与零无法区分。

![Image 6](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fe4cf7bf0364758fe1bfbb7b915c8f1db6d7bd4d4-4584x2579.png&w=3840&q=75)

**Figure 6: Trends in the unemployment rate for workers in the top quartile of observed exposure and no AI exposure, Current Population Survey**The top panel shows the unemployment rate for workers in the top quartile of exposure (red line) and the 30% of workers with zero exposure. The bottom panel measures the gap between these two series in a difference-in-differences framework.
**图6：观测暴露度最高四分位数工人和零AI暴露度工人失业率趋势，当前人口调查**上图显示暴露度最高四分位数工人（红线）和30%零暴露度工人的失业率。下图在双重差分框架中衡量这两个序列之间的差距。

What kind of scenarios can this framework identify? Based on the confidence interval of the pooled estimate, differential increases in unemployment on the order of 1 percentage point would be detectable (this will change as new data comes in, so it is merely a ballpark estimate). If all workers within the top 10% were laid off, it would increase unemployment within the top quartile group from 3% to 43%, and it would increase aggregate unemployment from 4% to 13%.
这个框架能够识别什么样的情景？根据汇总估计的置信区间，约1个百分点的失业率差异性上升将是可检测的（随着新数据的出现这将会变化，所以这只是一个粗略估计）。如果最高10%的所有工人都被裁员，将使最高四分位数组内的失业率从3%上升到43%，并将总体失业率从4%上升到13%。

A smaller but still concerning impact would be a scenario such as a "Great Recession for white-collar workers." During the 2007-2009 Great Recession, unemployment rates doubled from 5% to 10% in the US. Such a doubling in the top quartile of exposure would increase its unemployment rate from 3% to 6%. This should be visible in our analysis as well. Note that our core estimate is based on _differential_ changes in the unemployment rate in the exposed group compared to the less exposed group. If unemployment increased for all workers in parallel, we would not attribute this to AI advancements that still leave many tasks unaffected.
一个较小但仍令人担忧的影响是类似"白领大衰退"的情景。在2007-2009年大衰退期间，美国失业率从5%翻倍至10%。暴露度最高四分位数中出现类似的翻倍，将使其失业率从3%上升到6%。这在我们的分析中应该也是可见的。注意，我们的核心估计基于暴露组与低暴露组相比失业率的_差异性_变化。如果所有工人的失业率同步上升，我们不会将此归因于仍使许多任务不受影响的AI进步。

One group of particular concern is young workers. Brynjolfsson et al. report a 6—16% fall in employment in exposed occupations among workers aged 22 to 25. They attribute this decrease primarily to a slowdown in hiring rather than an increase in separations.9
一个特别值得关注的群体是年轻工人。Brynjolfsson等人报告称，22至25岁工人在暴露职业中就业下降了6-16%。他们将这一下降主要归因于招聘放缓而非离职增加。

We find that the unemployment rate for young workers in the exposed occupations is flat (see [Appendix](https://cdn.sanity.io/files/4zrzovbb/website/e5f77fc0e77c0185110b5e4b909602791ae76eae.pdf)). But slowed hiring may not necessarily manifest as increased unemployment, since many young workers are labor market entrants without a listed occupation in the CPS data and may exit the labor force rather than appear as unemployed. To address hiring directly, we use the panel dimension of the CPS, counting the percent of young (22-25 year old) workers who begin a new job in a more vs. less exposed occupation over time. Figure 7 shows the monthly job finding rate (i.e., when a worker reports a job that they did not have in the previous month) for young workers, split by whether they are entering a high- vs. low-exposure occupation.
我们发现暴露职业中年轻工人的失业率持平（见附录）。但招聘放缓不一定表现为失业率上升，因为许多年轻工人是劳动力市场的新进入者，在CPS数据中没有列出职业，可能退出劳动力市场而非表现为失业。为了直接处理招聘问题，我们使用CPS的面板维度，计算随时间推移进入高vs低暴露职业的年轻（22-25岁）工人开始新工作的百分比。图7显示了年轻工人的月度求职成功率（即当工人报告一份他们上个月没有的工作时），按他们是否进入高vs低暴露职业分组。

![Image 7](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F1e4020e4312e8eeb4601f542a96cb238234f6c8b-4584x2579.png&w=3840&q=75)

**Figure 7: New job starts among workers age 22-25 in occupations with high observed exposure and no AI exposure, Current Population Survey**The top panel shows the percent of young workers starting new jobs in high vs. no exposure occupations. The bottom panel measures the gap between these two series in a difference-in-differences framework.
**图7：22-25岁工人在高观测暴露度和零AI暴露度职业中的新工作开始情况，当前人口调查**上图显示进入高vs零暴露度职业的年轻工人开始新工作的百分比。下图在双重差分框架中衡量这两个序列之间的差距。

Apart from some large swings in 2020-2021, these series visually diverge in 2024, with young workers relatively less likely to be hired into exposed occupations. Job finding rates at the less exposed occupations remain stable at 2% per month, while entry into the most exposed jobs decreases by about half a percentage point. The averaged estimate in the post-ChatGPT era is a 14% drop in the job finding rate compared to that in 2022 in the exposed occupations, although this is just barely statistically significant. (There is no such decrease for workers older than 25.)
除了2020-2021年的一些大幅波动外，这些序列在2024年出现了明显的分化，年轻工人进入暴露职业的可能性相对较低。低暴露度职业的求职成功率保持稳定在每月2%，而进入暴露度最高工作的比率下降了约半个百分点。后ChatGPT时代的平均估计是暴露职业的求职成功率比2022年下降了14%，尽管这在统计上刚刚显著。（25岁以上的工人没有此类下降。）

This may provide some signal of the early effects of AI on employment, and echoes the findings from Brynjolfsson et al. But there are several alternative interpretations. The young workers who are not hired may be remaining at their existing jobs, taking different jobs, or returning to school. A further data-related caveat is that job transitions may be more vulnerable to mismeasurement in surveys.10
这可能提供了AI对就业早期影响的一些信号，并与Brynjolfsson等人的发现相呼应。但有几种替代性解释。未被录用的年轻工人可能留在现有工作中、从事不同的工作，或返校学习。另一个与数据相关的警告是，职业过渡在调查中可能更容易被错误衡量。

## Discussion
> **讨论**

This report introduces a new measure for understanding the labor market effects of AI and studies impacts on unemployment and hiring. Jobs are more exposed to AI to the extent that their tasks are theoretically feasible with LLMs and observed on our platforms in automated, work-related use cases. We find that computer programmers, customer service representatives, and financial analysts are among the most exposed. Using survey data from the US, we find no impact on unemployment rates for workers in the most exposed occupations, although there's tentative evidence that hiring into those professions has slowed slightly for workers aged 22-25.
本报告引入了一种新的衡量AI劳动力市场效应的指标，并研究了对失业和招聘的影响。工作对AI的暴露程度越高，其任务在理论上越容易用LLM完成，并在我们的平台上以自动化、与工作相关的使用场景中被观察到。我们发现计算机程序员、客户服务代表和财务分析师是暴露度最高的职业之一。使用美国的调查数据，我们发现暴露度最高职业的工人失业率没有受到影响，尽管有初步证据表明22-25岁工人进入这些职业的招聘略有放缓。

Our work is a first step toward cataloging the impact of AI on the labor market. We hope that the analytical steps taken in this report, especially around coverage and counterfactuals, will be easy to update as new data on employment and AI usage emerge. An established approach may help future observers separate signal from noise.
我们的工作是记录AI对劳动力市场影响的第一步。我们希望本报告中采取的分析步骤，特别是围绕覆盖度和反事实推断的部分，随着就业和AI使用新数据的出现将易于更新。一个既定的方法可能有助于未来的观察者将信号与噪声分离。

There are several improvements to be made to the present work. Our usage data will be incorporated in future updates, forming an evolving picture of task and job coverage in the economy. The Eloundou et al. metric could also be updated, to the extent that it is linked to LLM capabilities as of early 2023. And, given the suggestive results around young workers and labor market entrants, a key next step might be to look at how recent graduates with educational credentials in exposed areas are navigating the labor market.
本工作还有几处可以改进。我们的使用数据将被纳入未来的更新中，形成经济中任务和工作覆盖情况的演进图景。Eloundou等人的指标也可以更新，因为它与截至2023年初的LLM能力相关联。此外，鉴于围绕年轻工人和劳动力市场新进入者的初步结果，一个关键的下一步可能是研究拥有暴露领域教育资质的应届毕业生如何在劳动力市场中找到出路。

## Appendix

Available [here.](https://cdn.sanity.io/files/4zrzovbb/website/e5f77fc0e77c0185110b5e4b909602791ae76eae.pdf)

### Acknowledgements

Written by Maxim Massenkoff and Peter McCrory.

With acknowledgements to: Ruth Appel, Tim Belonax, Keir Bradwell, Andy Braden, Dexter Callender III, Miriam Chaum, Madison Clark, Jake Eaton, Deep Ganguli, Kunal Handa, Ryan Heller, Lara Karadogan, Jennifer Martinez, Jared Mueller, Sarah Pollack, David Saunders, Carl De Torres, Kim Withee, and Jack Clark.

We additionally thank Martha Gimbel, Anders Humlum, Evan Rose, and Nathan Wilmers for feedback on earlier versions of this report.

### Citation

```
@online{massenkoffmccrory2026labor,
 author = {Maxim Massenkoff and Peter McCrory},
 title = {Labor market impacts of AI: A new measure and early evidence},
 date = {2026-03-05},
 year = {2026},
 url = {https://www.anthropic.com/research/labor-market-impacts},
}
```

## References

Acemoglu, Daron and Pascual Restrepo, "Robots and Jobs: Evidence from US Labor Markets," _Journal of Political Economy_, 2020, 128 (6), 2188–2244.

Acemoglu, Daron, David Autor, Jonathon Hazell, and Pascual Restrepo, "Artificial intelligence and jobs: Evidence from online vacancies," _Journal of Labor Economics_, 2022, 40 (S1), S293–S340.

Appel, Ruth, Maxim Massenkoff, Peter McCrory, Miles McCain, Ryan Heller, Tyler Neylon, and Alex Tamkin, "Anthropic Economic Index report: economic primitives," 2026.

Autor, David H, David Dorn, and Gordon H Hanson, "The China syndrome: Local labor market effects of import competition in the United States," _American Economic Review_, 2013, 103 (6), 2121–2168.

Autor, David H, & Thompson, N. (2025). Expertise. NBER Working Paper, (w33941).

Blinder, Alan S et al., "How many US jobs might be offshorable?," _World Economics_, 2009, 10 (2), 41.

Borusyak, Kirill, Peter Hull, and Xavier Jaravel, "Quasi-experimental shift-share research designs," _The Review of Economic Studies_, 2022, 89 (1), 181–213.

Brynjolfsson, Erik, Bharat Chandar, and Ruyu Chen, "Canaries in the coal mine? six facts about the recent employment effects of artificial intelligence," _Digital Economy_, 2025.

Eckhardt, Sarah and Nathan Goldschlag, "AI and Jobs: The Final Word (Until the Next One)," Economic Innovation Group (EIG), August 2025. Available at: [https://eig.org/ai-and-jobs-the-final-word/](https://eig.org/ai-and-jobs-the-final-word/)

Eloundou, Tyna, Sam Manning, Pamela Mishkin, and Daniel Rock, "Gpts are gpts: An early look at the labor market impact potential of large language models," arXiv preprint arXiv:2303.10130, 2023, 10.

Fujita, S., Moscarini, G., & Postel-Vinay, F. (2024). Measuring employer-to-employer reallocation. _American Economic Journal: Macroeconomics_, 16(3), 1-51.

Gans, Joshua S. and Goldfarb, Avi, "O-Ring Automation," NBER Working Paper No. 34639, December 2025. Available at SSRN: [https://ssrn.com/abstract=5962594](https://ssrn.com/abstract=5962594)

Gimbel, Martha, Molly Kinder, Joshua Kendall, and Maddie Lee, "Evaluating the Impact of AI on the Labor Market: Current State of Affairs," Research Report, The Budget Lab at Yale, New Haven, CT October 2025. Available at: [https://budgetlab.yale.edu](https://budgetlab.yale.edu/).

Graetz, Georg and Guy Michaels, "Robots at Work," _Review of Economics and Statistics_, 2018, 100 (5), 753–768.

Hampole, Menaka, Dimitris Papanikolaou, Lawrence DW Schmidt, and Bryan Seegmiller, "Artificial intelligence and the labor market," Technical Report, National Bureau of Economic Research 2025.

Handa, Kunal, Alex Tamkin, Miles McCain, Saffron Huang, Esin Durmus, Sarah Heck, Jared Mueller, Jerry Hong, Stuart Ritchie, Tim Belonax, Kevin K. Troy, Dario Amodei, Jared Kaplan, Jack Clark, and Deep Ganguli, "Which Economic Tasks are Performed with AI? Evidence from Millions of Claude Conversations," 2025.

Hui, Xiang, Oren Reshef, and Luofeng Zhou, "The short-term effects of generative artificial intelligence on employment: Evidence from an online labor market," _Organization Science_, 2024, 35 (6), 1977–1989.

Johnston, Andrew and Christos Makridis, "The labor market effects of generative AI: A difference-in-differences analysis of AI exposure," Available at SSRN 5375017, 2025.

Massenkoff, Maxim, "How predictable is job destruction? Evidence from the Occupational Outlook," 2025. _Working Paper._

Ozimek, Adam, "Overboard on Offshore Fears," 2019. [https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3777307](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3777307)

Tamkin, Alex and Peter McCrory, "Estimating AI productivity gains from Claude conversations," 2025.

Tomlinson, K., Jaffe, S., Wang, W., Counts, S., & Suri, S. (2025). Working with AI: measuring the applicability of generative AI to occupations. arXiv preprint arXiv:2507.07935.

## Footnotes

1.   Job offshorability: Blinder et al. (2009) and Ozimek (2019); Government growth forecasts: Massenkoff (2025); Robots: Graetz and Michaels (2018) and Acemoglu and Restrepo (2020); China shock: Autor et al. (2013) and Borusyak et al. (2022).

2.   Brynjolfsson et al. (2025) compare employment trends for workers in more versus less AI-exposed occupations, using the task exposure measures from Eloundou et al. (2023) and payroll data from ADP. Johnston and Makridis (2025) do a similar task-based analysis using US administrative data, but they aggregate treatment to the industry level. Hui et al. (2024) study how freelance jobs on Upwork responded to the release of ChatGPT and advanced image generation tools, comparing workers in directly affected categories to those in unaffected categories before and after each tool's release date. Hampole et al. (2025) instrument for firm-level AI adoption using historical university hiring networks: firms that historically recruited from universities whose graduates later entered AI-related roles faced lower adoption costs.

3.   Our task- and occupation-level exposure measures can readily incorporate other usage data, and be extended to different countries. We intend to apply this methodology to new settings over time.

4.   In their framework, "Directly exposed'" tasks were those that could be completed in half the time with an LLM (with a 2,000-word input limit and no access to recent facts). Tasks that were "exposed with tools" were those subject to the same speedup with an LLM that had access to software for, e.g., information retrieval and image processing. Tasks that were not exposed could not have their duration reduced by 50% or more using an LLM.

5.   We use the previous two Anthropic Economic Index datasets, covering usage from August and November 2025. For ONET tasks that are highly semantically similar, we split the counts across them.

6.   There are judgment calls involved at every step. Should the Eloundou et al. (2023) measure enter as {0, 0.5, 1} or something else? What determines "significant" use? How do we handle tasks which seem very similar to those with high usage, but are too rare to have been picked up specifically in the sampling for the Economic Index? How much more should automation workflows count compared to augmentation? A reassuring finding which we expand on in the Appendix is that the Spearman (rank-rank) correlation of job exposure across many resolutions to these questions is exceedingly high.

7.   To match O*NET-SOC codes to occ1990 codes in the CPS, we use the crosswalk provided by [Eckhart and Goldschlag (2025)](https://eig.org/ai-and-jobs-the-final-word/).

8.   We explore this further in three ways in the [Appendix](https://cdn.sanity.io/files/4zrzovbb/website/e5f77fc0e77c0185110b5e4b909602791ae76eae.pdf). First, we ask whether the percentile cutoff that we use to define treatment matters, varying it from the median to the 95th percentile. In all cases, the impact is flat or negative (meaning that unemployment decreases for the exposed group). Next, we focus on young workers in particular, those aged 22 to 25 as in Brynjolfsson et al. (2025). Finally, we use data on unemployment insurance claimants from the Department of Labor to measure the unemployment, rather than CPS survey responses. In no extension do we find clear impacts on exposed jobs.

9.   This range is wide because the authors provide estimates against multiple counterfactuals. The 6 percentage point drop compares to a counterfactual of flat employment growth. The 16 percentage point estimate comes from a design comparing similar workers in the same firm with different occupations.

10.   See Fujita, et al. (2024).

### Corrections

_Updated Mar 8, 2026: Corrected Figure 7, which incorrectly reversed the labels between top quartile and zero exposure group inflow rates._
