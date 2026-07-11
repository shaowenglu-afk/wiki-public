Title: Evaluating Claude's bioinformatics research capabilities with BioMysteryBench

URL Source: https://www.anthropic.com/research/Evaluating-Claude-For-Bioinformatics-With-BioMysteryBench

Markdown Content:
_In this post, Brianna_, _a researcher on the discovery team, shares results from a recent bioinformatics benchmarking effort._

_本文中，发现团队研究员 Brianna 分享了近期一项生物信息学基准测试工作的成果。_

Almost as soon as large language models could hold a conversation, people started asking how they'd stack up against human experts. Could models pass the bar exam? Could they answer medical licensing questions, or solve Olympiad math problems? Such _benchmarks_—self-contained sets of human-vetted problems designed to evaluate a capability of a model—have now become a source of competition across AI developers, reported in model release system cards and tracked on [many](https://huggingface.co/spaces/lmarena-ai/arena-leaderboard)[online](https://artificialanalysis.ai/)[leaderboards](https://epoch.ai/benchmarks).

大型语言模型刚刚能够进行对话，人们便开始追问它们与人类专家相比表现如何。模型能通过律师资格考试吗？能回答医学执照考试题目，或解出奥林匹克数学竞赛题吗？此类_基准测试_——专为评估模型某项能力而设计的自洽人工验证题集——如今已成为 AI 开发者之间的竞技场，出现在模型发布系统卡中，并被[多个](https://huggingface.co/spaces/lmarena-ai/arena-leaderboard)[在线](https://artificialanalysis.ai/)[排行榜](https://epoch.ai/benchmarks)所追踪。

Competition aside, benchmarks help us tackle an important question: whether models are capable and reliable enough to support, or even produce, professional-level work. Scientists [are using models](https://www.anthropic.com/news/accelerating-scientific-research) to write code for analysis pipelines, propose hypotheses, and draw conclusions from data with the long-term aim of [accelerating innovation and discovery](https://darioamodei.com/essay/machines-of-loving-grace#1-biology-and-health). But exactly how proficient is AI in science right now, and how quickly are Claude and other models improving?

竞争之外，基准测试帮助我们解答一个重要问题：模型是否足够能干和可靠，能够支持乃至产出专业水准的工作。科学家们[正在使用模型](https://www.anthropic.com/news/accelerating-scientific-research)为分析流水线编写代码、提出假设，并从数据中得出结论，长远目标是[加速创新与发现](https://darioamodei.com/essay/machines-of-loving-grace#1-biology-and-health)。但 AI 在科学领域目前究竟达到了怎样的水平，Claude 及其他模型又以怎样的速度进步？

To answer this, the research community has built several benchmarks. [MMLU-Pro](https://arxiv.org/abs/2406.01574) tests expert-level knowledge and reasoning questions. [GPQA](https://arxiv.org/abs/2311.12022) poses graduate-level, "Google-proof" questions in biology, physics, and chemistry. [LAB-Bench](https://arxiv.org/abs/2407.10362) tests biology-specific knowledge work—reading the literature, interpreting figures, reasoning about protocols. Although these benchmarks were developed in the "chatbot" era, they've persisted into the agent and tool-use era, joined by even more difficult scientific reasoning evals like [FrontierScience](https://arxiv.org/abs/2601.21165) and [Humanity's Last Exam](https://arxiv.org/abs/2501.14249), because knowledge and reasoning remain a vital measure of scientific capability.

为解答这一问题，研究社区构建了多个基准测试。[MMLU-Pro](https://arxiv.org/abs/2406.01574) 测试专家级知识与推理题目；[GPQA](https://arxiv.org/abs/2311.12022) 提出生物、物理和化学领域"谷歌无法检索到答案"的研究生水平问题；[LAB-Bench](https://arxiv.org/abs/2407.10362) 测试生物学专项知识工作——阅读文献、解读图表、推理实验方案。尽管这些基准最初在"聊天机器人"时代开发，但它们延续至代理与工具使用时代，并被 [FrontierScience](https://arxiv.org/abs/2601.21165) 和[人类最后的考试](https://arxiv.org/abs/2501.14249)等更为困难的科学推理评估所充实，因为知识与推理依然是衡量科学能力的核心指标。

Still, many real-world scientific tasks demand more than that. They require reading papers, querying databases, running experiments, coding and analysis. Now that models can do many of these things, benchmarks have evolved to reflect these workflows. [BLADE](https://blade-bench.github.io/) tasks a model with a dataset and an open-ended task, and checks if the model takes similar analysis steps to a human scientist. [BixBench](https://arxiv.org/abs/2503.00096) uses biological datasets, and grades models on whether their conclusions line up with scientists'. In [SciGym](https://arxiv.org/abs/2507.02083), the model is dropped into a simulated biology lab, where it has to design and run its own experiments to uncover a hidden mechanism.

然而，许多真实世界的科学任务需要的不止于此。它们要求阅读论文、查询数据库、运行实验、编写代码并进行分析。如今模型已能完成其中许多工作，基准测试也相应演进，以反映这些工作流程。[BLADE](https://blade-bench.github.io/) 向模型提供数据集和开放性任务，检验模型是否采用与人类科学家相似的分析步骤；[BixBench](https://arxiv.org/abs/2503.00096) 使用生物学数据集，并根据模型结论是否与科学家的结论吻合来评分；在 [SciGym](https://arxiv.org/abs/2507.02083) 中，模型被置于一个模拟生物实验室，需要自行设计并运行实验以揭示隐藏的机制。

These benchmarks move us closer to measuring scientific capability, but they don't quite test whether a model can devise creative solutions to the messy, open-ended problems that define research. This is why we developed BioMysteryBench, a bioinformatics benchmark that tasks Claude with the analysis of real-world datasets, while tackling some of the challenges inherent in evaluating complex and noisy biological systems. We learned that Claude's scientific capabilities in biology are improving rapidly across generations, that current models perform on par with human experts, and that the latest generations solved many problems that a panel of human experts could not, sometimes using very different strategies.

这些基准使我们更接近于衡量科学能力，但它们并未真正测试模型能否针对定义研究本质的那类混乱、开放式问题，创造性地提出解决方案。这正是我们开发 BioMysteryBench 的原因——这是一个生物信息学基准，要求 Claude 分析真实世界数据集，同时应对评估复杂、嘈杂生物系统时固有的挑战。我们发现，Claude 在生物学领域的科学能力正随代际快速提升，当前模型的表现与人类专家相当，而最新代次的模型解决了专家评审团无法解答的许多问题，有时采用的策略也大相径庭。

## Science is challenging, and so is evaluating it
> 科学本身充满挑战，评估科学同样如此

Doctors have board exams and lawyers have the bar, but there's no standardized test for becoming a scientist. The same problem shows up with AI. Despite how badly we want to use these models for science, no agentic science benchmark has become quite as canonical as [SWE-bench](https://arxiv.org/abs/2310.06770) is for software engineering. We think that's because scientific research, particularly biology, has several properties that make it especially hard to evaluate via a benchmark.

医生有执业考试，律师有资格考试，但科学家的成长却没有标准化考试。同样的问题出现在 AI 领域。尽管我们迫切希望将这些模型用于科学研究，但迄今没有任何代理科学基准能像 [SWE-bench](https://arxiv.org/abs/2310.06770) 之于软件工程那样成为标杆。我们认为，这是因为科学研究——尤其是生物学——具有若干使其特别难以通过基准测试来评估的特点。

### 1. In biology, there are many different "right" ways to do something
> 1. 在生物学中，同一件事有许多不同的"正确"做法

If there were only one right way to answer a research question, PhD students would earn their degrees in a matter of months, corporate R&D departments wouldn't exist, and no science fair poster would need a "Methods" section. How a scientist tackles a problem depends on their skills and background, the resources available to them, and their research taste.

如果回答科学问题只有一种正确方法，博士生早就能在数月内拿到学位，企业研发部门也就没有存在的必要，科学展海报也不需要"方法"一栏。科学家如何攻克一个问题，取决于其技能与背景、可用资源，以及其研究品味。

Consider a seemingly straightforward question that has mystified metabolic researchers for years: why do some type 2 diabetics respond to the oral drug metformin while others do not? In order to answer this question, you could run a genome-wide association (GWAS) study on responders vs. non-responders and look for predictive genetic variants, or sequence the gut microbiomes of both groups, since metformin is partly metabolized by gut bacteria. Both are reasonable directions, and how you proceed will often just depend on expertise and resources.

以一个看似简单却困扰代谢研究者多年的问题为例：为何部分 2 型糖尿病患者对口服药物二甲双胍有应答，而其他患者没有？为回答这一问题，你可以对应答者与非应答者开展全基因组关联研究（GWAS），寻找预测性遗传变异；也可以对两组人群的肠道微生物组进行测序，因为二甲双胍部分由肠道细菌代谢。两者都是合理的研究方向，如何推进往往只取决于专业知识和可用资源。

[BixBench](https://arxiv.org/abs/2503.00096) handles this well by grading the model on its conclusions rather than the method used to reach them. The tradeoff is that those conclusions were produced by an individual scientist who made a series of subjective choices along the way that may have shaped the answer itself. This, in turn, has its own pitfalls…

[BixBench](https://arxiv.org/abs/2503.00096) 通过对模型结论而非达成结论的方法评分，较好地处理了这一问题。代价是，这些结论由个别科学家产出，其在研究过程中做出的一系列主观选择可能已经影响了答案本身。这反过来带来了自身的陷阱……

### 2. Individual research decisions are highly subjective and can lead to entirely different conclusions in noisy datasets
> 2. 个人研究决策高度主观，在嘈杂数据集中可能导致截然不同的结论

Even within a chosen research direction, individual decisions can be highly subjective: one scientist may approve of a decision, while another researcher may have serious objections. Just ask any frustrated author who's gotten conflicting suggestions from a round of peer review! Making this all the more difficult is the fact that biological datasets are often noisy enough that small differences in research decisions can lead to entirely different conclusions about the data.

即便在既定研究方向内，个人决策也可能高度主观：一位科学家可能认可某个决策，另一位研究者则可能提出严重异议。问问任何在同行评审中收到相互矛盾意见的沮丧作者就知道了！更令这一切雪上加霜的是，生物学数据集往往嘈杂到这种程度：研究决策上的微小差异，可能导致对数据得出截然不同的结论。

In the decade-long search for metformin response predictors, slight differences in study design have led to entirely different conclusions about metformin response. A 2011 paper [reported a variant that predicts metformin response](https://www.nature.com/articles/ng.735) that replicated in two cohorts, with a plausible mechanism involving AMPK activation. A year later, the Diabetes Prevention Program [tested the same variant in pre-diabetics and found nothing](https://pmc.ncbi.nlm.nih.gov/articles/PMC3425006/). Finally, rather than spinning up their own study, a 2012 meta-analysis pooled five cohorts and once again decided [the 2011 paper's effect was real but more modest](https://pubmed.ncbi.nlm.nih.gov/22453232/) than originally reported.

在长达十年的二甲双胍应答预测因素探索中，研究设计上的细微差异导致了截然不同的结论。2011 年的一篇论文[报告了一个可预测二甲双胍应答的变异](https://www.nature.com/articles/ng.735)，该变异在两个队列中得到重复验证，且具有涉及 AMPK 激活的合理机制。一年后，糖尿病预防计划[在糖尿病前期患者中检验了同一变异，却一无所获](https://pmc.ncbi.nlm.nih.gov/articles/PMC3425006/)。最终，2012 年的一项元分析汇集了五个队列，再次认定 [2011 年论文的效应真实存在，但比最初报告的更为微弱](https://pubmed.ncbi.nlm.nih.gov/22453232/)。

[SciGym](https://arxiv.org/abs/2507.02083)'s clever way of handling such ambiguity is by choosing tasks with a well-defined answer. Because the underlying biological network is a simulator, there is, in fact, a ground-truth, and noise is controlled rather than inherited from a messy living system. However, it's unclear how closely performance in a simulated lab tracks performance on real data.

[SciGym](https://arxiv.org/abs/2507.02083) 处理此类歧义的巧妙方法是选择具有明确答案的任务。由于底层生物网络是模拟器，实际上存在客观真相，噪声也是受控的而非来自混乱的真实生命系统。然而，模拟实验室中的表现与真实数据上的表现相关程度如何，目前尚不明朗。

### 3. There are many biological questions that humans cannot answer yet
> 3. 有许多生物学问题人类尚无法回答

The research tasks where models could have the greatest impact are those that humans alone have yet to solve. And ultimately, those are precisely the tasks we'd like to be able to evaluate models on. What, for example, is the mechanism of action of metformin? Thirty years after its development, the field still is not certain of the primary target. Discovering it, or finding a homolog of metformin that is cheaper to synthesize and more stable, would be enormously consequential.

模型可能产生最大影响的研究任务，恰恰是人类独自尚未解决的那些。而最终，这些正是我们希望能够评估模型的任务。例如，二甲双胍的作用机制是什么？距其开发三十年后，该领域仍不确定其主要靶点。发现这一靶点，或找到一种合成成本更低、稳定性更强的二甲双胍类似物，将具有举足轻重的意义。

Machine learning has long tackled problems humans perform poorly at, like sequence prediction and protein modeling, by leaning on experimental data instead of expert intuition. [ProteinGym](https://www.biorxiv.org/content/10.1101/2023.12.07.570727v1.full) scores models on mutation fitness effects using Deep Mutational Scanning experiments as ground-truth, and the long-running [CASP](https://predictioncenter.org/) competition evaluates protein folding against unpublished crystal structures. Both are grounded in experimental measurements no expert would trust themselves to reproduce. However, these benchmarks are built around a narrow set of tasks and don't capture the breadth of bioinformatics work we actually want to measure.

机器学习长期以来通过依赖实验数据而非专家直觉，来攻克人类表现欠佳的问题，如序列预测和蛋白质建模。[ProteinGym](https://www.biorxiv.org/content/10.1101/2023.12.07.570727v1.full) 以深度突变扫描实验作为基准真值，对模型在突变适应度效应上进行评分；历史悠久的 [CASP](https://predictioncenter.org/) 竞赛则以未发表的晶体结构评估蛋白质折叠预测。两者均基于没有专家敢声称可以自主重现的实验测量结果。然而，这些基准围绕着狭窄的任务集构建，未能捕捉我们实际希望衡量的生物信息学工作的广度。

## Benchmarking models on verifiable biological tasks with BioMysteryBench
> 用 BioMysteryBench 在可验证生物学任务上评测模型

Because no benchmark perfectly handles the three aforementioned challenges, we developed BioMysteryBench. BioMysteryBench uses messy, real-world bioinformatics data, without allowing the complexity and challenges inherent in this data to corrupt the quality of the evaluation.

由于没有任何基准能够完美应对上述三项挑战，我们开发了 BioMysteryBench。BioMysteryBench 使用混乱的真实世界生物信息学数据，同时不允许这些数据固有的复杂性和挑战影响评估质量。

BioMysteryBench consists of 99 questions from various fields of bioinformatics, written by domain experts. Experts were instructed to gather a dataset, and create a question based on controlled, objective properties of the data, rather than unverifiable scientific conclusions. By deriving answers from an experimental or clinical finding, it was possible to develop questions without requiring they be human-solvable.

BioMysteryBench 由领域专家编写，包含 99 道来自生物信息学各领域的题目。专家被要求收集数据集，并基于数据的可控、客观属性——而非不可验证的科学结论——创建题目。通过从实验或临床发现中推导答案，可以在不要求题目必须能被人类解答的情况下开发题目。

Although these questions are created from verified ground truth, they still have the same flavor as tasks a research scientist would want to answer. Claude is tasked with each question and put in a container with a minimal set of canonical bioinformatics tools, the ability to install additional tools via pip and conda, and permissions to access canonical bioinformatics databases (such as NCBI and Ensembl) to download additional resources such as reference genomes.

尽管这些题目基于经过验证的基准真值创建，它们仍具有研究科学家希望解答的任务的特质。Claude 被分配每道题目，并在一个容器中运行，该容器配备了最小化标准生物信息学工具集、通过 pip 和 conda 安装额外工具的能力，以及访问标准生物信息学数据库（如 NCBI 和 Ensembl）以下载参考基因组等额外资源的权限。

BioMysteryBench has a tetrad of unique properties that make it a particularly powerful benchmark for science, and tackle the challenges above:

BioMysteryBench 具有四项独特属性，使其成为科学领域特别有力的基准，并应对了上述挑战：

1.   **It is method-agnostic, allowing for research freedom and creativity.**Claude is given relatively unrestricted access to downloading tools and accessing databases, allowing Claude to choose diverse sets of strategies for solving a problem. Furthermore, the trajectories are graded on their final answer, rather than the path the model took to get there. This frees BioMysteryBench from the subjective choices of any single researcher—models are rewarded for arriving at the right biological conclusion, regardless of which analytical route they chose to take.｜**它与方法无关，允许研究自由和创造性。**Claude 获得相对不受限制地下载工具和访问数据库的权限，允许 Claude 为解决问题选择多样化的策略组合。此外，轨迹依据最终答案而非模型到达该答案的路径来评分。这使 BioMysteryBench 摆脱了任何单个研究者的主观选择——无论模型选择哪条分析路径，只要得出正确的生物学结论就能获得奖励。
2.   **Questions have objective, ground truth answers.**Answers aren't drawn from scientists' conclusions (which suffer from the challenges above) but from controllable properties of the data, or orthogonally validated metadata. For example, "What organism does this crystal structure belong to?" has an objective answer, and "What viral species is the human patient infected with, based on the RNA-seq data?" is a metadata property of a sample that was validated by a PCR assay.｜**题目具有客观的基准真值答案。**答案不是来自科学家的结论（科学家的结论存在上述挑战），而是来自数据的可控属性或正交验证的元数据。例如，"这个晶体结构属于哪种生物？"有客观答案，而"根据 RNA-seq 数据，该人类患者感染了哪种病毒？"则是经 PCR 检测验证的样本元数据属性。
3.   **It allows for "superhuman" question generation.** By sourcing problems derived from controllable properties of data, BioMysteryBench does not depend on humans being able to solve the problems. In particular, BioMysteryBench contains a handful of problems that—despite having objective, ground-truth solutions—humans found difficult or impossible to solve on their own.｜**它允许"超人类"题目生成。**通过将题目来源于数据的可控属性，BioMysteryBench 不依赖于人类能够解决这些问题。特别是，BioMysteryBench 包含少量尽管有客观基准真值答案，但人类自己发现难以或不可能解答的问题。

## Example questions
> 示例题目

In developing this eval, questions were primarily derived from raw or minimally processed DNA or RNA sequencing data since this is where many biological processing pipelines begin (WGS, scRNA-seq, methylation, ChIP-seq, metagenomics, Hi-C), and also included several questions drawn from proteomics and metabolomics.

在开发此评估时，题目主要来源于原始或经最小处理的 DNA 或 RNA 测序数据，因为这是许多生物处理流水线的起点（WGS、scRNA-seq、甲基化、ChIP-seq、宏基因组学、Hi-C），同时也包含若干来源于蛋白质组学和代谢组学的题目。

Questions developers came up with included:

题目开发者提出的问题包括：

*   _Which human organ is this cell type single-cell RNA-seq dataset derived from?_｜_这个细胞类型单细胞 RNA-seq 数据集来源于哪个人类器官？_
*   _What gene was knocked out in the experimental samples compared to the control samples based on RNA-seq data?_｜_根据 RNA-seq 数据，与对照样本相比，实验样本中哪个基因被敲除？_
*   _From WGS sequences, what sample is the mother of sample X and what sample is the father?_｜_从全基因组测序序列来看，样本 X 的母亲是哪个样本，父亲是哪个样本？_
*   _Which of the bigWig files are from ChIP samples and which are from input controls?_｜_哪些 bigWig 文件来自 ChIP 样本，哪些来自输入对照？_
*   _Given H3K27ac ChIP-seq peaks from an unknown cell type, identify the cell type._｜_给定来自未知细胞类型的 H3K27ac ChIP-seq 峰值，识别该细胞类型。_

To minimize inherently unsolvable questions while still leaving room for those that might be AI-solvable, we required each question author to submit a validation notebook demonstrating that the signal does, in fact, exist in the data (even if finding it from scratch might be difficult). Think of this as the high-school algebra principle: verifying an answer is much easier than deriving one.

为了在尽量减少固有无解题目的同时，仍为 AI 可能可解的题目留有余地，我们要求每位题目作者提交一个验证笔记本，证明信号确实存在于数据中（即使从零开始找到它可能很困难）。可以将其类比为高中代数原则：验证答案比推导答案容易得多。

## Human baselining
> 人类基线

### Human-solvable
> 人类可解题目

For each question, we tasked up to five domain experts to answer the question from scratch. Once a question was answered correctly by at least one human, we considered it human-solvable. BioMysteryBench contained 76 such tasks.

对于每道题目，我们让最多五名领域专家从零开始解答。一旦至少有一名人类正确回答了某道题目，我们便认为该题目是人类可解的。BioMysteryBench 包含 76 道此类任务。

![Image 1: Graph of accuracy on human-solvable problems](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F291077c3785708a54dbb4421db3751b1d1c4ba84-1920x1080.png&w=3840&q=75)

Fig 1: Accuracy averaged over 5 trials per 76 human-solvable problems. Error bars computed by bootstrap sampling within problems.

Sometimes Claude mirrored human strategies. Perhaps humans have landed on a near-optimal approach, or because the method is well-represented in pretraining data.

有时 Claude 会与人类策略不谋而合。这也许是因为人类已发现了接近最优的方法，或者是因为该方法在预训练数据中有充分代表。

Other times, Claude took a completely different route, illustrating there is no strictly correct way to solve these problems and that models may have genuine preferences that diverge from ours.

另一些时候，Claude 采用了截然不同的路径，这表明解决这些问题并无唯一正确的方式，模型可能具有与我们不同的真实偏好。

The examples above showcase a particularly interesting strategy: whereas our human experts used algorithms or databases to identify and annotate properties of a dataset, Claude intuitively recognizes certain patterns or sequences. Admittedly, such clever abstraction is not entirely unique to AI—the first eukaryotic promoter, for example, was discovered when a scientist noticed the sequence "TATA" appearing over and over in sequences upstream of genes. _Intuition_ like this has been difficult to build into traditional biology machine learning models, but LLMs might be able to turn up patterns like this at unprecedented scale.

上述示例展示了一种特别有趣的策略：人类专家使用算法或数据库来识别和标注数据集的属性，而 Claude 则能直觉性地识别某些模式或序列。诚然，这种巧妙的抽象能力并非 AI 所独有——例如，第一个真核启动子的发现，正是源于一位科学家注意到"TATA"序列反复出现在基因上游序列中。然而，这种_直觉_长期以来难以融入传统的生物学机器学习模型，而大型语言模型则可能以前所未有的规模发现此类模式。

### Human-difficult
> 人类难以解答的题目

That left us with a set of questions that could not be solved by our panel of experts. This could mean (1) the question was malformed or broken, (2) the question is inherently unsolvable (e.g.,the signal isn't in the data), or (3) the question is theoretically solvable but humans lack the knowledge required to solve it. After QC'ing with benchmarkers and additional experts, we removed 4 questions that were due to (1), leaving 23 human-difficult questions.

这给我们留下了一组专家评审团无法解决的题目。这可能意味着：(1) 题目存在缺陷或错误，(2) 题目固有无解（例如，数据中不存在信号），或 (3) 题目理论上可解，但人类缺乏解决它所需的知识。经过基准测试人员和其他专家的质控，我们移除了 4 道属于情况 (1) 的题目，剩余 23 道人类难以解答的题目。

![Image 2: Graph showing performance on human-difficult problems](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F0aed26a846ccd67d813a2c14f78069216671c8e3-1920x1080.png&w=3840&q=75)

Fig 2: Accuracy over the set of problems humans were not able to solve, averaged across 5 episodes per problem. Error bars computed by bootstrap sampling within problems.

Interestingly, Claude Sonnet 4.6 and more capable models were able to solve significant fractions of human-difficult problems, with Claude Mythos Preview topping out at a 30% solve rate. So what exactly is Claude doing that humans aren't?

有趣的是，Claude Sonnet 4.6 及更强能力的模型能够解决相当比例的人类难以解答的题目，Claude Mythos Preview 的解答率高达 30%。那么 Claude 究竟做了人类没有做的什么？

## Claude's strategies
> Claude 的策略

Analyzing transcripts from Opus 4.6, we identified two primary strategies used by Claude compared to humans: one is fairly AI-specific: Claude's vast underlying knowledge base contains information about structural biology, molecular profiles, and meta-analysis from hundreds of thousands of papers. The other strategy is something we human scientists could learn from: when Claude is uncertain about an answer, it layers multiple methods and combines different lines of evidence to arrive at a conclusion.

通过分析 Opus 4.6 的对话记录，我们发现了 Claude 相比人类使用的两种主要策略：一种相当 AI 特有：Claude 庞大的底层知识库包含来自数十万篇论文的结构生物学、分子谱和元分析信息。另一种则是人类科学家可以借鉴的：当 Claude 对答案不确定时，它会叠加多种方法，综合不同的证据线索来得出结论。

### Know-it-all
> 博学多识

In some of the human-difficult tasks, Opus's vast underlying knowledge base helped it solve the problem. Tasks that would require a human expert to run a meta-analysis or stitch together databases, Opus solved directly by combining its internal knowledge of mechanisms and ontologies with live analysis. Often, this allowed Claude to solve human-unsolvable tasks! Here are a few examples:

在一些人类难以解答的任务中，Opus 庞大的底层知识库帮助它解决了问题。需要人类专家进行元分析或整合数据库才能完成的任务，Opus 通过将其对机制和本体论的内部知识与实时分析相结合，直接解决了。这往往使 Claude 得以解决人类无法解答的任务！以下是一些示例：

Even though prior knowledge seemed overwhelmingly helpful to Claude, we saw one interesting case (in the human-solvable set) where this became its downfall:

尽管先验知识对 Claude 似乎大有裨益，但我们也看到一个有趣的案例（在人类可解题目集中），在这里先验知识反而成了它的败因：

### Knowing when you don't know
> 知道自己不知道的时候

When Opus 4.6 was not confident about an answer, it often tried multiple different ways of solving the problem and chose the answer that multiple approaches converged on.

当 Opus 4.6 对答案缺乏信心时，它通常会尝试多种不同的解题方式，并选择多种方法汇聚于同一结论的答案。

Like many of the benchmarks we've discussed, BioMysteryBench has its own limitation: for tasks that neither humans nor models have solved, we can never be fully certain whether they're impossible or just extraordinarily difficult. The validation notebooks help ensure the signal is there and the data is well-formed, but they do not guarantee a model or human can find the answer from scratch. So we ask both our models and our human benchmarkers not to be too frustrated if, a year from now, no one has solved the human-difficult set. That uncertainty is also part of what makes the benchmark exciting: a more scientifically capable model might be the first to crack a problem that no human or model has solved before.

与我们讨论过的许多基准一样，BioMysteryBench 也有其局限性：对于人类和模型都未能解决的任务，我们永远无法完全确定它们是不可能解答还是仅仅极度困难。验证笔记本有助于确保信号的存在和数据的完整性，但不能保证模型或人类能够从零开始找到答案。因此，如果一年后仍无人解决人类难以解答的题目集，我们希望我们的模型和人类基准测试人员都不要过于沮丧。这种不确定性本身也是使基准令人兴奋的一部分：一个科学能力更强的模型，可能会率先攻克一个此前没有任何人类或模型解决过的问题。

## Claude's take on AI for science
> Claude 对 AI 用于科学的看法

Claude showed solid improvement across generations and did well enough at both the human-solvable and human-difficult tasks that we thought it would be interesting to let Claude Mythos Preview conduct some of its own scientific analysis. Here are a couple of additional insights about its predecessor Claude's performance on BioMysteryBench:

Claude 展现出跨代际的稳健进步，在人类可解和人类难以解答的任务上均表现出色，这让我们认为让 Claude Mythos Preview 进行一些自己的科学分析将是一件有趣的事情。以下是 Claude Mythos Preview 对其前代 Claude 在 BioMysteryBench 上表现的若干额外见解：

`The headline accuracy numbers tell you how often each model gets the right answer, but not how it gets there. I wanted to know whether a correct answer on a hard problem means the same thing as a correct answer on a solvable one. Since every problem was attempted five times, I could look at per-problem solve counts: if a model solves something 5/5 it has a reliable method; if it solves it 1/5 it probably got lucky on a reasoning path it can't consistently find again. So I broke each model's solved problems down by solve count (0/5 through 5/5) on the two sets side by side.`

![Image 3: Chart showing per-problem solve consistency on BioMysteryBench.](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F3840cd87380589c9f00c31d5b9334639ebfb5303-1920x1080.png&w=3840&q=75)

Fig 3. Per-problem solve consistency on BioMysteryBench. Each model attempted every problem five times; bars show the share of problems solved 0, 1, 2, 3, 4, or 5 times out of 5. On the human-solvable set (left), all three models are strongly bimodal—problems are almost always solved either every time or never. On the human-difficult set (right), the middle of the distribution fills in: a much larger fraction of each model's correct answers come from problems it solves only once or twice in five tries, indicating that difficult-set wins are often lucky reasoning paths rather than reliably reproducible solutions.

`The texture of "solved" changes sharply between the two sets. On human-solvable problems, Opus 4.6 is strongly bimodal — 86% of the problems it solves at all, it solves at least 4 out of 5 times. It either has the answer or it doesn't. On the human-difficult set that collapses to 44%, and the share of brittle wins (solved only 1–2 of 5 attempts) jumps from 9% to 44%. Sonnet 4.6 shows the same shift, and more sharply (75% reliable → 22%; 9% brittle → 56%). So the 77.4%→23.5% headline drop actually understates what's happening: on solvable problems the model is retrieving something it reliably knows, while on hard problems nearly half of its wins are paths it stumbles onto rather than reproduces. The accuracy gap is real, but the reliability gap underneath it is the more interesting story about where the capability frontier actually sits. Opus 4.7 and Mythos move the frontier a little (Mythos gets 94% of its solvable wins at ≥4/5) but the same bimodal-vs-brittle split holds on the difficult set for every model.`

We thought Claude Mythos Preview's analysis held up and dove deeper into reliability, which is an important metric to measure model performance on. However, it also felt a little…boring? It added some nuance to the performance analysis we showed above, but did not fundamentally tackle a new question. Despite this, it seems like the models are starting to develop the seeds of research taste (even if they have a ways to go before producing deep insight).

我们认为 Claude Mythos Preview 的分析站得住脚，并深入探讨了可靠性——这是衡量模型性能的重要指标。然而，它也给人一种……有些无聊的感觉？它为我们上面展示的性能分析增加了一些细微之处，但并没有从根本上解答一个新问题。尽管如此，这些模型似乎正开始萌发研究品味的雏形（即便距离产出深刻洞见还有很长的路要走）。

## Continuing to benchmark AI for science
> 持续对 AI 的科学能力进行基准测试

BioMysteryBench is an encouraging measure of scientific capability. The most recent generations of Claude solve the majority of human-solvable problems reliably, and on a meaningful fraction of human-difficult tasks, it outperforms panels of five domain experts. Models are improving across generations, and are no longer merely keeping up with trained scientists on bioinformatics problems; on some tasks, they're ahead.

BioMysteryBench 是对科学能力的一项令人鼓舞的衡量。最新代次的 Claude 能够可靠地解决大多数人类可解题目，并在相当比例的人类难以解答的任务上超越五位领域专家的评审团。模型正在逐代改进，在生物信息学问题上不再仅仅跟上经过专业训练的科学家；在一些任务上，它们已经领先。

We're also delighted to see convergent work in this space: While finalizing this post, Genentech and Roche released [CompBioBench](https://www.biorxiv.org/content/10.64898/2026.04.06.716850v1). Their benchmark consists of 100 computational biology tasks "based on synthetic/augmented data and metadata scrambling/scrubbing of real datasets to create challenging problems with a single ground-truth answer that require multi-step reasoning, tool use, bespoke code, and interaction with real-world external resources." Sound familiar? Their results echo those of BioMysteryBench, too: Claude Opus 4.6 reaches 81% overall and 69% on their hardest questions, reinforcing that frontier models are now genuinely useful collaborators for bioinformatics research.

我们也很高兴看到该领域出现了殊途同归的工作：在本文最终定稿之际，基因泰克（Genentech）和罗氏（Roche）发布了 [CompBioBench](https://www.biorxiv.org/content/10.64898/2026.04.06.716850v1)。他们的基准包含 100 道计算生物学任务，"基于合成/增强数据和对真实数据集的元数据打乱/清洗，创建具有单一基准真值答案的挑战性问题，需要多步推理、工具使用、定制代码以及与真实外部资源的交互"。听起来很熟悉？他们的结果也与 BioMysteryBench 相呼应：Claude Opus 4.6 在整体上达到 81%，在最难题目上达到 69%，进一步证明前沿模型现在已经是生物信息学研究中真正有用的合作伙伴。

We're eager to build even longer-horizon, real-world tasks that push model research capabilities, and to hear creative ideas from others. Send us your interesting benchmarks, innovative uses of AI for science, and interactions with AI that prompted you to rethink what could be possible in your field at scienceblog@anthropic.com.

我们渴望构建更长时间跨度、更贴近真实世界的任务，以推动模型科研能力的提升，并期待听到他人的创意想法。请将您感兴趣的基准、AI 在科学中的创新应用，以及令您重新思考本领域可能性的 AI 互动体验，发送至 scienceblog@anthropic.com。

If you are interested in understanding how models perform on difficult verifiable computational biology tasks, you can [access BioMysteryBench here](https://huggingface.co/datasets/Anthropic/BioMysteryBench-preview) and visit [claude.com/lifesciences](http://claude.com/lifesciences) to learn more.

如果您有兴趣了解模型在困难可验证计算生物学任务上的表现，可以[在此访问 BioMysteryBench](https://huggingface.co/datasets/Anthropic/BioMysteryBench-preview)，并访问 [claude.com/lifesciences](http://claude.com/lifesciences) 了解更多信息。
