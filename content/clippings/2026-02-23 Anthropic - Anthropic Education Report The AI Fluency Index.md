Title: Anthropic Education Report: The AI Fluency Index

URL Source: https://www.anthropic.com/research/AI-fluency-index

Markdown Content:
People are integrating AI tools into their daily routines at a pace that would have been difficult to predict even a year ago. But adoption alone doesn't tell us much about the impact of these tools. **A further, equally important question is: as AI becomes part of everyday life, are individuals developing the skills to use it well?**
人们将 AI 工具融入日常的速度，即便在一年前也难以预料。但单纯的普及率并不能告诉我们这些工具的影响究竟有多深。**一个同样重要的后续问题是：随着 AI 成为日常生活的一部分，个人是否正在发展出善用它的能力？**

Previous Anthropic Education Reports have studied how [university students](https://www.anthropic.com/news/anthropic-education-report-how-university-students-use-claude) and [educators](https://www.anthropic.com/news/anthropic-education-report-how-educators-use-claude) use Claude. We found that students use it to create reports and analyze lab results; educators use it to build lesson materials and automate routine work. But we know that _any_ person who uses AI is likely to improve at what they do. We wanted to explore this further, and to understand how people using AI develop "fluency" with this technology over time.
此前的 Anthropic 教育报告研究了[大学生](https://www.anthropic.com/news/anthropic-education-report-how-university-students-use-claude)和[教育工作者](https://www.anthropic.com/news/anthropic-education-report-how-educators-use-claude)如何使用 Claude。我们发现，学生用它来撰写报告和分析实验结果；教育工作者用它来制作教学材料和自动化日常工作。但我们知道，_任何_使用 AI 的人都有可能在其所做的事情上有所提升。我们希望进一步探索这一问题，了解使用 AI 的人如何随着时间推移对这项技术产生"熟练度"（fluency）。

In this report, we begin answering that question. We track the presence or absence of a taxonomy of behaviors that we take to represent AI fluency across a large sample of anonymized conversations.
在本报告中，我们开始回答这一问题。我们在大量匿名对话样本中追踪一套行为分类体系的出现与否，这套体系代表了我们认为能够体现 AI 熟练度的行为。

In line with our recent [Economic Index](https://www.anthropic.com/research/economic-index-primitives), we find that the most common expression of AI fluency is _augmentative_（增强型）—treating AI as a thought partner, rather than delegating work entirely. In fact, these conversations exhibit more than double the number of AI fluency behaviors than quick, back-and-forth chats.
与我们近期的[经济指数](https://www.anthropic.com/research/economic-index-primitives)研究结论一致，我们发现 AI 熟练度最常见的表现形式是_增强型_（augmentative）——将 AI 视为思维伙伴，而非完全委托工作。事实上，这类对话所展现的 AI 熟练度行为数量超过简短来回对话的两倍。

But we also find that when AI produces artifacts—including apps, code, documents, or interactive tools—users are _less_ likely to question its reasoning (-3.1 percentage points) or identify missing context (-5.2pp). This aligns with related patterns we observed in our[recent study on coding skills](https://www.anthropic.com/research/AI-assistance-coding-skills).
但我们也发现，当 AI 产出制品（artifact）——包括应用程序、代码、文档或交互工具——时，用户_更不容易_质疑其推理（-3.1 个百分点）或识别缺失的背景信息（-5.2 个百分点）。这与我们在[近期编程技能研究](https://www.anthropic.com/research/AI-assistance-coding-skills)中观察到的相关模式一致。

These initial findings present us with a baseline that we can use to study the development of AI fluency over time.
这些初步发现为我们提供了一条基准线，可用于研究 AI 熟练度随时间推移的发展情况。

## **Measuring AI fluency**
> **衡量 AI 熟练度**

To quantify AI fluency, we use the [4D AI Fluency Framework](https://anthropic.skilljar.com/ai-fluency-framework-foundations), developed by Professors Rick Dakan and Joseph Feller in collaboration with Anthropic. This framework helps us define 24 specific behaviors that we take to exemplify safe and effective human-AI collaboration.
为了量化 AI 熟练度，我们使用由 Rick Dakan 和 Joseph Feller 教授与 Anthropic 合作开发的 [4D AI 熟练度框架](https://anthropic.skilljar.com/ai-fluency-framework-foundations)。该框架帮助我们定义了 24 种具体行为，我们认为这些行为是安全、有效的人机协作的典范。

Of these 24 behaviors, 11 (listed in the graph below) are directly observable when humans interact with Claude on Claude.ai or Claude Code. The other 13 (including things like being honest about AI's role in work, or considering the consequences of sharing AI-generated output), happen outside Claude.ai's chat interface, so they're much harder for us to track. These unobservable behaviors are arguably some of the most consequential dimensions of AI fluency, so in future work we plan to use qualitative methods to assess them.
在这 24 种行为中，11 种（如下图所示）在人类与 Claude 在 Claude.ai 或 Claude Code 上交互时可以直接观察到。其他 13 种（包括诚实说明 AI 在工作中的作用，或考虑分享 AI 生成内容的后果等）发生在 Claude.ai 聊天界面之外，因此我们很难追踪。这些不可观察的行为可以说是 AI 熟练度中最具影响力的维度，因此在未来的工作中，我们计划使用定性方法对其进行评估。

For this study, we focused on the 11 directly observable behaviors. We used our [privacy-preserving analysis tool](https://www.anthropic.com/research/clio) to study 9,830 conversations that included several back-and-forths with Claude on Claude.ai during a 7-day window in January 2026.1 We then measured the presence or absence of the 11 behaviors; each conversation could display evidence of multiple behaviors. We assessed the reliability of our sample by checking whether our results were consistent across each day of the week, and across the different languages in our sample (we found that they were).2 This, finally, gave us the AI Fluency Index: a baseline measurement of how people collaborate with AI today, and a foundation for tracking how those behaviors evolve over time as models change.
在本研究中，我们聚焦于 11 种可直接观察的行为。我们使用[隐私保护分析工具](https://www.anthropic.com/research/clio)研究了 2026 年 1 月一周时间窗口内，在 Claude.ai 上与 Claude 进行多轮对话的 9,830 次对话。¹ 我们随后测量了这 11 种行为的出现与否；每次对话可以展现多种行为的证据。我们通过检验结果在一周各天以及样本中不同语言之间的一致性来评估样本的可靠性（我们发现结论是一致的）。² 最终，这给了我们 AI 熟练度指数：一个衡量当今人们如何与 AI 协作的基准测量，以及跟踪这些行为随模型变化如何演进的基础。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fcf98cd90972577bf4dd6457682d9ee82cbf2b858-3840x2160.png&w=3840&q=75)

_Prevalence of each AI fluency behavioral indicator across 9,830 Claude.ai conversations, ranked from most to least common and color-coded by competency._
_9,830 次 Claude.ai 对话中每项 AI 熟练度行为指标的出现率，按从最常见到最不常见排序，并按能力维度进行颜色编码。_

## **Results**
> **结果**

With our first study, we've found two main patterns in Claude use: a strong relationship between AI fluency and iteration and refinement through longer conversations with Claude, and changes in users' fluency behaviors when coding or building other outputs.
在我们的首项研究中，我们在 Claude 使用中发现了两个主要模式：AI 熟练度与通过更长对话进行迭代和改进之间的强相关性，以及用户在编码或构建其他产出时熟练度行为的变化。

### **Fluency is strongly associated with conversations that exhibit iteration and refinement**
> **熟练度与展现迭代和改进的对话强相关**

One of the strongest patterns in the data is the relationship between iteration and refinement and every other AI fluency behavior. 85.7% of the conversations in our sample exhibited iteration and refinement: building on previous exchanges to refine the user's work, rather than accepting the first response and moving to a new task. These conversations showed substantially higher rates of other fluency behaviors, as the chart below shows:
数据中最强的模式之一是迭代和改进与所有其他 AI 熟练度行为之间的关系。我们样本中 85.7% 的对话展现了迭代和改进：在先前交流的基础上改进用户的工作，而非接受第一个回答后转向新任务。如下图所示，这些对话呈现出显著更高的其他熟练度行为发生率：

![Image 2: The iteration and refinement effect: Comparison table or visual showing behavior rates with/without iteration and refinement]](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F995a58d356ab28738abc3c1313296b298e4b77dc-1920x1080.png&w=3840&q=75)

_Behavioral indicator prevalence in conversations where the user iterates and refines (n=8,424) versus conversations without iteration and refinement (n=1,406). All behaviors are substantially more prevalent in conversations with iteration and refinement._
_用户进行迭代和改进的对话（n=8,424）与不含迭代和改进的对话（n=1,406）中行为指标出现率的比较。所有行为在含迭代和改进的对话中出现率均显著更高。_

On average, conversations with iteration and refinement exhibit 2.67 additional fluency behaviors—roughly double the non-iterative rate of 1.33. This is especially pronounced for fluency behaviors related to evaluating Claude's outputs. Conversations with iteration and refinement are 5.6x more likely to involve users questioning Claude's reasoning, and 4x more likely to see them identify missing context.
平均而言，含迭代和改进的对话展现了 2.67 个额外的熟练度行为——大约是非迭代对话 1.33 个的两倍。这在与评估 Claude 输出相关的熟练度行为上尤为显著。含迭代和改进的对话中，用户质疑 Claude 推理的可能性高 5.6 倍，识别缺失背景的可能性高 4 倍。

### **When creating outputs, users become more directive but less evaluative**
> **在创建产出时，用户变得更具指导性但评估性降低**

12.3% of conversations in our sample involved [artifacts](https://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4/catalog/artifacts), including code, documents, interactive tools, and other outputs. In these conversations, people collaborated with AI quite differently.
我们样本中 12.3% 的对话涉及[制品](https://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4/catalog/artifacts)，包括代码、文档、交互工具和其他产出。在这些对话中，人们与 AI 的协作方式截然不同。

Specifically, we found substantially higher rates of behaviors that fall within the broader themes of "description" and "delegation." For instance, these conversations are more likely to see users clarify their goal (+14.7pp), specify a format (+14.5pp), provide examples (+13.4pp), and iterate (+9.7pp) compared to non-artifact conversations. In other words, they're doing more to direct AI at the outset of their work.
具体而言，我们发现属于"描述"和"委托"这两个更广泛主题的行为发生率显著更高。例如，与非制品对话相比，这些对话中用户更可能澄清目标（+14.7 个百分点）、指定格式（+14.5pp）、提供示例（+13.4pp）以及进行迭代（+9.7pp）。换句话说，他们在工作之初为引导 AI 做了更多工作。

But this directiveness doesn't correspond with greater levels of evaluation or discernment.**In fact, it's the opposite: in conversations where artifacts are created, users are _less_ likely to identify missing context (-5.2pp), check facts (-3.7pp), or question the model's reasoning by asking it to explain its rationale (-3.1pp).** Our [Economic Index](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report) finds that—unsurprisingly—the most complex tasks are where Claude struggles the most, so this seems particularly noteworthy.
但这种指导性并不对应更高水平的评估或辨别。**事实上恰恰相反：在创建制品的对话中，用户_更不容易_识别缺失的背景（-5.2pp）、核实事实（-3.7pp），或通过要求解释其推理来质疑模型的理由（-3.1pp）。** 我们的[经济指数](https://www.anthropic.com/research/anthropic-economic-index-january-2026-report)发现——不出所料——最复杂的任务正是 Claude 最难以应对的地方，因此这一点尤其值得关注。

![Image 3: Artifact vs. non-artifact comparison table or paired bar chart](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F3aa718781064a7d8638ed684cec97e6903921e3c-1920x1080.png&w=3840&q=75)

_Behavioral indicator prevalence in conversations with artifacts (n=1,209) versus without artifacts (n=8,621). Description and delegation behaviors increase in artifact conversations, while all three discernment behaviors decrease._
_含制品对话（n=1,209）与不含制品对话（n=8,621）中行为指标出现率的比较。描述和委托行为在制品对话中增加，而所有三种辨别行为均下降。_

There are several possible explanations for this pattern. It might be that Claude is creating polished, functional-looking outputs, for which it doesn't seem necessary to question things further: if the work _looks_ finished, users might treat it as such. But it's also possible that artifact conversations involve tasks where factual precision matters less than aesthetics or functionality (designing a UI, for instance, versus writing a legal analysis). Or users might be evaluating artifacts through channels we can't observe—running code, testing an app elsewhere, sharing a draft with a colleague—rather than expressing their evaluation within that same initial conversation.
对于这一模式，有几种可能的解释。可能是 Claude 正在创建看起来精良、功能完整的产出，因此似乎没有必要进一步质疑：如果工作_看起来_已经完成，用户可能就会如此对待它。但也可能是制品对话涉及美感或功能性比事实精确性更重要的任务（例如设计 UI，而非撰写法律分析）。或者用户可能通过我们无法观察的渠道评估制品——运行代码、在别处测试应用、与同事分享草稿——而非在最初的对话中表达他们的评估。

Whatever the explanation, the pattern is worth paying attention to. As AI models become increasingly capable of producing polished-looking outputs, the ability to critically evaluate those outputs, whether in direct conversation or through other means, will become more valuable rather than less.
无论解释如何，这一模式都值得关注。随着 AI 模型越来越能够产出看起来精良的内容，批判性评估这些产出的能力——无论是通过直接对话还是其他方式——将变得更加宝贵，而非更少。

Developing your own AI fluency
提升你自己的 AI 熟练度

| As with all skills, AI fluency is a matter of degree—for most of us, it's possible to develop our techniques much further. Based on the patterns in our data, there are three areas where we've found many users could improve their skills: |
| --- |
| 与所有技能一样，AI 熟练度是一个程度问题——对我们大多数人来说，都有可能进一步发展我们的技巧。基于数据中的模式，我们发现许多用户可以在以下三个方面提升技能： |
| **Staying in the conversation.** Iteration and refinement is the single strongest correlate of all other fluency behaviors in our data. So, when you get an initial response, it's worth treating it as only a starting point: ask follow-up questions, push back on any parts that don't feel right, and refine what you're looking for. |
| **保持在对话中。** 迭代和改进是我们数据中与所有其他熟练度行为相关性最强的单一因素。因此，当你得到初始回应时，值得将其仅视为起点：提出后续问题，对任何感觉不对的部分提出异议，并精炼你的需求。 |
| **Questioning polished outputs.** When AI models produce something that _looks_ good, it's the perfect moment to pause and ask: is this accurate? Is anything missing? Does this reasoning hold up? As we discussed above, our data show that polished outputs coincide with lower rates of critical evaluation, even though users go to greater lengths to direct Claude's work at the outset. |
| **质疑精良的产出。** 当 AI 模型产出看起来_不错_的内容时，正是暂停并追问的好时机：这准确吗？有什么遗漏吗？这个推理站得住脚吗？如我们上面所讨论的，我们的数据显示，精良的产出与较低的批判性评估发生率相伴，尽管用户在工作之初为引导 Claude 付出了更多努力。 |
| **Setting the terms of the collaboration.** In only 30% of conversations do users tell Claude how they'd like it to interact with them. Try being explicit by adding instructions like, "Push back if my assumptions are wrong," "Walk me through your reasoning before giving me the answer," or, "Tell me what you're uncertain about." Establishing these expectations up front can change the dynamic of the rest of the conversation. |
| **设定协作条件。** 仅在 30% 的对话中，用户会告诉 Claude 他们希望如何进行交互。尝试明确表达，例如添加如下指令："如果我的假设有误，请纠正我"、"在给出答案之前，请带我了解你的推理过程"，或"告诉我你不确定的地方"。提前建立这些期望可以改变接下来对话的动态。 |

## **Limitations**
> **局限性**

This research comes with important caveats:
这项研究有重要的注意事项：

*   **Sample limitations:** Our sample reflects Claude.ai users who engaged in multi-turn conversations during a single week in January 2026. Since we think this is still relatively early on in the diffusion of AI tools, these users likely skew towards early adopters who are already comfortable with AI—i.e., who may not represent the broader population. Our sample should be understood as providing a baseline for _this_ population, not as a universal benchmark. Because the data comes from a single week, it is also unable to capture any seasonal or longitudinal effects. And because it's focused on [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4), we don't capture how users interact with other AI platforms.｜**样本局限性：** 我们的样本反映了 2026 年 1 月一周内参与多轮对话的 Claude.ai 用户。由于我们认为这仍处于 AI 工具普及的相对早期阶段，这些用户可能偏向于已对 AI 感到舒适的早期采用者——即可能不代表更广泛人群的用户。我们的样本应被理解为为_这一_人群提供基准，而非普适性标准。由于数据来自单一一周，也无法捕捉任何季节性或纵向效应。而且由于专注于 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4)，我们无法捕捉用户与其他 AI 平台的交互情况。
*   **Partial framework coverage:** In this study, we only assessed the 11 of the 24 behavioral indicators that are directly observable in conversations on Claude.ai. All behaviors related to the responsible and ethical use of AI outputs occur outside of these conversations, and are not captured.｜**框架覆盖不完整：** 在本研究中，我们仅评估了 24 个行为指标中可在 Claude.ai 对话中直接观察到的 11 个。所有与负责任和道德使用 AI 输出相关的行为均发生在这些对话之外，未被捕捉。
*   **Binary classification:** For each conversation in our sample, we classify each behavior as either present or absent. But this likely misses significant nuance—like arguable or partial demonstrations of behaviors, or overlapping signals between them.｜**二元分类：** 对于样本中的每次对话，我们将每种行为分类为存在或不存在。但这可能忽略了重要的细微差别——例如有争议或部分展现的行为，或行为之间重叠的信号。
*   **Implicit behaviors:** Users might demonstrate fluency behaviors mentally (such as fact-checking Claude's claims against their own knowledge) without expressing these behaviors in conversation. This seems especially relevant for our data on artifacts—users might be evaluating Claude's outputs through testing and practical use, rather than through conversation-visible behaviors.｜**隐性行为：** 用户可能在心理上表现出熟练度行为（例如根据自身知识核查 Claude 的陈述），而不在对话中表达这些行为。这对于我们关于制品的数据尤其相关——用户可能通过测试和实际使用来评估 Claude 的输出，而非通过对话中可见的行为。
*   **Correlational findings:** The relationships we identify are correlational. We don't know whether one behavior _causes_ another, or whether they both reflect some common underlying factor, like task complexity or user preferences.｜**相关性发现：** 我们识别的关系是相关性的。我们不知道一种行为是否_导致_另一种，或两者是否都反映了某种共同的潜在因素，如任务复杂性或用户偏好。

## **Looking ahead**
> **展望未来**

This study offers us a baseline that we can use to assess how AI fluency is changing over time. As AI capabilities evolve and adoption increases, we're aiming to learn whether users are developing more sophisticated behaviors, which skills are emerging naturally with experience, and which will require more intentional development.
本研究为我们提供了一条基准线，可用于评估 AI 熟练度如何随时间变化。随着 AI 能力的发展和采用率的提升，我们的目标是了解用户是否正在发展出更复杂的行为、哪些技能会随经验自然涌现，以及哪些技能需要更有意识的培养。

In future work, we plan to extend our analysis in several directions. First, we plan to conduct "cohort analyses," comparing new users to experienced ones in order to understand how familiarity with AI is correlated with fluency development. Second, we plan to use qualitative research methods to assess the behaviors that aren't directly observable in Claude.ai conversations. And third, we aim to explore the _causal_ questions that this work raises—like whether encouraging iterative conversations leads to greater critical evaluation, or whether there are other interventions that could encourage this more effectively.
在未来的工作中，我们计划从几个方向扩展分析。首先，我们计划进行"队列分析"，将新用户与有经验的用户进行比较，以了解对 AI 的熟悉程度与熟练度发展的相关性。其次，我们计划使用定性研究方法评估在 Claude.ai 对话中无法直接观察到的行为。第三，我们旨在探索本研究提出的_因果_问题——例如鼓励迭代对话是否会带来更大的批判性评估，或者是否有其他干预措施可以更有效地促进这一点。

In addition, we'd like to explore AI fluency behaviors in Claude Code, a platform mostly used by software developers. In preparation for this study, we conducted some initial analysis that found consistency between Claude Code conversations and ones in [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4). But this is still preliminary, and Claude Code's very different user base and functionality implies that more substantial research is necessary.
此外，我们希望探索 Claude Code（主要由软件开发者使用的平台）中的 AI 熟练度行为。为准备本研究，我们进行了一些初步分析，发现 Claude Code 对话与 [Claude.ai](http://claude.ai/redirect/website.v1.a23c2e9e-ccfe-4a56-aed3-c4cdbd962cc4) 对话之间存在一致性。但这仍是初步结论，Claude Code 截然不同的用户群体和功能特性意味着需要进行更实质性的研究。

We expect that the nature of AI fluency will develop and evolve substantially over time. With this and future research, we're aiming to make that development visible, measurable, and actionable.
我们预计 AI 熟练度的本质将随时间推移而发生实质性的发展和演变。通过本次及未来的研究，我们的目标是使这一发展可见、可测量且可付诸行动。

## **Bibtex**
> **引用**

If you'd like to cite this post, you can use the following Bibtex key:
如需引用本文，可使用以下 Bibtex 格式：

```
@online{swanson2026aifluency,
author = {Kristen Swanson, Drew Bent, and Zoe Ludwig and Rick Dakan and Joe Feller},
title = {Anthropic Education Report: The AI Fluency Index},
date = {2026-02-16},
year = {2026},
url = {https://www.anthropic.com/news/anthropic-education-report-the-ai-fluency-index},
}
```

## **Acknowledgements**
> **致谢**

Kristen Swanson designed the research, led the analysis, and wrote this report. Zoe Ludwig and Drew Bent contributed to framework alignment, messaging, and review. The 4D Framework for AI Fluency was developed by Rick Dakan and Joe Feller. Zack Lee provided technical support. Hanah Ho helped visualize the data. Keir Bradwell, Rebecca Hiscott, Ryan Donegan and Sarah Pollack provided communications review and guidance.
Kristen Swanson 设计了研究方案、主导了分析工作并撰写了本报告。Zoe Ludwig 和 Drew Bent 贡献了框架对齐、内容表达和审阅工作。AI 熟练度 4D 框架由 Rick Dakan 和 Joe Feller 开发。Zack Lee 提供了技术支持。Hanah Ho 协助进行了数据可视化。Keir Bradwell、Rebecca Hiscott、Ryan Donegan 和 Sarah Pollack 提供了传播审阅和指导。

#### Footnotes
> 注释

1 When researching how people use AI models, protecting user privacy is paramount. For this project, we used our [privacy-preserving analysis tool](https://www.anthropic.com/research/clio), which enables bottom-up discovery of AI usage patterns by distilling user conversations into high-level usage summaries, such as "troubleshoot code" or "explain economic concepts." For this analysis, we ran 11 separate binary classifiers (one per behavioral indicator) using Claude Sonnet 4 for behavioral classification and Claude Haiku 3.5 for language detection. This means a single conversation could indicate multiple AI fluency behavioral indicators. Conversations were filtered to substantive exchanges with multiple back-and-forths using a screener that excluded greetings, single-word exchanges, test messages, and pure chitchat. Manual review of 200 chats that were screened out indicated that chats of this nature did not qualify for any AI Fluency indicators, so we feel confident that the screener did not influence the relative rankings of AI fluency behaviors observed in the study. No personally identifiable information appears in the analysis.
1 在研究人们如何使用 AI 模型时，保护用户隐私至关重要。在本项目中，我们使用了[隐私保护分析工具](https://www.anthropic.com/research/clio)，该工具通过将用户对话提炼为高层次使用摘要（如"调试代码"或"解释经济概念"）来自下而上地发现 AI 使用模式。在本分析中，我们运行了 11 个独立的二元分类器（每个行为指标对应一个），使用 Claude Sonnet 4 进行行为分类，Claude Haiku 3.5 进行语言检测。这意味着单次对话可以指示多个 AI 熟练度行为指标。使用筛选器对对话进行过滤，保留包含多轮来回的实质性交流，排除问候语、单词交流、测试信息和纯闲聊。对 200 次被筛除对话的人工审阅表明，此类对话不符合任何 AI 熟练度指标的条件，因此我们有信心认为筛选器没有影响研究中观察到的 AI 熟练度行为的相对排名。分析中不包含任何个人可识别信息。

2 Behavioral indicators were calculated across a one-week sample (January 20–26, 2025) and held stable day-to-day, with most behaviors varying by only 1–5 percentage points. Saturday rates were slightly lower for some behaviors (e.g., iteration and refinement was 81.4% for Saturday compared to a weekday peak of 87.9%), suggesting modest differences in casual versus purposeful use, but no day showed meaningful structural deviation. Rates were also consistent across six languages (English, French, Spanish, Chinese, Japanese, and German), with most behaviors varying by 3 percentage points or fewer across language groups. Together, these findings suggest that the behavioral patterns captured here reflect consistent habits in how people engage with AI, rather than being artifacts of timing, day of week, or linguistic and cultural context.
2 行为指标基于一周样本（2025 年 1 月 20 日至 26 日）计算，逐日保持稳定，大多数行为仅变动 1–5 个百分点。某些行为在周六的发生率略低（例如迭代和改进在周六为 81.4%，而工作日峰值为 87.9%），表明休闲使用与目的性使用之间存在适度差异，但没有任何一天显示出有意义的结构性偏差。各发生率在六种语言（英语、法语、西班牙语、中文、日语和德语）之间也保持一致，大多数行为在不同语言群体间的变动不超过 3 个百分点。综合来看，这些发现表明此处捕捉到的行为模式反映了人们与 AI 互动方式的一贯习惯，而非时间点、星期几或语言文化背景的产物。
