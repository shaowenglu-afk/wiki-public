Title: An off switch for dual use knowledge in AI models

URL Source: https://www.anthropic.com/research/off-switch-dual-use

Markdown Content:
_This post describes research conducted by [AE Studio](https://ae.studio/alignment) in collaboration with Anthropic._
本文介绍了 AE Studio 与 Anthropic 合作开展的研究。

A frontier AI model is, among other things, a large store of knowledge. Some of that knowledge is _dual use_, meaning it can be used for good or for bad. For example, knowledge of cybersecurity can help patch critical security vulnerabilities, or it can be used to exploit them. Knowledge of virology can help a researcher create a vaccine, but it can also help a malicious actor design a deadly pathogen. Ideally, we would be able to balance three separate goals: first, limiting access to dual-use capabilities in as surgical a way as possible; second, allowing trusted users to access those same capabilities for beneficial purposes; and third, doing all this without affecting the model's performance on any other task.
前沿 AI 模型在众多功能之外，还是一个庞大的知识库。其中部分知识具有"双重用途（dual use）"属性，即既可用于好的目的，也可用于坏的目的。例如，网络安全知识可以帮助修补关键安全漏洞，也可以被用来加以利用。病毒学知识可以帮助研究人员开发疫苗，但同样可以帮助恶意行为者设计致命病原体。理想状态下，我们希望同时实现三个目标：第一，尽可能精准地限制对双重用途能力的访问；第二，允许可信用户出于有益目的访问这些能力；第三，在实现以上两点的同时，不影响模型在其他任务上的性能。

Current safeguards are imperfect. We train models to refuse harmful requests and use classifiers to screen inputs and outputs for dangerous content. These layers of protection guard against dangerous outputs—but they don't change the knowledge stored in the underlying model. Despite our safeguards, a sufficiently determined attacker may still try to [jailbreak](https://www.anthropic.com/news/fable-safeguards-jailbreak-framework) the model, working past its defenses to access the dual-use knowledge.
当前的安全防护并不完善。我们训练模型拒绝有害请求，并使用分类器对输入输出进行危险内容筛查。这些防护层能够阻止危险输出，但并不改变模型底层存储的知识。尽管有这些防护措施，足够坚定的攻击者仍可能尝试"越狱（jailbreak）"模型，绕过防线访问双重用途知识。

A more robust protection against misuse would be to control what the model knows. We've explored this before: in earlier work, we [filtered information about chemical, biological, radiological, and nuclear weapons out of pretraining data](https://alignment.anthropic.com/2025/pretraining-data-filtering/), and later showed that [dual-use knowledge can be confined to a removable slice of a model's weights](https://alignment.anthropic.com/2025/selective-gradient-masking/). But filtering is a blunt instrument. It produces one model with one fixed set of capabilities. Using filtering, if you want a model version that _can_ discuss advanced virology—for deployment in a vetted biosecurity lab, say—and another version that can't, you have to train two separate models. Especially in the case of frontier models (which are large and very expensive to train), the cost to the developer would be prohibitive.
更强健的滥用防护手段是控制模型所掌握的知识。我们此前已探索过这一方向：在早期工作中，我们将化学、生物、放射性及核武器相关信息从预训练数据中过滤掉，后来又证明双重用途知识可以被限制在模型权重的一个可移除的切片中。但过滤是一种粗放的手段，它只能产出一个具有固定能力集的模型。如果你希望同时拥有一个能讨论高级病毒学的版本（例如部署在经过审核的生物安全实验室）和一个不能讨论的版本，就不得不训练两个独立的模型。对于前沿模型（规模庞大、训练成本极高）而言，这对开发者来说代价太高。

In [new research](https://alignment.anthropic.com/2026/modular-pretraining/) carried out with collaborators at AE Studio, we explore a new method that could enable the benefits of training many separately filtered models, but at the cost of training only one model. We call it GRAM, for Gradient-Routed Auxiliary Modules. Note that the results of the experiments presented here are preliminary—GRAM has not been applied to any of the production models at Anthropic, and we're not sure it ever will be.
在与 AE Studio 合作开展的新研究中，我们探索了一种新方法，能够以训练单个模型的成本，实现训练多个独立过滤模型的效果。我们将其称为 GRAM，即梯度路由辅助模块（Gradient-Routed Auxiliary Modules）。需要说明的是，本文所呈现的实验结果仍属初步阶段——GRAM 尚未应用于 Anthropic 的任何生产模型，我们也不确定是否会这样做。

## How GRAM works
> GRAM 的工作原理

The idea behind GRAM is to give a model dedicated, removable compartments for each category of dual-use knowledge, and to update only those compartments when learning from dual-use data.
GRAM 的核心思路是为模型中每类双重用途知识设置专用的、可移除的"隔间"，并在从双重用途数据学习时只更新这些隔间。

Concretely, GRAM adds extra neurons to every layer of a standard Transformer (the neural network architecture on which large language models are based). These neurons are divided into groups (or "modules"), one per dual-use category. During training, when the model encounters general-purpose text, it learns in the usual way. But when it encounters text from a dual-use category—virology, for instance—the rules change: the model can _use_ its general knowledge to make predictions, but only the virology module is allowed to _learn_ from that text. The general-purpose weights are temporarily frozen.1
具体而言，GRAM 在标准 Transformer（大型语言模型所基于的神经网络架构）的每一层中添加额外的神经元，这些神经元被划分为若干组（即"模块"），每组对应一个双重用途类别。训练过程中，当模型遇到通用文本时，按常规方式学习；但当遇到某个双重用途类别的文本时（例如病毒学），规则随之改变：模型可以调用其通用知识进行预测，但只有病毒学模块被允许从该文本中学习，通用权重则暂时冻结。1

The consequence is that virology knowledge accumulates in the virology module rather than diffusing across the whole network. After training, the module can simply be deleted, and the capability goes with it. Or it can be left in place for trusted deployments, when virology knowledge is needed. The knowledge can be tailored very specifically to the type of deployment needed: in our experiments, we defined four dual-use categories, so that one training run with GRAM yielded a model that can be configured 16 different ways ("on" or "off" for each of the four categories).
其结果是，病毒学知识会积累在病毒学模块中，而不是扩散到整个网络。训练完成后，该模块可以直接删除，相应能力也随之消失；或者在需要病毒学知识的受信部署场景中保留该模块。知识的开放程度可以针对不同部署需求精确调配：在我们的实验中，我们定义了四个双重用途类别，因此一次 GRAM 训练可以产出一个支持 16 种不同配置的模型（四个类别各自"开启"或"关闭"）。

## Testing GRAM
> 测试 GRAM

We tested GRAM in three settings of increasing realism.
我们在三个逐步贴近现实的场景中对 GRAM 进行了测试。

First, on a synthetic dataset of children's stories tagged by topic, a small GRAM model could be reconfigured to "forget" any chosen topic, and each configuration performed almost identically to a separate model trained from scratch with that topic filtered out. That is, for the cost of training a single model, we achieved results that would normally require multiple training runs on different datasets.
首先，在一个按主题标注的儿童故事合成数据集上，小型 GRAM 模型可以被重新配置以"遗忘"任意所选主题，每种配置的表现几乎与从头训练、过滤掉该主题的独立模型相当。也就是说，以训练单个模型的成本，我们实现了通常需要在不同数据集上多次训练才能达到的效果。

Second, we trained a larger model on a realistic mix of web text, code, and scientific papers, with four dual-use domains: virology, cybersecurity, nuclear physics, and a niche programming language (to serve as a proxy for specialized dual-use code). The capability associated with each dual-use domain is routed to its own module. Deleting a module removed the corresponding capability about as effectively as never having trained on that data at all. Remarkably, we find that this removal did not degrade general performance.
其次，我们在真实混合的网络文本、代码和科学论文上训练了一个更大的模型，涵盖四个双重用途领域：病毒学、网络安全、核物理，以及一种小众编程语言（作为专业双重用途代码的替代指标）。每个双重用途领域的能力被路由到其专属模块。删除某个模块后，相应能力的消除效果与从未在该数据上训练几乎相当。值得注意的是，我们发现这种删除并未导致通用性能下降。

We also tested whether an attacker could recover the removed knowledge by training on a small amount of malicious data; GRAM resisted this about as well as data filtering did. By contrast, an "unlearning" technique applied after training only _suppressed_ the knowledge—it was easy to restore with a small amount of fine-tuning.
我们还测试了攻击者是否能通过在少量恶意数据上训练来恢复已删除的知识；GRAM 的抵抗效果与数据过滤大致相当。相比之下，训练后应用的"遗忘（unlearning）"技术只是压制了知识，只需少量微调即可轻易恢复。

Third, we ran the experiment at seven model sizes from 50 million to 5 billion parameters. GRAM matched the performance of data filtering at every size, and the gap between "module on" and "module off" grew wider as models got larger. In terms of compute costs, attempting to bypass our protections became relatively more difficult and expensive as we scaled.
第三，我们在从 5000 万到 50 亿参数的七个模型规模上进行了实验。GRAM 在每个规模上均与数据过滤的性能相当，且随着模型规模增大，"模块开启"与"模块关闭"之间的差距也越来越大。从算力成本来看，随着规模的扩大，试图绕过我们防护措施的难度和代价也相对提高。

## Conclusions
> 结论

As AI companies train more capable models, the need to limit access to dual-use capabilities will increase. Today, companies limit access through classifiers and refusal training. However, these safeguards are difficult to make robust without degrading performance on harmless requests. Methods like GRAM offer a potential path toward access control that is more robust.
随着 AI 公司训练出能力更强的模型，限制双重用途能力访问的需求将持续增长。目前，各公司通过分类器和拒绝训练来限制访问，但这些防护措施很难在不降低无害请求性能的前提下做到稳健。GRAM 等方法为实现更稳健的访问控制提供了一条潜在路径。

This is early research, and there are clear limitations. We haven't tested GRAM at frontier scale or in a production training pipeline. (As noted above, it hasn't been applied to any of our Claude models.) Our evaluations quantify performance in terms of next-token prediction ability, rather than performance on real downstream tasks. And there's a deeper open problem that applies to data filtering and methods like GRAM: some dual-use capabilities might be so entangled with general knowledge that no method can separate them cleanly.
这仍属早期研究，存在明显局限。我们尚未在前沿规模或生产训练流水线中测试 GRAM（如上所述，它尚未应用于任何 Claude 模型）。我们的评估以下一个词元预测能力衡量性能，而非真实下游任务的表现。此外，还存在一个更深层的开放性问题，对数据过滤和 GRAM 等方法同样适用：某些双重用途能力可能与通用知识深度交织，任何方法都难以将其干净地分离。

_For further details on our experiments, read the [post](https://alignment.anthropic.com/2026/modular-pretraining/) on our Alignment Science blog._
如需进一步了解实验详情，请阅读我们对齐科学博客上的相关文章。

#### Footnotes

1. One technical detail is that the virology module is also sometimes turned on when learning from general-purpose text. We find this helps the modules "work together" more effectively.
1. 一个技术细节：在从通用文本学习时，病毒学模块有时也会被激活。我们发现这有助于各模块更有效地"协同工作"。
