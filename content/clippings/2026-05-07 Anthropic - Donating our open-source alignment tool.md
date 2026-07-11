Title: Donating our open-source alignment tool

URL Source: https://www.anthropic.com/research/donating-open-source-petri

Markdown Content:
In October 2025, we launched [Petri](https://www.anthropic.com/research/petri-open-source-auditing), an open-source toolbox of alignment tests that can be applied to any large language model. Petri, which was developed as part of our Anthropic Fellows program, can be used to rapidly and easily test AI models for concerning tendencies like deception, sycophancy, and cooperation with harmful requests. It's part of our efforts to develop alignment tools that are open and useful for the whole AI development community.

2025 年 10 月，我们发布了 [Petri](https://www.anthropic.com/research/petri-open-source-auditing)——一个可应用于任何大型语言模型的开源对齐测试工具箱。Petri 作为 Anthropic Fellows 计划的一部分开发而成，可用于快速便捷地测试 AI 模型是否存在欺骗、奉承迎合、配合有害请求等令人担忧的倾向。它是我们致力于为整个 AI 开发社区构建开放且实用的对齐工具这一努力的组成部分。

Petri has been part of our alignment assessment for every Claude model since Claude Sonnet 4.5. It compares how the new model behaves across a range of alignment-relevant scenarios that are simulated by a separate "auditor" model. A further "judge" model then scores the resulting transcripts for misaligned behaviors.

自 Claude Sonnet 4.5 起，Petri 已成为每个 Claude 模型对齐评估的组成部分。它通过一个独立的"审计员"模型对一系列与对齐相关的场景进行模拟，并比较新模型在这些场景中的行为。然后，另一个"裁判"模型对产生的对话记录中的失调行为进行评分。

We've been pleased to see Petri being used by external organizations: for example, the UK's AI Security Institute (AISI) made it a [major part](https://arxiv.org/abs/2604.00788) of how they evaluate models for their propensity to sabotage AI research.

我们很高兴看到 Petri 被外部组织所使用：例如，英国 AI 安全研究所（AISI）将其作为评估模型破坏 AI 研究倾向的[重要组成部分](https://arxiv.org/abs/2604.00788)。

We're now updating Petri to its third version. Here are some of the biggest changes:

我们现在正在将 Petri 更新至第三版。以下是一些最主要的变化：

*   _Adaptability._ Petri 3.0 involves major architectural changes that allow users to adapt it to more uses, in particular by splitting the auditor model and the target model into separate components that can be tweaked separately;｜_适应性。_ Petri 3.0 涉及重大架构变更，允许用户将其适配到更多用途，尤其是通过将审计员模型和目标模型拆分为可分别调整的独立组件；
*   _Realism._ Despite the fact that alignment researchers try to make tests appear realistic, a model can often deduce from various artificialities in the setup that it's actually part of a test. And if the model is aware it's being evaluated, the researcher is no longer able to see how the model behaves _in general_. An add-on to Petri, which we're calling "Dish," makes the setup far more realistic, for example by running the tests using the model's real system prompt and the real "scaffold" (the software that wraps around the model to help it meet its goals) that would be used in genuine model deployments;｜_真实性。_ 尽管对齐研究者努力使测试看起来真实，但模型往往能从设置中的各种人为痕迹推断出它实际上正处于测试之中。而如果模型意识到自己正在被评估，研究者便无法再观察模型_通常_的行为表现。我们为 Petri 开发的一个名为"Dish"的附加组件，通过使用模型真实系统提示词及真实"脚手架"（包裹模型以帮助其实现目标的软件）来运行测试，使设置更具真实性；
*   _Depth_. We've now integrated Petri with our other open-source alignment tool, [Bloom](https://www.anthropic.com/research/bloom), which can perform much more in-depth assessments of specific chosen behaviors (in comparison to Petri's wider-ranging approach).｜_深度。_ 我们现已将 Petri 与我们的另一个开源对齐工具 [Bloom](https://www.anthropic.com/research/bloom) 集成——Bloom 能够对特定选定行为进行更为深入的评估（相比于 Petri 更为广泛的方法而言）。

We're also giving Petri a new home. We have handed over its development to [Meridian Labs](https://meridianlabs.ai/), an AI evaluation nonprofit. This move—similar to when we [donated](https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation) the Model Context Protocol (MCP) to the Linux Foundation—will help ensure that Petri remains independent of any AI lab, so that its results will be seen as neutral and credible by those across the industry and beyond.

我们还为 Petri 找到了新的归宿。我们已将其开发工作移交给 [Meridian Labs](https://meridianlabs.ai/)——一家 AI 评估非营利机构。此举与我们将模型上下文协议（MCP）[捐赠](https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation)给 Linux 基金会如出一辙，将有助于确保 Petri 保持独立于任何 AI 实验室之外，使其结果在整个行业乃至更广泛范围内被视为中立且可信。

As part of Meridian Labs, Petri joins other tools like [Inspect](https://inspect.aisi.org.uk/) and [Scout](https://meridianlabs-ai.github.io/inspect_scout/), building a technology stack that is open to labs, independent researchers, and governments alike, at a time when reliable tests of AI model behavior matter more than ever.

作为 Meridian Labs 的一部分，Petri 与 [Inspect](https://inspect.aisi.org.uk/) 和 [Scout](https://meridianlabs-ai.github.io/inspect_scout/) 等工具携手，共同构建一个向实验室、独立研究人员和政府机构开放的技术栈——在 AI 模型行为可靠测试比以往任何时候都更为重要的当下，这一生态尤为关键。

You can read more about Petri 3.0 on [the Meridian Labs blog](https://meridianlabs.ai/blog/posts/introducing-petri-3/).

您可以在 [Meridian Labs 博客](https://meridianlabs.ai/blog/posts/introducing-petri-3/)上阅读更多关于 Petri 3.0 的信息。

Instructions to install and use Petri can be found on the [Petri website](https://meridianlabs-ai.github.io/inspect_petri/).

安装和使用 Petri 的说明可在 [Petri 官网](https://meridianlabs-ai.github.io/inspect_petri/)上找到。
