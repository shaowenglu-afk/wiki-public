Title: Making Claude a chemist

URL Source: https://www.anthropic.com/research/making-claude-a-chemist

Markdown Content:
_We're working with world-class synthetic, computational, and analytical chemists to make Claude better at chemistry. In this post, we share our first work as part of this effort, in which Anthropic chemist, David Kamber, examines how Claude performs on a chemist's most common analytical input, an NMR spectrum._ When working with molecules, chemists move between hand-drawn structures on a whiteboard, instrument readouts, database query strings, and the technical notations of patents and publications. Each of these representations encodes the same underlying chemistry, but each demands a different kind of fluency. A sketch of caffeine, for example, allows a chemist to spot its resemblance to adenosine, the body's drowsiness signal, and predict that it keeps us alert by blocking the receptor. However, that same sketch cannot help a chemist tell it apart from other near-identical looking molecules.
_我们正在与世界顶级合成化学家、计算化学家和分析化学家合作，让 Claude 在化学领域表现更出色。在本文中，我们分享这一努力的首批成果——Anthropic 化学家 David Kamber 研究了 Claude 在化学家最常见的分析输入（NMR 谱图）上的表现。_ 在处理分子时，化学家需要在白板上的手绘结构、仪器读数、数据库查询字符串以及专利和出版物中的技术符号之间来回切换。每种表示形式都编码了相同的底层化学信息，但每种都要求不同类型的流利度。例如，咖啡因的草图让化学家能够发现它与腺苷（体内的困倦信号）的相似性，并预测它通过阻断受体让我们保持警觉。然而，同样的草图无法帮助化学家将其与其他外观几乎相同的分子区分开来。

Understanding what molecule a chemist is working with is critical. Chemistry undergirds everything from the foods and medicine we ingest to our lotions, paints, and plastics. Reroute a handful of bonds among the same atoms, and glucose becomes fructose, molecules sharing a formula but processed through entirely different metabolic pathways. Flip a molecule into its mirror image, and a sedative becomes a teratogen, as happened in the [thalidomide](https://pubmed.ncbi.nlm.nih.gov/21507989/) disaster.1 Chemists' everyday work depends on reading these signals correctly across whichever representation befits a given task.
了解化学家正在研究的分子至关重要。化学是一切事物的基础，从我们摄入的食物和药物，到我们的乳液、涂料和塑料。在相同的原子之间重新安排几个化学键，葡萄糖就变成了果糖——两种分子共享同一分子式，却通过完全不同的代谢途径被处理。将一个分子翻转成其镜像，镇静剂就变成了致畸物，正如沙利度胺（thalidomide）灾难中发生的那样。1 化学家的日常工作依赖于在适合给定任务的任何表示形式中正确读取这些信号。

Translating between these representations (chasing down a structure from a figure, reconciling an instrument readout against a proposed product, querying a database in the right notation) is time consuming and impossible to keep up with at scale—CAS, the largest chemistry registry, catalogs over 290 million disclosed substances and grows by roughly 15,000 new ones every day.
在这些表示形式之间进行转换（从图中追踪结构、将仪器读数与拟议产品对照、以正确的表示法查询数据库）既耗时又难以在规模上跟上——CAS（最大的化学登记机构）收录了超过 2.9 亿种已披露物质，每天增加约 15,000 种新物质。

AI is well-positioned to take on this research burden, yet it still remains largely aspirational in the context of chemistry. Machine-learning tools have been positioned for years as transformative for retrosynthesis—the process of working backward from a target molecule to simpler precursors to plan how to build it—reaction prediction, and property estimation, but the data those tools need have been hard to come by—sparse on null-results, inconsistent in format, and locked behind paywalls at subscription journals (and in unstructured supporting information). Retrosynthesis is a case in point—capable AI tools have existed for years, but adoption is uneven, and the average academic or small-lab chemist still doesn't use them.
AI 处于承担这一研究负担的有利位置，但在化学领域，这在很大程度上仍停留于愿景阶段。多年来，机器学习工具一直被定位为逆合成（从目标分子反推到更简单的前体以规划合成路径）、反应预测和性质估算的变革性工具，但这些工具所需的数据一直难以获得——阴性结果数据稀少、格式不一致，且被锁在订阅期刊的付费墙后（以及非结构化的补充信息中）。逆合成就是一个典型例子——有能力的 AI 工具已经存在多年，但采用率参差不齐，普通学术界或小实验室的化学家仍然不使用它们。

Even so, advancements in AI are finally reaching chemistry. Today's frontier models are multimodal, and capable of explicit reasoning. They can read a chemical structure directly from a journal figure or hand sketch rather than depending on a pre-curated molecular database. And they can read the experimental detail of a methods section or supporting information in the form it is actually published. They can also show their reasoning step by step, which means a chemist can audit the outputs. None of this eliminates the data problem the field has been describing for years, but it changes which problems are tractable despite it.
即便如此，AI 的进步终于在化学领域开始显现。今天的前沿模型是多模态的，能够进行显式推理。它们可以直接从期刊图表或手绘草图中读取化学结构，而不依赖于预先整理的分子数据库。它们还可以以实际发表的形式读取方法部分或补充信息中的实验细节。它们还可以逐步展示推理过程，这意味着化学家可以审核输出结果。这些都不能消除该领域多年来描述的数据问题，但它改变了尽管存在数据问题仍可处理的问题范围。

Ultimately, our claim is a modest one: Claude is starting to meaningfully assist chemists with the daily translation, recall, and integration work that complements their judgment, and we plan to keep extending its helpfulness. Today we are publishing the first white paper in the effort to accelerate this work. It tackles a chemist's most common analytical input: an NMR spectrum.
归根结底，我们的主张是谦逊的：Claude 开始以有意义的方式协助化学家完成补充其判断力的日常翻译、回忆和整合工作，我们计划继续扩展其实用性。今天我们发布了加速这项工作的第一份白皮书，它解决的是化学家最常见的分析输入：NMR 谱图。

## Claude vs. ChemDraw on NMR prediction and structure elucidation
> Claude 与 ChemDraw 在 NMR 预测和结构解析上的对比

**Full version can be found [here](https://www-cdn.anthropic.com/07441e654ad3dfeb0cd090e9361511562825d012.pdf)**
**完整版可在此处找到**

Nearly every small molecule—drug, pesticide, dye, fragrance, polymer, DNA or protein subunit, and functional inorganic or solid-state material—exists because a chemist determined its structure. Given that these molecules cannot be seen with microscopes, chemists must rely on spectral analysis, probing a molecule with light, radio waves, or magnetic fields. The way a given molecule absorbs, emits, or deflects this energy gives chemists a pattern, or spectrum, with which they can elucidate its structure.
几乎每一种小分子——药物、农药、染料、香料、聚合物、DNA 或蛋白质亚基，以及功能性无机或固态材料——的存在都是因为化学家确定了其结构。由于这些分子无法用显微镜看到，化学家必须依靠光谱分析，用光、无线电波或磁场探测分子。给定分子吸收、发射或偏转这种能量的方式会给化学家提供一种模式或谱图，他们可以借此解析其结构。

NMR spectroscopy—one of the canonical techniques chemists rely on for this—is one of the most time-consuming steps in synthetic chemistry; for every compound, a chemist has to match each peak in the spectrum to an atom in the proposed structure by hand. For this white paper, we tested how Claude fared against the dedicated NMR software chemists rely on today. We measured three Claude models (Opus 4.7, Opus 4.6, Sonnet 4.6) against ChemDraw and MestReNova on 20 compounds drawn from synthetic chemistry preprints published after the models' training cutoff so as to avoid selection bias. Both ChemDraw and MestReNova do forward prediction, using a drawn structure to simulate what NMR spectrum will be produced. In addition to forward prediction, we also wanted to see whether Claude could go the other direction—starting from an experimental spectrum and proposing the structure behind it. This is the harder task, and the one existing software currently leaves to the chemist.
NMR 光谱法（核磁共振光谱法）是化学家赖以使用的标准技术之一，也是合成化学中最耗时的步骤之一；对于每种化合物，化学家都必须手动将谱图中的每个峰与拟议结构中的某个原子对应起来。为了这份白皮书，我们测试了 Claude 与化学家今天所依赖的专用 NMR 软件的对比。我们在 20 种化合物上测量了三个 Claude 模型（Opus 4.7、Opus 4.6、Sonnet 4.6）与 ChemDraw 和 MestReNova 的对比，这些化合物来自模型训练截止日期之后发布的合成化学预印本，以避免选择偏差。ChemDraw 和 MestReNova 都进行正向预测，使用绘制的结构来模拟将产生什么 NMR 谱图。除正向预测外，我们还想看看 Claude 是否能反向操作——从实验谱图出发，提出其背后的结构。这是更难的任务，也是现有软件目前留给化学家来完成的任务。

To set up our assessment, we pulled 20 compounds from ChemRxiv preprints 2 posted after the models' training cutoff, taking the first fully characterized novel molecules from each paper. The 20 span four structural families, five compounds each, with each family selected because it involves a different category of NMR challenge. Each tool was given the structure encoded as a SMILES string—the line-of-text notation chemists use to input a molecule to software—and was asked to predict where every hydrogen and carbon peak would fall along a 1D NMR spectrum (a horizontal axis measuring chemical shifts in ppm, parts per million). Given that NMR samples are dissolved in a liquid, and that the choice of solvent (chloroform, DMSO, etc.) moves the peak positions slightly, each tool was told to predict the spectrum in whatever solvent the chemists had used in the published paper.
为了建立评估基准，我们从模型训练截止日期之后发布的 ChemRxiv 预印本2 中提取了 20 种化合物，取每篇论文中第一个经过完全表征的新型分子。这 20 种化合物跨越四个结构家族，每个家族五种，选择各家族是因为它们涉及不同类别的 NMR 挑战。每种工具都获得了编码为 SMILES 字符串（化学家用于向软件输入分子的文本行表示法）的结构，并被要求预测每个氢和碳峰在一维 NMR 谱图（衡量化学位移的横轴，以 ppm 即百万分之一为单位）上的位置。鉴于 NMR 样品溶解在液体中，且溶剂（氯仿、DMSO 等）的选择会略微移动峰的位置，每种工具都被告知以化学家在发表论文中使用的溶剂进行谱图预测。

![Image 1: A graph of the four scaffold classes](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F6a37f20bd02f14cc408383f98974cee81486fa2d-1920x865.jpg&w=3840&q=75)

_Figure 1. Four scaffold classes covered by the forward-prediction assessment. Each probes a different category of NMR challenge. P1 chloropyridazines have a slow-exchange NH on aminopyridazine in DMSO-d₆; P2 Boc-N-aryl maleimides and N-Boc ynamides exercise α-vinyl-imide carbonyls and the rare ynamide α/β-carbon pair; P3 spiroketones are spirobicyclic ketones with phenacyl or acetyl pendants and diastereotopic CH₂; P4 α-silyl methanesulfonamides have shielded silicon-α carbons. Five compounds per class, n = 20 total._
图 1. 正向预测评估涵盖的四个骨架类别。每类探索不同类别的 NMR 挑战。P1 氯哒嗪类在 DMSO-d₆ 中具有氨基哒嗪上的慢交换 NH；P2 Boc-N-芳基顺丁烯二酰亚胺和 N-Boc 炔酰胺考察 α-乙烯基亚胺羰基和罕见的炔酰胺 α/β 碳对；P3 螺酮是带有苯酰基或乙酰基悬挂基团和非对映位 CH₂ 的螺双环酮；P4 α-硅烷基甲磺酰胺具有屏蔽的硅-α 碳。每类五种化合物，共 n = 20。

Because a language model's output varies between runs, each Claude model was queried three times per compound and averaged; ChemDraw and MestReNova return the same answer every time and were run once. We then paired each predicted peak with its experimental counterpart and measured the gap in ppm. These landed within the window a chemist would call correct—±0.20 ppm for hydrogen or ±1.0 ppm for carbon.
由于语言模型的输出在不同运行之间会有所不同，每个 Claude 模型对每种化合物查询三次并取平均值；ChemDraw 和 MestReNova 每次返回相同的答案，仅运行一次。然后我们将每个预测峰与其实验对应值配对，并测量 ppm 差距。这些差距落在化学家会称为正确的窗口内——氢原子为 ±0.20 ppm，碳原子为 ±1.0 ppm。

![Image 2: A graphic depicting the per-tool MAE/RMSE summary across 20 compounds](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F8269748a860db6f9b3fddd3e9e6116c193cbb399-1200x675.jpg&w=3840&q=75)

_Figure 2. Per-tool MAE (darker shade) and RMSE (lighter shade) for ¹H (left) and ¹³C (right) shift errors across 20 compounds for forward prediction, with coverage shown beneath each tool. Claude bars: mean across three replicates with min–max range and overlaid replicate dots. Classical tools: single-point predictions (no range)._
图 2. 20 种化合物正向预测中各工具的 ¹H（左）和 ¹³C（右）化学位移误差的平均绝对误差（MAE，深色）和均方根误差（RMSE，浅色），每种工具下方显示覆盖率。Claude 柱状图：三次重复的平均值，带最小-最大范围和叠加的重复点。经典工具：单点预测（无范围）。

On hydrogen, Opus 4.7 was most accurate, with an average error of ±0.079 ppm—well under half the tolerance window—and the highest share of peaks landing inside it. On carbon, Opus 4.7 and MestReNova were effectively tied, at ±1.37 and ±1.48 ppm; the remaining tools kept the same rank order on both elements. Opus 4.6 was predictably middling, and Sonnet 4.6 was the weakest. The gap between them was most evident on a single notoriously difficult hydrogen—an NH proton in the chloropyridazine family whose true position falls in a narrow band between 6.8 and 7.9 ppm. Opus 4.7 placed it slightly low but consistently so; Opus 4.6 scattered its guesses across several ppm; Sonnet 4.6 put it in the 10–13 range, well outside where it actually appears.
在氢原子方面，Opus 4.7 最为准确，平均误差为 ±0.079 ppm——远低于容差窗口的一半——且落在容差窗口内的峰占比最高。在碳原子方面，Opus 4.7 和 MestReNova 实际上持平，分别为 ±1.37 和 ±1.48 ppm；其余工具在两种元素上保持相同的排名顺序。Opus 4.6 的表现如预期般居中，Sonnet 4.6 最弱。两者之间的差距在一个出了名难以预测的氢原子上最为明显——氯哒嗪家族中的一个 NH 质子，其真实位置落在 6.8 到 7.9 ppm 之间的窄带内。Opus 4.7 将其放置得略低，但一致性好；Opus 4.6 的猜测分散在几个 ppm 上；Sonnet 4.6 将其放在 10-13 范围，远超其实际位置。

![Image 3: A chart depicting within-tolerance accuracy per compound](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F62a7baa0bd66c26b5b5966e3578b87b62541e708-1920x1386.png&w=3840&q=75)

_Figure 3. Top: % of experimental atoms within ±0.20 ppm (¹H, left) and ±1.0 ppm (¹³C, right). Bottom: per-compound win rate (compounds where the tool had the lowest per-compound MAE, out of 20). Claude bars: mean across three replicates with min–max range; classical tools: single-point predictions._
图 3. 上：实验原子落在 ±0.20 ppm（¹H，左）和 ±1.0 ppm（¹³C，右）内的百分比。下：逐化合物胜率（工具具有最低逐化合物 MAE 的化合物，共 20 种）。Claude 柱状图：三次重复的平均值，带最小-最大范围；经典工具：单点预测。

While Opus 4.7 performed fairly comparably to ChemDraw and MestReNova, the gap was wider on predicting the shape taken by a hydrogen's NMR peak and how far apart the peaks sit, features which also contain structural information a chemist reads alongside position. Opus 4.7 matched the experimentally reported splitting pattern more often than any other tool, and all three Claude models predicted the sub-peak spacing to within half a hertz roughly 80% of the time—against 26 to 35% for ChemDraw and MestReNova. Opus 4.7 was also the most consistent across its three repeat runs: its average error varied less from run to run than the margin separating it from the next-best tool.
虽然 Opus 4.7 与 ChemDraw 和 MestReNova 的总体表现相当，但在预测氢 NMR 峰的形状以及峰间距方面差距更大——这些特征也包含了化学家与位置一同读取的结构信息。Opus 4.7 比任何其他工具更频繁地匹配到实验报告的裂分模式，而且所有三个 Claude 模型在约 80% 的时间里将子峰间距预测到半赫兹以内——而 ChemDraw 和 MestReNova 的这一比例为 26% 到 35%。Opus 4.7 在其三次重复运行中也最为一致：其平均误差从运行到运行的变化，比将其与次佳工具分开的差距更小。

From there, we evaluated inverse prediction (structure elucidation): could we determine the structure of a molecule from its spectrum? We gave Opus 4.7 15 elucidation problems and asked it, three times each, to propose up to three ranked candidate structures. Each supplied the compound's exact molecular formula (from high-resolution mass spectrometry) and its hydrogen and carbon NMR spectra. The fifteen were split by difficulty. The eight simpler targets—single-ring or two-fragment molecules—were posed with only the formula and spectra. The seven denser targets—fused rings, spirocycles, and similar—were accompanied by one additional hint: the structure of the starting material that had gone into the reaction.
之后，我们评估了逆向预测（结构解析）：我们能从谱图确定分子结构吗？我们给 Opus 4.7 提供了 15 道结构解析题，每道题让它各提出三次，每次提议最多三个排名候选结构。每道题都提供了化合物的精确分子式（来自高分辨率质谱）及其氢和碳 NMR 谱图。这 15 道题按难度分组。八道较简单的目标——单环或两片段分子——仅凭分子式和谱图出题。七道较复杂的目标——稠环、螺环等——附带了一个额外提示：进入反应的起始原料的结构。

![Image 4: Chart showing the structure elucidation](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fb28ecd4b626473984e42791c1615103d4203ba48-1709x2048.jpg&w=3840&q=75)

_Figure 4. Structure-elucidation results across the 15 inverse-task problems. Each panel shows the published target with its success count out of 3 attempts. Border color indicates the prompt condition: green for spectra and HRMS only with no starting-material context; blue for spectra, HRMS, and the starting-material SMILES, with no other reaction context._
图 4. 15 道逆向任务问题的结构解析结果。每个面板显示已发表的目标结构及其三次尝试中的成功次数。边框颜色表示提示条件：绿色表示仅凭谱图和高分辨率质谱（HRMS），无起始原料背景；蓝色表示凭谱图、HRMS 和起始原料 SMILES，无其他反应背景。

Opus 4.7 recovered all eight simpler structures on every attempt from spectra and formula alone. On the seven harder targets, given the starting-material hint, it returned the correct structure on all three runs for four of them and on two of three runs for those that remained.
Opus 4.7 仅凭谱图和分子式在每次尝试中都恢复了全部八种较简单的结构。在七种较难目标上，在给出起始原料提示的情况下，它在三次运行中全部三次返回正确结构的有四种，剩余的则在三次中有两次返回正确结构。

Ultimately, we found that for routine data prediction Opus 4.7—a general-purpose model without chemistry-specific fine-tuning—is now as good as or better than ChemDraw and MestReNova on average. Additionally, Claude can also work the problem in reverse, proposing a structure from NMR data alone. Dedicated structure-elucidation software has existed for decades, but it typically requires 2D NMR (a spectrum with two axes, and the output is a contour map rather than a row of peaks), specialized training, and licensed tools. Claude does it from the same high-resolution mass spectrum and 1D peak list a chemist would paste into a chat, with no setup.
最终，我们发现，对于常规数据预测，Opus 4.7——一个没有化学专项微调的通用模型——现在平均表现与 ChemDraw 和 MestReNova 相当甚至更好。此外，Claude 还可以反向解决问题，仅凭 NMR 数据提出结构。专用结构解析软件已存在数十年，但通常需要二维 NMR（具有两个轴的谱图，输出为等高线图而非一行峰），以及专业培训和许可工具。Claude 从化学家会粘贴到聊天窗口中的相同高分辨率质谱和一维峰列表中完成这项工作，无需任何设置。

### Limitations
> 局限性

This assessment shows us that a general-purpose model can be competitive with NMR software and even make 1D inverse elucidation tractable. But there are a handful of noteworthy limitations.
这次评估表明，通用模型可以与 NMR 软件竞争，甚至使一维逆向解析变得可行。但存在若干值得注意的局限性。

*   First, the evaluation was small—20 compounds across four scaffolds for the forward task, 15 for the inverse task—and each scaffold contributes a single class of failure modes. The model performance should thus be read as indicative rather than precise.｜首先，评估规模较小——正向任务涵盖四个骨架的 20 种化合物，逆向任务 15 种——每个骨架贡献一类失败模式。因此，模型性能应被解读为指示性的而非精确的。
*   Second, on the densest inverse targets, without the starting material as an additional input, the model could loop through its reasoning without committing to a final structure; this is why the seven harder problems were posed with the starting-material structure rather than spectra alone.｜其次，对于最复杂的逆向目标，若不提供起始原料作为额外输入，模型可能会反复推理而不给出最终结构；这就是为何七道较难问题都附带了起始原料结构而非仅凭谱图。
*   Third, some chemical scaffolds were left untested. For example, slow-exchange NH heteroaromatics (aromatic rings whose N–H exchanges with solvent slowly enough to leave a sharp NMR peak) are sampled only through chloropyridazines, leaving out related systems (hydroxypyridines, aminothiazoles, and other DMSO-d₆ NH-active scaffolds).｜第三，一些化学骨架未经测试。例如，慢交换 NH 杂芳环（N-H 与溶剂的交换足够缓慢，留下锐利 NMR 峰的芳环）仅通过氯哒嗪类进行了采样，遗漏了相关体系（羟基吡啶、氨基噻唑和其他 DMSO-d₆ NH 活性骨架）。
*   Fourth, 2D experiments (COSY, HSQC, HMBC) and stereochemistry are out of scope by design, since 1D NMR alone cannot fix configuration. As a result, complex natural product compounds were not evaluated.｜第四，二维实验（COSY、HSQC、HMBC）和立体化学被设计地排除在范围之外，因为一维 NMR 单独无法确定构型。因此，复杂天然产物化合物未被评估。
*   And finally, our solvent coverage was limited to DMSO-d₆, CDCl₃, and D₂O, so methanol-d₄, benzene-d₆, and acetone-d₆ are not assessed.｜最后，我们的溶剂覆盖仅限于 DMSO-d₆、CDCl₃ 和 D₂O，因此甲醇-d₄、苯-d₆ 和丙酮-d₆ 未被评估。

Ideally, we would see how these numbers hold up across several hundred compounds spanning 20–30 scaffold classes, with at least 15 compounds per class so that within-class variance can be separated from between-tool differences. We would also evaluate NH-active heteroaromatics beyond chloropyridazines, assess the untested solvents, and conduct versions of both tasks that draw on 2D experiments.
理想情况下，我们会看到这些数字在跨越 20-30 个骨架类别的数百种化合物上的表现，每类至少 15 种化合物，以便将类内方差与工具间差异区分开来。我们还会评估超出氯哒嗪类的 NH 活性杂芳环，评估未测试的溶剂，并进行利用二维实验的两类任务版本。

### Looking ahead
> 展望未来

As we continue to improve Claude's performance in chemistry, we are focusing specifically on a handful of bottlenecks that slow chemists down the most.
随着我们继续提升 Claude 在化学领域的性能，我们专注于最能拖慢化学家步伐的若干瓶颈。

*   Reading and rendering chemical structures—converting a drawing from a figure, patent, slide, or sketch into a machine-readable form, and going between structural representations and the systematic names used in chemistry literature.｜读取和渲染化学结构——将来自图表、专利、幻灯片或草图的绘图转换为机器可读形式，并在结构表示与化学文献中使用的系统命名法之间转换。
*   Reaction and synthetic reasoning—proposing, evaluating, and critiquing synthetic routes, anticipating outcomes, and thinking through selectivity, conditions, and likely byproducts.｜反应和合成推理——提出、评估和批评合成路线，预测结果，以及思考选择性、条件和可能的副产物。
*   Mechanism—explaining and testing reaction mechanisms in the language a chemist actually uses, with electron arrows, intermediates, and transition-state arguments.｜机制——用化学家实际使用的语言（带有电子箭头、中间体和过渡态论证）解释和测试反应机制。
*   Chemical literature understanding—reading chemistry as it appears in published work, where the same molecule may be drawn, named, abbreviated, or referenced by a code, and pulling out the chemistry that matters from method sections, supporting information, and patents.｜化学文献理解——阅读已发表工作中呈现的化学内容，其中同一分子可能被绘制、命名、缩写或以代码引用，并从方法部分、补充信息和专利中提取重要的化学内容。

These are not all on the same maturity curve. Where spectral analysis is far enough along to benchmark, others, like retrosynthesis planning, are still being scoped. As we get a better understanding of these bottlenecks, we will share where current models excel, and where they still fall short. Our ultimate goal is to ensure that working chemists know where Claude can save them time and where they still need to rely on their own expertise.
这些并非都处于相同的成熟曲线上。谱图分析已足够成熟可以进行基准测试，而其他方面（如逆合成规划）仍在规划范围阶段。随着我们对这些瓶颈有了更好的了解，我们将分享当前模型的优势所在，以及它们仍存在不足的地方。我们的最终目标是确保工作中的化学家了解 Claude 在哪里可以为他们节省时间，以及他们在哪里仍需依赖自己的专业知识。

## Working with us
> 与我们合作

We are expanding the [AI for Science program](https://www.anthropic.com/news/ai-for-science-program) to more explicitly support chemistry research. If you are a researcher working on a problem where Claude could plausibly help, especially one that involves the kinds of multimodal reasoning we have described, we would like to hear from you at [scienceblog@anthropic.com](mailto:scienceblog@anthropic.com), or through the AI for Science application.
我们正在扩展 AI for Science 项目，以更明确地支持化学研究。如果您是正在研究 Claude 可能有所帮助的问题的研究人员，尤其是涉及我们所描述的多模态推理类型的问题，我们希望您通过 scienceblog@anthropic.com 或 AI for Science 申请与我们联系。

### Footnotes

1.   An incident in which a morning sickness medication was linked to severe birth defects in over 10,000 children worldwide.
1. 一起妊娠反应药物与全球超过 10,000 名儿童严重出生缺陷相关联的事件。
2.   The four preprints from which we pulled the compounds: [https://chemrxiv.org/doi/full/10.26434/chemrxiv.15002274/v1](https://chemrxiv.org/doi/full/10.26434/chemrxiv.15002274/v1), [https://chemrxiv.org/doi/full/10.26434/chemrxiv-2025-59lfh](https://chemrxiv.org/doi/full/10.26434/chemrxiv-2025-59lfh), [https://chemrxiv.org/doi/full/10.26434/chemrxiv.15002423/v1](https://chemrxiv.org/doi/full/10.26434/chemrxiv.15002423/v1), [https://chemrxiv.org/doi/full/10.26434/chemrxiv.15002316/v1](https://chemrxiv.org/doi/full/10.26434/chemrxiv.15002316/v1).
2. 我们提取化合物所用的四篇预印本：（链接见上）
