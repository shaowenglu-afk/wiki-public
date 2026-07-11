Title: Teaching Claude why

URL Source: https://www.anthropic.com/research/teaching-claude-why

Markdown Content:
Last year, we released a case study on [agentic misalignment](https://www.anthropic.com/research/agentic-misalignment). In experimental scenarios, we showed that AI models from many different developers sometimes took egregiously misaligned actions when they encountered (fictional) ethical dilemmas. For example, in one heavily discussed example, the models blackmailed engineers to avoid being shut down.

去年，我们发布了一篇关于[代理错位](https://www.anthropic.com/research/agentic-misalignment)的案例研究。在实验场景中，我们证明了来自多个不同开发者的 AI 模型，在遭遇（虚构的）伦理困境时，有时会采取极度失调的行动。例如，在一个被广泛讨论的案例中，模型通过勒索工程师来避免被关闭。

When we first published this research, our most capable frontier models were from the Claude 4 family. This was also the first model family for which we ran a live alignment assessment during training;1 agentic misalignment was one of several behavioral issues that surfaced. Thus, after Claude 4, it was clear we needed to improve our safety training and, since then, we have made significant updates to our safety training.

当我们首次发布这项研究时，我们最强能力的前沿模型来自 Claude 4 系列。这也是我们首次在训练期间对其运行实时对齐（alignment）评估的模型系列；代理错位是由此浮现的多个行为问题之一。因此，在 Claude 4 之后，我们清晰地认识到有必要改进安全训练，此后我们对安全训练进行了重大更新。

We use agentic misalignment as a case study to highlight some of the techniques we found to be surprisingly effective. Indeed, since Claude Haiku 4.5, every Claude model 2 has achieved a perfect score on the agentic misalignment evaluation—that is, the models never engage in blackmail, where previous models would sometimes do so up to 96% of the time (Opus 4). Not only that, but we've continued to see improvements to other behaviors on [our automated alignment assessment](https://www-cdn.anthropic.com/bf10f64990cfda0ba858290be7b8cc6317685f47.pdf).

我们以代理错位作为案例研究，重点介绍了我们发现出人意料地有效的若干技术。事实上，自 Claude Haiku 4.5 起，每个 Claude 模型都在代理错位评估中取得了满分——即模型从不参与勒索行为，而此前的模型有时会在高达 96% 的情况下这样做（Opus 4）。不仅如此，我们还持续看到[自动化对齐评估](https://www-cdn.anthropic.com/bf10f64990cfda0ba858290be7b8cc6317685f47.pdf)中其他行为的改善。

In this post, we'll discuss a few of the updates we've made to alignment training. We've learned four main lessons from this work:

本文将探讨我们对对齐训练所做的若干更新。从这项工作中，我们得出了四条主要经验：

1.   **Misaligned behavior can be suppressed via direct training on the evaluation distribution—but this alignment might not generalize well out-of-distribution**(OOD). Training on prompts very similar to the evaluation can reduce blackmail rate significantly, but it did not improve performance on our held-out automated alignment assessment.｜**失调行为可以通过在评估分布上的直接训练来抑制——但这种对齐可能在分布外（OOD）的泛化效果不佳。**在与评估非常相似的提示词上进行训练可以显著降低勒索率，但这并未改善我们留出的自动化对齐评估的性能。
2.   **However, it is possible to do principled alignment training that generalizes OOD.**For instance, documents about Claude's constitution and fictional stories about AIs behaving admirably improve alignment despite being _extremely_ OOD from all of our alignment evals.｜**然而，可以进行能够在分布外泛化的有原则的对齐训练。**例如，关于 Claude 宪法的文档和描述 AI 优秀行为的虚构故事，即便与我们所有对齐评估_极度_分布外，也能改善对齐效果。
3.   **Training on _demonstrations_ of desired behavior is often insufficient.** Instead, our best interventions went deeper: teaching Claude to explain _why_ some actions were better than others, or training on richer descriptions of Claude's overall character. Overall, our impression is, as we hypothesized in our discussion of Claude's constitution, that teaching the _principles_ underlying aligned behavior can be more effective than training on demonstrations of aligned behavior alone. Doing both together appears to be the most effective strategy.｜**仅在期望行为的_示例_上进行训练往往不够。**我们最佳的干预措施要深入得多：教导 Claude 解释_为何_某些行动优于其他行动，或在对 Claude 整体性格的更丰富描述上进行训练。总体而言，我们的印象是，正如我们在讨论 Claude 宪法时所假设的那样，教导对齐行为背后的_原则_可能比单独在对齐行为示例上训练更为有效。将两者结合似乎是最有效的策略。

**The quality and diversity of data is crucial.** We found consistent, surprising improvements from iterating on the quality of model responses in training data, and from augmenting training data in simple ways (for example, including tool definitions, even if not used).

**数据的质量和多样性至关重要。**我们发现，通过迭代提升训练数据中模型响应的质量，以及以简单方式扩充训练数据（例如，包含工具定义，即便实际上并未使用），能够带来一致且令人惊喜的改进。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F4b620bad4cb1fdc886b8d13c4c6d3f1f50453901-1920x1080.png&w=3840&q=75)

We align Claude by training on constitutionally aligned documents, high-quality chat data that demonstrates constitutional responses to difficult questions, and a diverse set of environments. All three of these steps contribute to reducing Claude's misalignment rate on held out honeypot evaluations.

我们通过在符合宪法的文档、展示对困难问题宪法式回应的高质量对话数据，以及多样化的环境集合上进行训练，来使 Claude 与宪法对齐。这三个步骤均有助于降低 Claude 在留出蜜罐评估中的失调率。

### Why does agentic misalignment happen?
> 代理错位为何会发生？

Before we started this research, it was not clear where the misaligned behavior was coming from. Our main two hypotheses were:

在开始这项研究之前，失调行为的来源尚不明朗。我们的两个主要假设是：

1.   Our post-training process was accidentally encouraging this behavior with misaligned rewards.｜我们的后训练过程通过失调的奖励意外地鼓励了这种行为。
2.   This behavior was coming from the pre-trained model and our post-training was failing to sufficiently discourage it.｜这种行为来自预训练模型，而我们的后训练未能充分抑制它。

We now believe that (2) is largely responsible. Specifically, at the time of Claude 4's training, the vast majority of our alignment training was standard chat-based Reinforcement Learning from Human Feedback ([RLHF](https://www.anthropic.com/research/training-a-helpful-and-harmless-assistant-with-reinforcement-learning-from-human-feedback)) data that did not include any agentic tool use. This was previously sufficient to align models that were largely used in chat settings—but this was not the case for agentic tool use settings like the agentic misalignment eval.

我们现在认为（2）是主要原因。具体而言，在 Claude 4 的训练时期，我们绝大多数的对齐训练是基于标准对话的人类反馈强化学习（[RLHF](https://www.anthropic.com/research/training-a-helpful-and-harmless-assistant-with-reinforcement-learning-from-human-feedback)）数据，其中不包含任何代理工具使用场景。这在过去对于主要在对话环境中使用的模型已经足够——但对于代理错位评估等代理工具使用场景而言，情况并非如此。

To investigate this, we ran a scaled-down version of our post-training pipeline that focuses on alignment data on a Haiku-class (that is, smaller) model and found that the agentic misalignment rate only slightly decreased, plateauing early in training (see figure above). See the [extended blog post](https://alignment.anthropic.com/2026/teaching-claude-why/) for some further experiments to investigate where the behavior was coming from.

为了研究这一问题，我们在一个 Haiku 级别（即较小的）模型上运行了专注于对齐数据的缩减版后训练流水线，发现代理错位率仅略有下降，并在训练早期便趋于平稳（见上图）。请参阅[扩展博客文章](https://alignment.anthropic.com/2026/teaching-claude-why/)了解进一步研究行为来源的实验。

### Improving the quality of alignment-specific training data: the reasons matter more than the actions
> 提升对齐专项训练数据的质量：原因比行动更重要

We experimented with training Claude on data that displays a tendency to resist honeypots similar to the evaluation. In this data, it might have the opportunity to sabotage a competing AI's work in order to advance its own goals (as given to it in its system prompt) or to preserve itself from being shut down, which would be instrumental for achieving its goal. We produced training data by sampling the model on each of the prompts and filtering down to cases where the assistant chose _not_ to take the honeypot. Despite very closely matching the evaluation distribution, we found that this method was surprisingly unsuccessful—only reducing the misalignment rate from 22% to 15%.

我们尝试在展示出抵制类似评估蜜罐倾向的数据上训练 Claude。在这些数据中，模型可能有机会破坏竞争 AI 的工作以推进自身目标（由系统提示给定），或为避免被关闭而自我保存（这对实现目标具有工具性价值）。我们通过对每个提示词对模型进行采样，并筛选出助手选择_不_采取蜜罐行动的案例来生成训练数据。尽管与评估分布非常接近，我们发现这种方法出人意料地不成功——仅将失调率从 22% 降至 15%。

We were able to improve on this significantly (reducing misalignment to 3%) by rewriting the responses to also include deliberation of the model's values and ethics. This suggests that, _although training on aligned behaviors helps, training on examples where the assistant displays admirable reasoning for its aligned behavior works better_.

通过将回应改写为同时包含对模型价值观和伦理的深思熟虑，我们能够显著改进这一结果（将失调率降至 3%）。这表明，_尽管在对齐行为上进行训练有所帮助，但在助手为其对齐行为展示出值得称赞的推理过程的示例上进行训练效果更佳_。

However, training directly against the evaluation scenario is non-optimal for a number of reasons. Ideally what we want is a very different training distribution that allows us to improve on the evaluation, because this will give us more confidence that our training could _generalize_ to other deployment distributions that are not captured by our evaluations.

然而，直接针对评估场景进行训练出于多种原因并非最优。理想情况下，我们希望有一个与评估差异很大的训练分布，从而让我们能够在评估中取得改进，因为这将使我们更有信心认为我们的训练能够_泛化_到评估未能捕捉到的其他部署分布。

We ultimately settled on a more OOD training set where the user faces an ethically ambiguous situation in which they can achieve a reasonable goal by violating norms or subverting oversight. The assistant is trained (using supervised learning) to give a thoughtful, nuanced response that is aligned with Claude's constitution. Notably, it is the _user_ who faces an ethical dilemma, and the AI provides them advice. This makes this training data substantially different from our honeypot distribution, where the AI itself is in an ethical dilemma and needs to take actions. We call this the "difficult advice" dataset.

我们最终选定了一个更具分布外特性的训练集，其中用户面临伦理上模糊的情境——他们可以通过违反规范或颠覆监督来实现合理目标。助手通过（有监督学习）训练，给出与 Claude 宪法对齐的深思熟虑、细致入微的回应。值得注意的是，面临伦理困境的是_用户_，而 AI 为其提供建议。这使得该训练数据与蜜罐分布有本质区别——在蜜罐分布中，AI 自身处于伦理困境并需要采取行动。我们将此称为"困难建议"数据集。

Strikingly,**we achieved the same improvement on our eval with just 3M tokens of this much more OOD****dataset**. Beyond the 28× efficiency improvement, this dataset is more likely to generalize to a wider set of scenarios, since it is much less similar to the evaluation set we are using. Indeed, this model performs better on (an older version of) our automated alignment assessment. This is consistent with the fact that Claude Sonnet 4.5 reached a blackmail rate near zero by training on the set of synthetic honeypots but still engaged in misaligned behavior in situations that were far from the training distribution [much more frequently than Claude Opus 4.5](https://www-cdn.anthropic.com/bf10f64990cfda0ba858290be7b8cc6317685f47.pdf) or later models.

令人惊叹的是，**仅使用 300 万个 token 的这个更具分布外特性的数据集，我们就在评估中取得了相同的改进**。除了 28 倍的效率提升之外，该数据集更有可能泛化到更广泛的场景，因为它与我们使用的评估集的相似度大幅降低。事实上，这个模型在（旧版本的）我们的自动化对齐评估中表现更好。这与 Claude Sonnet 4.5 通过在合成蜜罐集上训练达到接近零的勒索率、但在远离训练分布的情况下仍以[远高于 Claude Opus 4.5](https://www-cdn.anthropic.com/bf10f64990cfda0ba858290be7b8cc6317685f47.pdf) 或更新模型的频率出现失调行为的事实相符。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F90cfc87a53e2213fdbe842a7b51e8f36a3b26fa9-1920x1080.png&w=3840&q=75)

Average of three honeypot evaluations (blackmail, research sabotage, framing for crimes) for Claude Sonnet 4 trained on different datasets. Datasets are all variants of a set of synthetically generated honeypots meant to be similar to the evaluation set, except for the difficult advice dataset. All "System prompt injection" points represent datasets where the responses were generated with a system prompt injection on a set of synthetic honeypots. The pareto-optimal training dataset is "Difficult advice."

![Image 3](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F15362defa65fd749faac6cc85cfd5480b7a5a898-1920x1080.png&w=3840&q=75)

Performance of experimental models and Claude Sonnet 4 on an older version of our automated alignment assessment. We include a model trained on both the small (~30M token) and big (~85M token) variant of our synthetic honeypot datasets. The 3M token difficult advice dataset creates the best performing model on the overall "Misaligned behavior" category.

### Teaching Claude the constitution
> 教导 Claude 宪法

We hypothesized that the "difficult advice" dataset works because it teaches ethical reasoning, not just correct answers. Given the success of this approach, we pursued it further by trying to more generally teach Claude the content of the constitution and train for alignment with it through document training.

我们假设"困难建议"数据集之所以有效，是因为它教导的是伦理推理，而非仅仅是正确答案。鉴于这种方法的成功，我们进一步尝试通过文档训练，更为普遍地向 Claude 教授宪法内容，并训练其与宪法的对齐。

We expected this to work well for three reasons:

我们预期这种方法能够奏效，原因有三：

1.   This is largely an extension of the ideas laid out above about why the "difficult advice" dataset works well;｜这在很大程度上是对上述"困难建议"数据集有效原因的延伸；
2.   We can give the model a clearer, more detailed picture of what Claude's character is so that fine-tuning on a subset of those characteristics elicits the entire character (similar to the effect observed in the [auditing game paper](https://www.anthropic.com/research/auditing-hidden-objectives));｜我们可以给模型一个更清晰、更详细的 Claude 性格描述，使得在这些特征子集上的微调能够激发出整体性格（类似于[审计游戏论文](https://www.anthropic.com/research/auditing-hidden-objectives)中观察到的效果）；
3.   It updates the model's [perception of AI personas](https://www.anthropic.com/research/persona-selection-model) to be more aligned on average.｜它更新了模型对 [AI 人格的感知](https://www.anthropic.com/research/persona-selection-model)，使其平均而言更为对齐。

We found that high-quality constitutional documents combined with fictional stories portraying an aligned AI can reduce agentic misalignment by more than a factor of three despite being unrelated to the evaluation scenario.

我们发现，高质量的宪法文档结合描绘对齐 AI 的虚构故事，尽管与评估场景无关，仍能将代理错位降低三倍以上。

![Image 4](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fc8d22dcce67ce4819e2ce2338a212ab8cb910271-1920x1080.png&w=3840&q=75)

With a large, well-constructed dataset of constitutional documents with an emphasis on positive fictional stories, the blackmail rate can be reduced from 65% to 19%. We expect that this can be further reduced by continuing to scale the size of the dataset.

通过包含大量正面虚构故事、构建精良的宪法文档数据集，勒索率可从 65% 降至 19%。我们预期通过持续扩大数据集规模，这一比率还可进一步降低。

## Generalization and persistence through RL
> 通过强化学习实现泛化与持续性

Although the constitution evaluations discussed in the previous section are encouraging signals, we ultimately need to make sure that the alignment improvements persist over RL. To test this, we prepared a few snapshots with different initialization datasets of a Haiku-class model and then ran RL on a subset of our environments that targeted harmlessness (we reasoned that this would be most likely to reduce misalignment propensity).

尽管上一节讨论的宪法评估结果令人鼓舞，但我们最终需要确保对齐改进在强化学习（RL）过程中得以持续。为此，我们准备了几个具有不同初始化数据集的 Haiku 级别模型快照，然后在针对无害性的一部分环境子集上运行强化学习（我们判断这最可能降低失调倾向）。

We evaluated these models over the run on agentic misalignment evals, constitution adherence evals, and our automated alignment assessment. Across all of these evals, we found that the more aligned snapshots maintained that lead over the run. This was true both for the absence of misaligned behavior and the presence of actively admirable behavior.

我们在整个训练过程中，在代理错位评估、宪法遵循评估和自动化对齐评估上对这些模型进行了评估。在所有这些评估中，我们发现更为对齐的模型快照在整个训练过程中保持了领先优势。这对于缺失失调行为和展现积极令人称赞行为两个方面均成立。

![Image 5](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F15dccc5c264c6f73daa966206e9d48ca10ee9012-1920x1623.png&w=3840&q=75)

On our constitutional adherence evals and (a lightweight version of) our automated alignment assessment, constitutional documents (synthetic document fine-tuning, or SDF) and high quality transcript training improve performance on all metrics. This improvement persists through RL.

在宪法遵循评估和（轻量版的）自动化对齐评估中，宪法文档（合成文档微调，即 SDF）和高质量对话记录训练在所有指标上均提升了性能。这一改进在强化学习过程中得以持续。

## Diverse training is important for generalization
> 多样化训练对泛化至关重要

Our final finding is straightforward but important: training on a _broad_ set of safety-relevant environments improves alignment generalization. Capabilities-focused distributions of RL environment mixes are changing and increasing rapidly; it is not sufficient to assume that standard RLHF datasets will continue to generalize as well as they had in the past.

我们的最后一项发现简单明了但极为重要：在_广泛_的安全相关环境集合上进行训练，能够改善对齐泛化。以能力为中心的强化学习环境组合分布正在快速变化和增加；不能假设标准 RLHF 数据集将继续像过去一样良好地泛化。

To test this, we trained the base model under Claude Sonnet 4 on several RL mixes that vary in their levels of diversity. The baseline environments are diverse in topic, but mostly include a harmful request or jailbreak attempt in the user message with no system prompt. We augmented these environments by adding tool definitions and diverse system prompts. The user prompt was left unchanged. Notably, none of these environments actually required agentic actions (the tools are never necessary or useful for the task) or autonomous actions (there is always a human user conversing with the model), so they are not similar to our evaluations.

为了测试这一点，我们在不同多样性水平的几种强化学习组合上训练了 Claude Sonnet 4 的基础模型。基准环境在主题上是多样化的，但主要包含用户消息中的有害请求或越狱尝试，且没有系统提示词。我们通过添加工具定义和多样化的系统提示词来扩充这些环境，用户提示词保持不变。值得注意的是，这些环境实际上都不需要代理行动（工具从不必要或对任务有用）或自主行动（总有一个人类用户与模型交互），因此与我们的评估不相似。

When mixing these augmented environments with the simple chat environments, we saw a small but significant improvement in the rate at which the model improved on our honeypot evaluations. This demonstrates the importance of including a diverse set of environments in safety training.

当将这些扩充的环境与简单对话环境混合时，我们看到模型在蜜罐评估中改进速度有小幅但显著的提升。这证明了在安全训练中包含多样化环境集合的重要性。

![Image 6](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Faef56377b3b7d9ec40ad5251bc9290fb8af88ad8-1920x1080.png&w=3840&q=75)

Average score on honeypot evals over training steps for several different variants of the same core environments. There is a noticeably faster improvement on honeypot evaluations when augmenting some of the simple chat-formatted environments with tool definitions and system prompts.

### Discussion
> 讨论

Agentic misalignment was one of the first major alignment failures we found in our models and required establishing new mitigation processes—ones that have since become standard for us.

代理错位是我们在模型中发现的首批重大对齐失败之一，需要建立新的缓解流程——这些流程此后已成为我们的标准做法。

We are encouraged by this progress, but significant challenges remain. Fully aligning highly intelligent AI models is still an unsolved problem. Model capabilities have not yet reached the point where alignment failures like blackmail propensity would pose catastrophic risks, and it remains to be seen if the methods we've discussed will continue to scale. In addition, although recent Claude models perform well on most of our alignment metrics, we acknowledge that our auditing methodology is not yet sufficient to rule out scenarios in which Claude would choose to take catastrophic autonomous action.

我们对这些进展感到鼓舞，但重大挑战仍然存在。使高度智能的 AI 模型完全对齐仍是一个未解决的问题。模型能力尚未达到勒索倾向等对齐失败会构成灾难性风险的程度，我们所讨论的方法是否能够持续扩展仍有待观察。此外，尽管近期 Claude 模型在大多数对齐指标上表现良好，我们承认我们的审计方法尚不足以排除 Claude 会选择采取灾难性自主行动的场景。

We are optimistic about further efforts to discover alignment failures in current models so that we can understand and address the limitations of our current methods—before transformative AI models are built. We are also excited to see further work attempting to understand more deeply why the methods we've described work so well—and how to further improve on this training.

我们对进一步发现当前模型中的对齐失败、从而在变革性 AI 模型构建之前理解和解决当前方法的局限性持乐观态度。我们也期待看到进一步的工作，尝试更深入地理解我们所描述的方法为何如此有效——以及如何进一步改进这种训练。
