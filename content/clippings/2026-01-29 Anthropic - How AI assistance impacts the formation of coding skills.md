Title: How AI assistance impacts the formation of coding skills

URL Source: https://www.anthropic.com/research/AI-assistance-coding-skills

Markdown Content:
Research shows AI helps people do [parts](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4945566) of their job faster. In an observational [study](https://www.anthropic.com/research/estimating-productivity-gains) of [Claude.ai](http://claude.ai/redirect/website.v1.72c33ff8-4fb7-4f9c-99e8-e489a9b6a757) data, we found AI can speed up some tasks by 80%. But does this increased productivity come with trade-offs? Other research shows that when people use AI assistance, they become [less engaged with their work](https://www.nature.com/articles/s41598-025-98385-2) and [reduce](https://www.microsoft.com/en-us/research/wp-content/uploads/2025/01/lee_2025_ai_critical_thinking_survey.pdf) the effort they put into doing it—in other words, they offload their thinking to AI.
研究表明，AI 能帮助人们更快完成工作中的[部分任务](https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4945566)。在一项针对 [Claude.ai](http://claude.ai/redirect/website.v1.72c33ff8-4fb7-4f9c-99e8-e489a9b6a757) 数据的观察性[研究](https://www.anthropic.com/research/estimating-productivity-gains)中，我们发现 AI 可以将某些任务的完成速度提升 80%。但这种生产力提升是否伴随着代价？其他研究表明，当人们使用 AI 辅助时，他们对工作的[投入度下降](https://www.nature.com/articles/s41598-025-98385-2)，并[减少](https://www.microsoft.com/en-us/research/wp-content/uploads/2025/01/lee_2025_ai_critical_thinking_survey.pdf)了在工作中投入的努力——换句话说，他们将思考过程外包给了 AI。

It's unclear whether this cognitive offloading can prevent people from growing their skills on the job, or—in the case of coding—understanding the systems they're building. Our latest study, a randomized controlled trial with software developers as participants, investigates this potential downside of using AI at work.
目前尚不清楚这种认知外包是否会妨碍人们在工作中提升技能，或者——在编程场景下——阻碍他们理解所构建的系统。我们的最新研究是一项以软件开发者为参与者的随机对照试验，旨在探究在工作中使用 AI 的这一潜在弊端。

This question has broad implications—for how to design AI products that facilitate learning, for how workplaces should approach AI policies, and for broader societal resilience, among others. We focused on coding, a field where AI tools have rapidly become standard. Here, AI creates a potential tension: as coding grows more automated and speeds up work, humans will still need the skills to catch errors, guide output, and ultimately provide oversight for AI deployed in high-stakes environments. Does AI provide a shortcut to _both_ skill development and increased efficiency? Or do productivity increases from AI assistance undermine skill development?
这一问题影响深远——涉及如何设计促进学习的 AI 产品、职场应如何制定 AI 政策，以及更广泛的社会韧性等方面。我们聚焦于编程这一 AI 工具已迅速普及的领域。在这里，AI 制造了一种潜在的张力：随着编程日益自动化、工作效率提升，人类仍然需要具备发现错误、引导输出的技能，并最终为部署在高风险环境中的 AI 提供监督。AI 是否同时为技能发展和效率提升提供了捷径？还是说，AI 辅助带来的生产力提升反而削弱了技能发展？

In a randomized controlled trial, we examined 1) how quickly software developers picked up a new skill (in this case, a Python library) with and without AI assistance; and 2) whether using AI made them less likely to understand the code they'd just written.
在这项随机对照试验中，我们考察了：1）软件开发者在有无 AI 辅助的情况下掌握一项新技能（本例为一个 Python 库）的速度；以及 2）使用 AI 是否降低了他们理解刚刚编写的代码的可能性。

We found that using AI assistance led to a statistically significant decrease in mastery. On a quiz that covered concepts they'd used just a few minutes before, participants in the AI group scored 17% lower than those who coded by hand, or the equivalent of nearly two letter grades. Using AI sped up the task slightly, but this didn't reach the threshold of statistical significance.
我们发现，使用 AI 辅助导致了在统计上具有显著意义的掌握程度下降。在一项涵盖他们几分钟前刚刚使用过的概念的测验中，AI 组参与者的得分比手动编程组低 17%，相当于近两个字母等级。使用 AI 略微加快了任务完成速度，但这一差异未达到统计显著性阈值。

Importantly, using AI assistance didn't guarantee a lower score. _How_ someone used AI influenced how much information they retained. The participants who showed stronger mastery used AI assistance not just to produce code but to build comprehension while doing so—whether by asking follow-up questions, requesting explanations, or posing conceptual questions while coding independently.
重要的是，使用 AI 辅助并不必然导致得分较低。_如何_使用 AI 影响了知识的留存程度。掌握程度较强的参与者使用 AI 辅助不仅仅是为了生成代码，而是在此过程中构建理解——无论是通过提出后续问题、要求解释，还是在独立编程时提出概念性问题。

## Study design
> 研究设计

We recruited 52 (mostly junior) software engineers, each of whom had been using Python at least once a week for over a year. We also made sure they were at least somewhat familiar with AI coding assistance, and were unfamiliar with Trio, the Python library on which our tasks were based.
我们招募了 52 名（大多为初级）软件工程师，每位工程师使用 Python 已超过一年，且至少每周使用一次。我们还确保他们对 AI 编程辅助工具至少有一定了解，但对我们任务所基于的 Python 库 Trio 并不熟悉。

We split the study into three parts: a warm-up; the main task consisting of coding two different features using Trio (which requires understanding concepts related to asynchronous programming, a skill often learned in a professional setting); and a quiz. We told participants that a quiz would follow the task, but encouraged them to work as quickly as possible.
我们将研究分为三个部分：热身；主任务（使用 Trio 编写两个不同功能，需要理解异步编程相关概念——这是一项通常在职业环境中习得的技能）；以及测验。我们告知参与者任务结束后会有测验，但鼓励他们尽快完成任务。

We designed the coding task to mimic how someone might learn a new tool through a self-guided tutorial. Each participant was given a problem description, starter code, and a brief explanation of the Trio concepts needed to solve it. We used an online coding platform with an AI assistant in the sidebar which had access to participants' code and could at any time produce the correct code if asked.1
我们将编程任务设计为模拟通过自学教程学习新工具的过程。每位参与者获得一个问题描述、起始代码，以及解决问题所需的 Trio 概念简要说明。我们使用了一个在侧边栏内置 AI 助手的在线编程平台，该助手可访问参与者的代码，并在被要求时随时提供正确代码。¹

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fb009bf674206d736940ade254b112d1cf9fd380e-4584x2580.png&w=3840&q=75)

### Evaluation design
> 评估设计

In our evaluation design, we drew on [research in computer science education](https://ieeexplore.ieee.org/document/9962584) to identify four types of questions commonly used to assess mastery of coding skills:
在评估设计中，我们借鉴了[计算机科学教育领域的研究](https://ieeexplore.ieee.org/document/9962584)，确定了四种常用于评估编程技能掌握程度的题型：

*   **Debugging**: The ability to identify and diagnose errors in code. This skill is crucial for detecting when AI-generated code is incorrect and understanding why it fails.｜**调试**：识别和诊断代码错误的能力。这项技能对于检测 AI 生成代码何时出错以及理解其失败原因至关重要。
*   **Code reading**: The ability to read and comprehend what code does. This skill enables humans to understand and verify AI-written code before deployment.｜**代码阅读**：阅读和理解代码功能的能力。这项技能使人类能够在部署前理解和验证 AI 编写的代码。
*   **Code writing:** The ability to write or select the correct approach to writing code. Low-level code writing, like remembering the syntax of functions, will be less important with the further integration of AI coding tools than high-level system design.｜**代码编写**：编写或选择正确编程方式的能力。随着 AI 编程工具的进一步集成，记忆函数语法等低层次代码编写将比高层次系统设计变得不那么重要。
*   **Conceptual**: The ability to understand the core principles behind tools and libraries. Conceptual understanding is critical for assessing whether AI-generated code uses appropriate software design patterns that adhere to how the library is intended to be used.｜**概念理解**：理解工具和库背后核心原理的能力。概念理解对于评估 AI 生成的代码是否使用了符合库预期用法的适当软件设计模式至关重要。

Our assessment focused most heavily on debugging, code reading, and conceptual problems, as we considered these the most important for providing oversight of what is increasingly likely to be AI-generated code.
我们的评估最着重于调试、代码阅读和概念性问题，因为我们认为这些对于监督日益可能由 AI 生成的代码最为重要。

## Results
> 结果

On average, participants in the AI group finished about two minutes faster, although the difference was not statistically significant. There was, however, a significant difference in test scores: the AI group averaged 50% on the quiz, compared to 67% in the hand-coding group—or the equivalent of nearly two letter grades (Cohen's _d_=0.738, _p_=0.01). The largest gap in scores between the two groups was on debugging questions, suggesting that the ability to understand when code is incorrect and why it fails may be a particular area of concern if AI impedes coding development.
平均而言，AI 组参与者完成任务约快两分钟，但这一差异在统计上不显著。然而，测验得分存在显著差异：AI 组平均得分 50%，手动编程组为 67%——相当于近两个字母等级（Cohen's _d_=0.738，_p_=0.01）。两组之间得分差距最大的是调试类问题，这表明如果 AI 阻碍了编程发展，理解代码何时出错及其失败原因的能力可能是一个特别值得关注的领域。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fab5167a53ff0de956bd500b01b30d8aba028d843-4584x2580.png&w=3840&q=75)

### Qualitative analysis: AI interaction modes
> 定性分析：AI 交互模式

We were particularly interested in understanding _how_ participants went about completing the tasks we designed. In our qualitative analysis, we manually annotated screen recordings to identify how much time participants spent composing queries, what types of questions they asked, the types of errors they made, and how much time they spent actively coding.
我们特别感兴趣的是了解参与者_如何_完成我们设计的任务。在定性分析中，我们手动标注了屏幕录像，以识别参与者花费多少时间组织查询、提出了哪些类型的问题、犯了哪些类型的错误，以及花了多少时间主动编写代码。

One surprising result was how much time participants spent interacting with the AI assistant. Several took up to 11 minutes (30% of the total time allotted) composing up to 15 queries. This helped to explain why, on average, participants using AI finished faster although the productivity improvement was not statistically significant. We expect AI would be more likely to significantly increase productivity when used on repetitive or familiar tasks.
一个令人惊讶的结果是，参与者与 AI 助手交互所花费的时间之多。一些参与者花费多达 11 分钟（占总分配时间的 30%）组织多达 15 个查询。这有助于解释为什么使用 AI 的参与者平均完成速度更快，尽管生产力改善在统计上不显著。我们预计，当用于重复性或熟悉的任务时，AI 更可能显著提升生产力。

Unsurprisingly, participants in the No AI group encountered more errors. These included errors in syntax and in Trio concepts, the latter of which mapped directly to topics tested on the evaluation. Our hypothesis is that the participants who encountered more Trio errors (namely, the control group) likely improved their debugging skills through resolving these errors independently.
不出所料，无 AI 组参与者遇到了更多错误，包括语法错误和 Trio 概念错误，后者直接对应评估中测试的主题。我们的假设是，遇到更多 Trio 错误的参与者（即对照组）很可能通过独立解决这些错误提升了调试技能。

We then grouped participants by how they interacted with AI, identifying distinct patterns that led to different outcomes in completion time and learning.
我们随后按参与者与 AI 的交互方式进行了分组，识别出了在完成时间和学习效果方面导致不同结果的不同模式。

**Low-scoring interaction patterns**: The low-scoring patterns generally involved a heavy reliance on AI, either through code generation or debugging. The average quiz scores in this group were less than 40%. They showed less independent thinking and more cognitive offloading. We further separated them into:
**低分交互模式**：低分模式通常涉及对 AI 的高度依赖，无论是通过代码生成还是调试。该组的平均测验得分低于 40%，表现出较少的独立思考和更多的认知外包。我们将其进一步细分为：

*   **AI delegation** (_n_=4): Participants in this group wholly relied on AI to write code and complete the task. They completed the task the fastest and encountered few or no errors in the process.｜**AI 全权委托**（_n_=4）：该组参与者完全依赖 AI 编写代码并完成任务。他们完成任务最快，在此过程中几乎没有遇到错误。
*   **Progressive AI reliance** (_n_=4): Participants in this group started by asking one or two questions but eventually delegated all code writing to the AI assistant. They scored poorly on the quiz largely due to not mastering any of the concepts on the second task.｜**渐进式 AI 依赖**（_n_=4）：该组参与者起初提出一两个问题，但最终将所有代码编写工作委托给 AI 助手。他们在测验中得分较差，主要是因为没有掌握第二项任务中的任何概念。
*   **Iterative AI debugging** (_n_=4): Participants in this group relied on AI to debug or verify their code. They asked more questions, but relied on the assistant to solve problems, rather than to clarify their own understanding. They scored poorly as a result, and were also slower at completing the two tasks.｜**迭代式 AI 调试**（_n_=4）：该组参与者依赖 AI 调试或验证代码。他们提出了更多问题，但依赖助手解决问题，而非澄清自身理解。结果得分较差，完成两项任务的速度也较慢。

**High-scoring interaction patterns:** We considered high-scoring quiz patterns to be behaviors where the average quiz score was 65% or higher. Participants in these clusters used AI both for code generation and conceptual queries.
**高分交互模式**：我们将平均测验得分在 65% 或以上的行为模式视为高分模式。这些集群中的参与者将 AI 用于代码生成和概念性查询两方面。

*   **Generation-then-comprehension** (_n_=2): Participants in this group first generated code and then manually copied or pasted the code into their work. After their code was generated, they asked the AI assistant follow-up questions to improve understanding. These participants were not particularly fast when using AI, but showed a higher level of understanding on the quiz. Interestingly, this approach looked nearly the same as that of the AI delegation group, except for the fact that they used AI to check their own understanding.｜**先生成后理解**（_n_=2）：该组参与者先生成代码，然后手动复制或粘贴代码到工作中。代码生成后，他们向 AI 助手提出后续问题以加深理解。这些参与者使用 AI 时速度并不特别快，但在测验中展现出更高水平的理解。有趣的是，这种方式与 AI 全权委托组几乎相同，区别仅在于他们使用 AI 来检验自身理解。
*   **Hybrid code-explanation** (_n_=3): Participants in this group composed hybrid queries in which they asked for code generation along with explanations of the generated code. Reading and understanding the explanations they asked for took more time, but helped in their comprehension.｜**混合代码-解释模式**（_n_=3）：该组参与者提出混合查询，在请求代码生成的同时要求对生成的代码进行解释。阅读和理解所请求的解释花费了更多时间，但有助于他们的理解。
*   **Conceptual inquiry** (_n_=7): Participants in this group only asked conceptual questions and relied on their improved understanding to complete the task. Although this group encountered many errors, they also independently resolved them. On average, this mode was the fastest among high-scoring patterns and second fastest overall, after AI delegation.｜**概念探究模式**（_n_=7）：该组参与者只提出概念性问题，并依靠加深的理解来完成任务。尽管该组遇到了许多错误，但他们也独立解决了这些错误。平均而言，这种模式在高分模式中是最快的，在所有模式中排名第二，仅次于 AI 全权委托模式。

Our qualitative analysis does not draw a causal link between interaction patterns and learning outcomes, but it does point to behaviors associated with different learning outcomes.
我们的定性分析没有在交互模式和学习结果之间建立因果联系，但它确实指出了与不同学习结果相关的行为模式。

## Conclusion
> 结论

Our results suggest that incorporating AI aggressively into the workplace, particularly with respect to software engineering, comes with trade-offs. The findings highlight that not all AI-reliance is the same: the way we interact with AI while trying to be efficient affects how much we learn. Given time constraints and organizational pressures, junior developers or other professionals may rely on AI to complete tasks as fast as possible at the cost of skill development—and notably the ability to debug issues when something goes wrong.
我们的结果表明，在工作场所大力引入 AI，尤其是在软件工程领域，会伴随着权衡取舍。研究发现强调，并非所有的 AI 依赖都是相同的：我们在追求效率的过程中与 AI 的交互方式会影响我们的学习程度。鉴于时间压力和组织压力，初级开发者或其他专业人士可能会依赖 AI 尽快完成任务，而以技能发展为代价——尤其是出现问题时调试错误的能力。

Though preliminary, these results suggest important considerations as companies transition to a greater ratio of AI-written to human-written code. Productivity benefits may come at the cost of skills necessary to validate AI-written code if junior engineers' skill development has been stunted by using AI in the first place. Managers should think intentionally about how to deploy AI tools at scale, and consider systems or intentional design choices that ensure engineers continue to learn as they work—and are thus able to exercise meaningful oversight over the systems they build.
尽管这些结果是初步的，但随着公司向更高比例 AI 编写代码转型，它们提示了重要的考量因素。如果初级工程师的技能发展从一开始就因使用 AI 而受阻，生产力收益可能以验证 AI 编写代码所需技能的丧失为代价。管理者应有意识地思考如何大规模部署 AI 工具，并考虑采用能确保工程师在工作中持续学习的系统或有意为之的设计选择——从而使他们能够对所构建的系统行使有效监督。

For novice workers in software engineering or any other industry, our study can be viewed as a small piece of evidence toward the value of intentional skill development with AI tools. Cognitive effort—and even getting painfully stuck—is likely important for fostering mastery. This is also a lesson that applies to how individuals choose to work with AI, and which tools they use. Major LLM services also provide learning modes (e.g., [Claude Code Learning and Explanatory](https://code.claude.com/docs/en/output-styles) mode or [ChatGPT Study Mode](https://openai.com/index/chatgpt-study-mode/)) designed to foster understanding. Knowing how people learn when using AI can also help guide how we design it; AI assistance should enable humans to work more efficiently _and_ develop new skills at the same time.
对于软件工程或任何其他行业的新手从业者，我们的研究可以视为支持使用 AI 工具有意识地进行技能发展之价值的一项小型证据。认知努力——甚至是痛苦地陷入困境——对于培养精通程度可能至关重要。这也是一个适用于个人如何选择与 AI 协作、使用哪些工具的经验。主要 LLM 服务也提供了旨在促进理解的学习模式（例如 [Claude Code 学习与解释](https://code.claude.com/docs/en/output-styles)模式或 [ChatGPT 学习模式](https://openai.com/index/chatgpt-study-mode/)）。了解人们在使用 AI 时如何学习，也有助于指导我们的设计；AI 辅助应使人类能够更高效地工作，_同时_发展新技能。

Prior studies have found mixed results on whether AI [helps](https://arxiv.org/abs/2302.06590) or [hinders](https://arxiv.org/abs/2507.09089) coding productivity. Our own [research](https://www.anthropic.com/research/estimating-productivity-gains) found that AI can reduce the time it takes to complete some work tasks by 80%—a result that may seem in tension with the findings presented here. But the two studies ask different questions and use different methods: our earlier observational work measured productivity on tasks where participants already had the relevant skills, while this study examines what happens when people are learning something new. It is possible that AI both accelerates productivity on well-developed skills and hinders the acquisition of new ones, though more research is needed to understand this relationship.
此前的研究对 AI 是否[有助于](https://arxiv.org/abs/2302.06590)或[阻碍](https://arxiv.org/abs/2507.09089)编程生产力得出了不一致的结论。我们自己的[研究](https://www.anthropic.com/research/estimating-productivity-gains)发现，AI 可以将某些工作任务的完成时间缩短 80%——这一结果可能看起来与本文的发现相矛盾。但这两项研究提出的问题不同，使用的方法也不同：我们早期的观察性研究衡量的是参与者已具备相关技能时的任务生产力，而本研究考察的是人们学习新事物时发生的情况。AI 可能同时加速了对成熟技能的生产力表现，并阻碍了新技能的习得，但理解这种关系还需要更多研究。

This study is only a first step towards uncovering how human-AI collaboration affects the experience of workers. Our sample was relatively small, and our assessment measured comprehension shortly after the coding task. Whether immediate quiz performance predicts longer-term skill development is an important question this study does not resolve. There remain many unanswered questions we hope future studies will investigate, for example the effects of AI on tasks beyond coding, whether this effect dissipates longitudinally as engineers develop greater fluency, and whether AI assistance differs from human assistance while learning.
本研究只是揭示人机协作如何影响工作者体验的第一步。我们的样本相对较小，评估在编程任务结束后不久就测量了理解程度。即时测验表现是否能预测长期技能发展，是本研究未能解答的重要问题。还有许多悬而未决的问题有待未来研究探索，例如 AI 对编程以外任务的影响、这一效应是否会随着工程师熟练度的提升而随时间消散，以及在学习过程中 AI 辅助与人类辅助是否存在差异。

Ultimately, to accommodate skill development in the presence of AI, we need a more expansive view of the impacts of AI on workers. In an AI-augmented workplace, productivity gains matter, but so does the long-term development of the expertise those gains depend on.
归根结底，要在 AI 存在的情况下实现技能发展，我们需要对 AI 对工作者影响持更为全面的视角。在 AI 增强型职场中，生产力收益固然重要，但这些收益所依赖的专业知识的长期发展同样不可忽视。

Read the [full paper](https://arxiv.org/abs/2601.20245)for details.
详情请阅读[完整论文](https://arxiv.org/abs/2601.20245)。

### Acknowledgments
> 致谢

This project was led by Judy Hanwen Shen and Alex Tamkin. Editorial support for this blog post was provided by Jake Eaton, Stuart Ritchie, and Sarah Pollack.
本项目由 Judy Hanwen Shen 和 Alex Tamkin 主导。本博文的编辑支持由 Jake Eaton、Stuart Ritchie 和 Sarah Pollack 提供。

We would like to thank Ethan Perez, Miranda Zhang, and Henry Sleight for making this project possible through the Anthropic Safety Fellows Program. We would also like to thank Matthew Jörke, Juliette Woodrow, Sarah Wu, Elizabeth Childs, Roshni Sahoo, Nate Rush, Julian Michael, and Rose Wang for experimental design feedback.
我们感谢 Ethan Perez、Miranda Zhang 和 Henry Sleight 通过 Anthropic Safety Fellows 项目使本研究成为可能。我们还感谢 Matthew Jörke、Juliette Woodrow、Sarah Wu、Elizabeth Childs、Roshni Sahoo、Nate Rush、Julian Michael 和 Rose Wang 提供的实验设计反馈。

```
@misc{aiskillformation2026,
  author = {Shen, Judy Hanwen and Tamkin, Alex},
  title = {How AI Impacts Skill Formation},
  year = {2026},
  eprint = {2601.20245},
  archivePrefix = {arXiv},
  primaryClass = {cs.LG},
  eprinttype = {arxiv}
}
```

### Footnotes
> 注释

1.   Importantly, this setup is different from agentic coding products like Claude Code; we expect that the impacts of such programs on skill development are likely to be more pronounced than the results here.
1.   重要的是，这一设置与 Claude Code 等智能体编程产品不同；我们预计此类程序对技能发展的影响可能比本文结果更为显著。
