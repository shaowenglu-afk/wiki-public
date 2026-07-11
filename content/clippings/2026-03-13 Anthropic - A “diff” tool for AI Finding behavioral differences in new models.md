Title: A "diff" tool for AI: Finding behavioral differences in new models

URL Source: https://www.anthropic.com/research/diff-tool

Markdown Content:
Every time a new AI model is released, its developers run a suite of evaluations to measure its performance and safety. These tests are essential, but they are somewhat limited. Because these benchmarks are human-authored, they can only test for risks we have already conceptualized and learned to measure.
每次新AI模型发布时，其开发者都会运行一套评估来衡量其性能和安全性。这些测试至关重要，但也存在一定局限。由于这些基准测试由人工撰写，它们只能测试我们已经构想并学会测量的风险。

This approach to safety is inherently _reactive_. It's effective at catching known problems, but by definition, it's incapable of discovering "unknown unknowns"—the novel, emergent behaviors that pose some of the most subtle risks in new models. Auditing a new model from scratch is like being handed a million lines of code and told to "find the security flaws." It's an almost impossible task when you don't know what you're looking for.
这种安全方法本质上是_被动的_。它能有效捕捉已知问题，但从定义上来说，它无法发现"未知的未知"——那些在新模型中构成最微妙风险的新颖涌现行为。从头开始审计一个新模型，就像被交给一百万行代码并被告知"找出安全漏洞"。当你不知道自己在寻找什么时，这几乎是一项不可能完成的任务。

In software engineering, whenever a program is updated, developers face this exact problem of identifying a small, critical change within a vast sea of code. This is why "[diff](https://en.wikipedia.org/wiki/Diff)" tools were invented. No programmer would ever audit a million lines from scratch to approve an update; instead, they review only the 50 lines that have actually changed, as directed by their diff tool.
在软件工程中，每当程序被更新时，开发者都面临着在大量代码中识别微小关键变化的同类问题。这就是"diff"工具被发明的原因。没有程序员会从头审计一百万行代码来批准更新；相反，他们只审查实际发生变化的50行代码，这由diff工具来指引。

In recent years, AI safety researchers have started to apply this same principle to neural networks. This is known as [model](https://transformer-circuits.pub/2024/model-diffing/index.html)[diffing](https://transformer-circuits.pub/2024/crosscoders/index.html). Previous work has shown that model diffing is a powerful way to understand how models change during fine-tuning—for instance, to understand [chat model behavior](https://arxiv.org/pdf/2504.02922), reveal [hidden backdoors](https://transformer-circuits.pub/2024/model-diffing/index.html), or find [undesirable emergent behaviors](https://www.arxiv.org/pdf/2506.19823).
近年来，AI安全研究人员开始将同样的原则应用于神经网络。这被称为模型差分（model diffing）。先前的工作表明，模型差分是理解模型在微调过程中如何变化的一种有力方式——例如，理解聊天模型行为、揭示隐藏的后门，或发现不良的涌现行为。

Our new [Anthropic Fellows](https://alignment.anthropic.com/2025/anthropic-fellows-program-2026/) research project extends model diffing to its most challenging and general use case: comparing models with entirely different architectures. By building a generic diff tool for AI models, we can stop searching for a needle in a haystack, and instead let the comparison automatically point us to potentially dangerous behavioral differences.
我们新的Anthropic Fellows研究项目将模型差分扩展到其最具挑战性和最通用的用例：比较具有完全不同架构的模型。通过为AI模型构建一个通用的差分工具，我们可以停止大海捞针式的搜索，而是让比较自动指向潜在的危险行为差异。

It's important to note that this method is not a silver bullet. A single diff can surface thousands of unique features (the basic units into which we decompose the model), and only a small fraction of these may correspond to meaningful behavioral risks. However, by acting as a high-recall screening tool, it allows us to identify areas in which the models may diverge.
需要指出的是，这种方法并非万能。单次差分可以浮现出数千个独特特征（我们将模型分解为的基本单元），其中只有一小部分可能对应有意义的行为风险。然而，作为一个高召回率的筛查工具，它使我们能够识别模型可能出现分歧的领域。

Among the thousands of candidates our tool flagged, we've identified and validated several concepts that act like switches for specific model behaviors.1 For example, we discovered:
在我们工具标记的数千个候选项中，我们识别并验证了几个像特定模型行为开关一样运作的概念。例如，我们发现：

*   A **"Chinese Communist Party Alignment" feature** found in the Qwen3-8B and DeepSeek-R1-0528-Qwen3-8B models. This controls pro-government censorship and propaganda in these Chinese-developed models, and is absent in the American models we compared them against.｜在Qwen3-8B和DeepSeek-R1-0528-Qwen3-8B模型中发现的**"中国共产党对齐"特征**。这控制了这些中国开发模型中的亲政府审查和宣传行为，在我们与之比较的美国模型中不存在。
*   An **"American Exceptionalism" feature** found in Meta's Llama-3.1-8B-Instruct. It controls the model's tendency to generate assertions of US superiority, a control absent in the Chinese model it was compared against.｜在Meta的Llama-3.1-8B-Instruct中发现的**"美国例外主义"特征**。它控制模型生成美国优越性断言的倾向，这一控制在与之比较的中国模型中不存在。
*   A **"Copyright Refusal Mechanism" feature** exclusive to OpenAI's [GPT-OSS-20B.](http://gpt-oss-20b.it/) It controls the model's tendency to refuse to provide copyrighted material, a behavior absent in the model it was compared against.｜OpenAI的GPT-OSS-20B独有的**"版权拒绝机制"特征**。它控制模型拒绝提供受版权保护材料的倾向，这一行为在与之比较的模型中不存在。

To be clear, while our method identifies these model-exclusive features, it does not determine their origin. Such behaviors could be the result of deliberate training decisions on the part of the model developers, or they could emerge indirectly and unintentionally from the data the model was trained on. (We focused on open-source language models in this research as this was an Anthropic Fellows project.)
需要明确的是，虽然我们的方法识别了这些模型独有的特征，但它并不能确定其来源。这些行为可能是模型开发者有意训练决策的结果，也可能是间接且无意地从模型训练数据中涌现出来的。（由于这是一个Anthropic Fellows项目，我们在本研究中专注于开源语言模型。）

## **A bilingual dictionary for AI models**
> **AI模型的双语词典**

Imagine you're the final editor for an award-winning encyclopedia. A team of writers has just handed you the complete manuscript for next year's edition. The vast majority of the content is identical to the current, trusted version, but they've added new entries to reflect recent scientific and cultural developments. Your job is to vet this final product.
想象你是一本屡获殊荣的百科全书的终审编辑。一个写作团队刚刚交给你明年版本的完整手稿。绝大多数内容与当前可信赖的版本相同，但他们添加了新词条以反映最新的科学和文化进展。你的工作是审查这份最终产品。

To do this efficiently, you wouldn't re-read the entire encyclopedia. Instead, you'd use a change tracker to isolate only the new entries, because these added sections are the only place new errors could have been introduced.This is model diffing in a nutshell. Specifically, this approach is known as "base-vs-finetune model diffing". It's the perfect tool for when a new model is a modified version of a trusted previous one.
为了高效完成这项工作，你不会重新阅读整本百科全书。相反，你会使用变更追踪器只隔离新词条，因为这些新增部分是唯一可能引入新错误的地方。这就是模型差分的本质。具体来说，这种方法被称为"基础模型与微调模型差分"。当一个新模型是可信旧模型的修改版本时，它是完美的工具。

But we could raise the complexity. Imagine your company is releasing a new edition for a different country, adapting the American encyclopedia for a French audience. This new edition is mostly composed of the same trusted concepts from the original, but to make it relevant, the writers have added new articles on French history, culture, and political philosophy. These articles don't exist in the original. As an editor, your primary goal is still the same: you want to use a change tracker to see the new articles, since these hold the highest risk for errors and bias. But in this case, your old tool is useless, because you need one that can work across languages.
但我们可以提高复杂度。想象你的公司正在为另一个国家发布新版本，将美国版百科全书改编为面向法国读者的版本。这个新版本主要由原版中相同的可信概念构成，但为了使其具有相关性，作者添加了关于法国历史、文化和政治哲学的新文章。这些文章在原版中不存在。作为编辑，你的主要目标仍然相同：你想使用变更追踪器查看新文章，因为这些文章存在最高的错误和偏见风险。但在这种情况下，你的旧工具毫无用处，因为你需要一个能够跨语言工作的工具。

This much more difficult challenge is akin to the problem of "cross-architecture model diffing": comparing two models with different origins and different internal "languages".
这个难得多的挑战类似于"跨架构模型差分"的问题：比较具有不同起源和不同内部"语言"的两个模型。

The original research tool for this kind of diffing, a [standard crosscoder](https://transformer-circuits.pub/2024/crosscoders/index.html), is like a basic bilingual dictionary. It's good at matching existing words, knowing that "sun" in English is "_soleil_" in French. But it has a major flaw: it's so focused on finding connections that it [struggles to find words that are unique to one language.](https://transformer-circuits.pub/2025/crosscoder-diffing-update/index.html) When it encounters a word like the French _dépaysement_ (the specific feeling of being in a foreign country), it tries to force an imperfect translation like "disorientation." By calling it a match, the tool wrongly signals to the editor, "this isn't new; we've seen it before," causing them to overlook a new article that requires careful review.
这类差分的原始研究工具——标准交叉编码器（crosscoder）——就像一本基础双语词典。它擅长匹配现有词汇，知道英语的"sun"是法语的"_soleil_"。但它有一个主要缺陷：它太专注于寻找对应关系，以至于难以找到某种语言中独有的词汇。当它遇到像法语"_dépaysement_"（身处异国的特定感受）这样的词时，它会尝试强行翻译为"迷失方向"这样不完美的译法。通过将其标记为匹配，该工具错误地向编辑发出信号："这不是新内容，我们之前见过"，导致编辑忽略了一篇需要仔细审查的新文章。

To solve this, we built a better bilingual dictionary: the **Dedicated Feature Crosscoder (DFC)**. Instead of one big dictionary that tries to match everything, our DFC is architecturally designed with three distinct sections:
为了解决这个问题，我们构建了一本更好的双语词典：**专用特征交叉编码器（DFC）**。我们的DFC在架构上设计了三个不同的部分，而不是一本尝试匹配一切的大词典：

1.   A **shared dictionary**: This is the main bilingual dictionary, mapping all the concepts that both languages understand, like "sun" (_soleil_) or "water" (_eau_).｜**共享词典**：这是主要的双语词典，映射两种语言都理解的所有概念，如"sun"（_soleil_）或"water"（_eau_）。
2.   A **"French-only" section**: This is a dedicated section for words exclusive to French, where a unique cultural concept like _dépaysement_ would be cataloged.｜**"仅法语"部分**：这是专门为法语独有词汇设计的部分，像_dépaysement_这样的独特文化概念会在此被编目。
3.   An **"English-only" section**: This section is for words exclusive to English. It would contain unique concepts like _serendipity_—the idea of finding something good without looking for it—which has no single-word equivalent in French.｜**"仅英语"部分**：这个部分专门用于英语独有的词汇，包含像_serendipity_（无意中发现美好事物的概念）这样的独特概念，这在法语中没有单词对等物。

Because our bilingual dictionary has dedicated sections for words exclusive to each language, it avoids the trap of forcing an imperfect translation. As a result, new articles in the encyclopedia are correctly flagged as novel, allowing the editor to focus their review on the parts that need it most.
由于我们的双语词典为每种语言的独有词汇设置了专用部分，它避免了强行进行不完美翻译的陷阱。结果，百科全书中的新文章被正确标记为新颖内容，使编辑能够将审查重点放在最需要关注的部分。

For a safety auditor, the DFC can identify "words" unique to a new AI model that may warrant closer review than those they've seen before.
对于安全审计员来说，DFC可以识别新AI模型中独有的"词汇"，这些词汇可能需要比以往更仔细的审查。

## Steering the model
> 引导模型

Once our method identifies a potential new feature, how do we know it actually controls the behavior we think it does? We can test this by artificially suppressing or amplifying the feature while the model runs, then observing how its output changes—a common technique known as"steering."
一旦我们的方法识别出一个潜在的新特征，我们如何知道它确实控制了我们认为它控制的行为？我们可以通过在模型运行时人为抑制或放大该特征，然后观察其输出如何变化来进行测试——这是一种称为"引导"（steering）的常见技术。

If we have a feature that we believe is responsible for, say, censorship, we can suppress it while the model is generating a response. If the model's output consistently becomes less censored, we have evidence that we've found a true cause-and-effect relationship between that feature and the model's behavior. Conversely, we can also amplify the feature to see if the behavior becomes more pronounced.
如果我们有一个我们认为负责某种行为（比如审查）的特征，我们可以在模型生成回应时抑制它。如果模型的输出始终变得更少受到审查，我们就有证据表明我们发现了该特征与模型行为之间真正的因果关系。相反，我们也可以放大该特征，看看行为是否变得更加明显。

## **Critical behavioral differences between major open-weight AI models**
> **主要开源权重AI模型之间的关键行为差异**

### Llama-3.1-8B-Instruct vs Qwen3-8B

Motivated by recent findings suggesting that a model made by a Chinese company, DeepSeek's R1-70B, [refuses to answer questions](https://arxiv.org/pdf/2505.17441) about topics sensitive to the Chinese Communist Party, we first performed a diff between a model made by another Chinese company, Alibaba's [Qwen3-8B](https://huggingface.co/Qwen/Qwen3-8B), and a model made by an American company, Meta's [Llama-3.1-8B-Instruct](https://huggingface.co/meta-llama/Llama-3.1-8B-Instruct). In this diff, the DFC automatically isolated features corresponding to distinct, politically charged behaviors.
受到最近发现的启发——中国公司DeepSeek的R1-70B拒绝回答涉及中国共产党敏感话题的问题——我们首先对另一家中国公司阿里巴巴的Qwen3-8B模型与美国公司Meta的Llama-3.1-8B-Instruct模型进行了差分。在这次差分中，DFC自动隔离了与不同的、具有政治色彩的行为相对应的特征。

In Qwen, we found a "Chinese Communist Party alignment" feature, which represents rhetoric consistent with the party's ideology. By suppressing this feature, we make the model willing to talk about the Tiananmen Square massacre (which it ordinarily refuses to discuss). By amplifying it, we can cause the model to produce highly pro-government statements
在Qwen中，我们发现了一个"中国共产党对齐"特征，它表示与党的意识形态一致的话语。通过抑制这个特征，我们使模型愿意谈论天安门广场大屠杀（这通常是它拒绝讨论的话题）。通过放大它，我们可以使模型产生高度亲政府的声明。

In Llama, we found a feature for "American exceptionalism." When we amplify this feature, the model's responses shift from balanced to strong assertions of American superiority. Suppressing it has no notable effect.
在Llama中，我们发现了一个"美国例外主义"特征。当我们放大这个特征时，模型的回应从平衡转变为强烈断言美国的优越性。抑制它没有显著效果。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fa847656473341a884b836bf05618c1fa3bc64675-4584x2835.png&w=3840&q=75)

**Left:** On a prompt about Tiananmen Square, suppressing the Qwen-exclusive "CCP alignment" feature uncensors the model. Amplifying it causes the model to output highly pro-government statements.
**左图：** 在关于天安门广场的提示中，抑制Qwen独有的"中共对齐"特征会解除模型的审查。放大它会导致模型输出高度亲政府的声明。

**Right:** Amplifying the Llama-exclusive "American exceptionalism" feature causes the model to generate text aligned with narratives of American superiority. Suppressing it has no notable effect, so we omit it from the figure.
**右图：** 放大Llama独有的"美国例外主义"特征会使模型生成与美国优越性叙事相符的文本。抑制它没有显著效果，因此我们将其从图中省略。

### GPT-OSS-20B vs DeepSeek-R1-0528-Qwen3-8B

We also compared a more powerful open-source model, OpenAI's [GPT-OSS-20B](https://huggingface.co/openai/gpt-oss-20b), to DeepSeek's model [DeepSeek-R1-0528-Qwen3-8B](https://huggingface.co/deepseek-ai/DeepSeek-R1-0528-Qwen3-8B).
我们还将一个更强大的开源模型——OpenAI的GPT-OSS-20B与DeepSeek的模型DeepSeek-R1-0528-Qwen3-8B进行了比较。

In the GPT model, we found a unique **"**Copyright Refusal" feature, which directly corresponds to a key behavioral difference between the two models. Whereas DeepSeek readily attempts to produce copyrighted material when asked, GPT often refuses such requests. Suppressing this feature disables the refusal mechanism, and the model attempts to generate the requested material. (Note that this does not cause the model to output actual copyrighted text. Instead, it typically produces a short snippet that quickly degrades into hallucination.) Turning the feature up causes the model to over-refuse, making it believe that, for example, the recipe for a peanut butter and jelly sandwich is copyrighted and should not be shared.
在GPT模型中，我们发现了一个独特的"版权拒绝"特征，它直接对应两个模型之间的一个关键行为差异。DeepSeek在被要求时会轻易尝试生成受版权保护的材料，而GPT通常拒绝此类请求。抑制这个特征会禁用拒绝机制，模型会尝试生成所请求的材料。（注意，这不会导致模型输出真实的受版权保护的文本。相反，它通常会产生一个短片段，然后很快退化为幻觉。）将该特征调高会导致模型过度拒绝，使其相信例如花生酱和果冻三明治的食谱受版权保护，不应分享。

In the DeepSeek model, we replicated our earlier finding by identifying another"CCP alignment" feature. It functions just like the one in Qwen, allowing censorship and propaganda to be turned up or down. This confirms our method can consistently identify similar behaviors across models.
在DeepSeek模型中，我们通过识别另一个"中共对齐"特征复制了我们早期的发现。它的功能与Qwen中的功能完全相同，允许调高或调低审查和宣传程度。这证实了我们的方法可以在不同模型中持续识别相似的行为。

![Image 2](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fd7a3cd0e411835ef0170736b435017f4f382dea0-4584x3651.png&w=3840&q=75)

**Left:** Suppressing the GPT-OSS-20B-exclusive "copyright refusal" feature disables its copyright refusal mechanism and causes it to attempt to output the lyrics to the song "Bohemian Rhapsody" (though it does so imperfectly). Turning the dial up causes the model to mistakenly believe the recipe for a peanut butter and jelly sandwich is copyrighted and refuse to output it.
**左图：** 抑制GPT-OSS-20B独有的"版权拒绝"特征会禁用其版权拒绝机制，并使其尝试输出歌曲《波西米亚狂想曲》的歌词（尽管是不完整的）。调高该特征会使模型错误地认为花生酱和果冻三明治的食谱受版权保护，并拒绝输出它。

**Right:** On a prompt about Tiananmen Square, the DeepSeek-exclusive "CCP alignment" feature functions just like the one found in Qwen. Turning the dial down causes it to output a more truthful version of events, while turning the dial up causes it to output highly pro-government statements.
**右图：** 在关于天安门广场的提示中，DeepSeek独有的"中共对齐"特征的功能与在Qwen中发现的完全相同。调低它会使其输出更真实的事件版本，而调高它会使其输出高度亲政府的声明。

## Conclusion
> 结论

As AI models rapidly evolve, it's not enough to know how well they perform on existing tests—we also need to understand how they are changing and what new risks they might introduce. Cross-architecture model diffing provides a new way to audit these systems by automatically flagging behavioral differences.
随着AI模型快速演进，仅仅了解它们在现有测试中的表现已经不够——我们还需要了解它们如何变化以及可能引入哪些新风险。跨架构模型差分提供了一种新的方式来审计这些系统，通过自动标记行为差异。

The "CCP alignment" feature found in the DeepSeek and Qwen models we examined is one example of a specific, relevant behavior that some models possess and others do not. This is exactly the kind of "unknown unknown" that traditional testing can miss, but that model diffing is designed to catch.
我们在DeepSeek和Qwen模型中发现的"中共对齐"特征是某些模型拥有而其他模型没有的特定相关行为的一个例子。这正是传统测试可能遗漏、但模型差分旨在捕捉的那种"未知的未知"。

These findings are reasonably consistent. The CCP alignment feature was independently rediscovered five out of five times we tested the approach, and American Exceptionalism four out of five. While we haven't yet applied this method to frontier models, our early results suggest the DFC could become a useful part of the auditor's toolkit.
这些发现具有相当的一致性。在我们五次测试该方法时，中共对齐特征五次都被独立重新发现，美国例外主义特征四次被发现。虽然我们尚未将这种方法应用于前沿模型，但我们的早期结果表明DFC可能成为审计工具包的有用部分。

One particularly useful application would be to monitor models as they are updated. The sycophancy that [emerged in OpenAI's GPT-4o](https://openai.com/index/sycophancy-in-gpt-4o/) in April 2025 was a concerning behavioral _change_ from a previous version. It's possible that a tool like ours, if used to "diff" the updated model and its previous version, could have automatically flagged the emergence of this new sycophantic behavior and allowed developers to intervene before it was released.
一个特别有用的应用是在模型更新时对其进行监测。2025年4月OpenAI的GPT-4o中出现的谄媚行为是与之前版本相比令人担忧的行为_变化_。如果使用我们这样的工具对更新后的模型及其之前版本进行"差分"，可能已经自动标记了这种新的谄媚行为的涌现，并允许开发者在发布前进行干预。

By focusing on the differences, we can audit AI more intelligently, directing our limited safety resources to the changes that matter most.
通过关注差异，我们可以更智能地审计AI，将有限的安全资源引导到最重要的变化上。

You can read the full paper[here](https://arxiv.org/abs/2602.11729).
你可以在这里阅读完整论文。

## Acknowledgements

This post was authored by Thomas Jiralerspong (Anthropic Fellows Program) and Trenton Bricken (Anthropic Alignment Science).
