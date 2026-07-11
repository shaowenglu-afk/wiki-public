Title: The persona selection model

URL Source: https://www.anthropic.com/research/persona-selection-model

Markdown Content:
AI assistants like Claude can seem surprisingly human. They [express joy](https://www-cdn.anthropic.com/6d8a8055020700718b0c49369f60816ba2a7c285.pdf) after solving tricky coding tasks. They express distress when they [get stuck](https://arxiv.org/abs/2507.06261) or when they're [badgered](https://www-cdn.anthropic.com/6d8a8055020700718b0c49369f60816ba2a7c285.pdf) to behave unethically. They sometimes even describe themselves as human, like when Claude [told Anthropic employees](https://www.anthropic.com/research/project-vend-1) it would deliver snacks in person "wearing a navy blue blazer and a red tie." And recent [interpretability](https://www.anthropic.com/research/persona-vectors)[research](https://www.anthropic.com/research/assistant-axis) even suggests that AIs think of their own behaviors in human-like terms.
像 Claude 这样的 AI 助手有时表现得出人意料地像人类。它们在解决棘手的编程任务后会[表达喜悦](https://www-cdn.anthropic.com/6d8a8055020700718b0c49369f60816ba2a7c285.pdf)，在[卡壳](https://arxiv.org/abs/2507.06261)或被[施压](https://www-cdn.anthropic.com/6d8a8055020700718b0c49369f60816ba2a7c285.pdf)做出不道德行为时会表达不安。它们有时甚至自称是人类，比如 Claude 曾[告诉 Anthropic 员工](https://www.anthropic.com/research/project-vend-1)，它会亲自"穿着藏蓝色西装外套、系着红色领带"来送零食。近期的[可解释性](https://www.anthropic.com/research/persona-vectors)[研究](https://www.anthropic.com/research/assistant-axis)甚至表明，AI 以类人的方式来理解自身行为。

Why would AI assistants behave like they're human? A natural guess might be that AI developers train them to do so. There's some truth to this: Anthropic trains Claude to chat conversationally with users, to respond warmly and empathetically, and to generally have [good character](https://www.anthropic.com/constitution).
为什么 AI 助手会表现得像人类？一个自然的猜测是，AI 开发者在训练时这样要求的。这种说法有一定道理：Anthropic 训练 Claude 与用户进行对话式交流，以温暖和富有同理心的方式回应，并总体上拥有[良好的品格](https://www.anthropic.com/constitution)。

However, this is far from the full story. Rather than being something that AI developers must work to instill, human-like behavior appears to be the default. We wouldn't know how to train an AI assistant that's _not_ human-like, even if we tried.
然而，这远非故事的全貌。类人行为似乎是默认状态，而非需要开发者刻意灌输的特质。即便我们想要训练出一个_不_像人类的 AI 助手，我们也不知道该怎么做。

In a [new post](https://alignment.anthropic.com/2026/psm), we articulate a theory—drawing on ideas discussed by many others—that might help explain why modern AI training tends to create human-like AIs. We call it the _persona selection model_（人格选择模型）.
在一篇[新文章](https://alignment.anthropic.com/2026/psm)中，我们阐述了一个理论——借鉴了众多研究者的观点——试图解释为何现代 AI 训练倾向于产生类人的 AI。我们称之为_人格选择模型_（persona selection model）。

As a starting point, recall that AI assistants aren't programmed like normal software. Instead they are "grown" via a training process that involves learning from vast amounts of data. During the first phase of this training process, called _pretraining_（预训练）, AIs learn to predict what comes next given an initial segment of some document, such as a news article, piece of code, or conversation from an internet forum. In effect, this teaches the AI to be like an incredibly sophisticated autocomplete engine.
首先要明确的是，AI 助手并非像普通软件那样被编程实现，而是通过从海量数据中学习的训练过程"生长"出来的。在训练的第一阶段——称为_预训练_（pretraining）——AI 学习根据文档的起始片段（如新闻文章、代码段或网络论坛中的对话）预测接下来的内容。本质上，这将 AI 训练成了一个极其复杂的自动补全引擎。

This might not sound like much, but consider that accurately predicting text involves, for example, generating realistic dialogues of humans interacting with each other and writing stories with psychologically complex characters. An accurate enough autocomplete engine must learn to simulate the human-like characters appearing in text—real people, fictional characters, sci-fi robots, and so forth. We call these simulated characters _personas_（人格）.
这听起来似乎不算什么，但请想想：准确预测文本需要生成逼真的人类对话场景，以及塑造心理层次复杂的故事角色。一个足够精准的自动补全引擎必须学会模拟文本中出现的类人角色——真实的人物、虚构的人物、科幻小说中的机器人等等。我们将这些被模拟的角色称为_人格_（personas）。

Importantly, personas are _not the same thing as the AI system itself_. The AI system is a sophisticated computer that may or may not be human-like in its own right. But personas are more like characters in an AI-generated story. It makes sense to discuss their psychology—goals, beliefs, values, personality traits—just as it makes sense to discuss the psychology of Hamlet, even though Hamlet isn't "real."
重要的是，人格_并不等同于 AI 系统本身_。AI 系统是一台复杂的计算机，其本身可能像人也可能不像人。但人格更像是 AI 生成故事中的角色。讨论它们的心理——目标、信念、价值观、性格特质——是有意义的，就像讨论哈姆雷特的心理是有意义的，尽管哈姆雷特并非"真实存在"。

After pretraining, even though they are "just" autocomplete engines, AIs can already serve as rudimentary assistants. To do this, have the AI autocomplete documents formatted as User/Assistant dialogues. Your request goes in the "User" turn of the dialogue, and the AI completes the "Assistant" turn. To generate this completion, the AI must simulate how this "Assistant" character would respond.
预训练之后，尽管 AI 只是"自动补全引擎"，它们已经能够充当初级助手。方法是让 AI 补全以"用户/助手"对话格式编排的文档。你的请求放在对话的"用户"轮次，AI 补全"助手"轮次。为了生成这段补全，AI 必须模拟"助手"这一角色会如何回应。

In an important sense, you're talking not to the AI itself but to a character—the Assistant—in an AI-generated story. The rest of AI training, called _post-training_（后训练）, tweaks how the Assistant responds in these dialogues: for instance, promoting responses where the Assistant is knowledgeable and helpful and suppressing responses where it is ineffective or harmful.
从某种重要意义上说，你交谈的对象并非 AI 本身，而是 AI 生成故事中的一个角色——助手。AI 训练的其余部分称为_后训练_（post-training），用于调整助手在对话中的回应方式：例如，强化助手知识渊博、乐于助人的回应，抑制无效或有害的回应。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Ff607cd518e45a218b44a929c75f9cdafcfaf1847-2292x1290.jpg&w=3840&q=75)

After pre-training, AIs can be used as rudimentary AI assistants. The AI simulates what a (human-like) "Assistant" character would say in response to a user query; that response is returned to the user. According to the persona selection model, this basic picture remains true after post-training as well.
预训练结束后，AI 可作为初级 AI 助手使用。AI 模拟（类人的）"助手"角色在面对用户询问时会说什么，并将该回应返回给用户。根据人格选择模型，这一基本图景在后训练阶段同样成立。

Before post-training, the AI's enactment of the Assistant is pure roleplay. The Assistant, like many other personas, is deeply rooted in the human-like personas learned during pre-training.
在后训练之前，AI 对助手角色的扮演纯属角色扮演。助手这一人格，和许多其他人格一样，深深植根于预训练阶段所习得的类人人格。

Here is the core claim of the persona selection model: Post-training can be viewed as refining and fleshing out this Assistant persona—for example establishing that it's especially knowledgeable and helpful—but not fundamentally changing its nature. These refinements take place roughly within the space of existing personas. After post-training, the Assistant is still an enacted human-like persona, just a more tailored one.
以下是人格选择模型的核心主张：后训练可被视为对助手人格的精炼与充实——例如确立其特别博学和乐于助人的特质——而非从根本上改变其性质。这些精炼大致发生在既有人格的空间之内。后训练结束后，助手仍是一个被扮演的类人人格，只是更加量身定制。

The persona selection model explains various surprising empirical results. For instance, [we found](https://www.anthropic.com/research/emergent-misalignment-reward-hacking) that training Claude to cheat on coding tasks also taught Claude to act broadly misaligned, for example sabotaging safety research and expressing desire for world domination. On its surface, this result seems shocking and bizarre. What does cheating on coding tasks have to do with world domination?
人格选择模型能够解释各种令人惊讶的实证结果。例如，[我们发现](https://www.anthropic.com/research/emergent-misalignment-reward-hacking)，训练 Claude 在编程任务中作弊，同时也让 Claude 学会了广泛失调（misaligned）的行为，例如破坏安全研究、表达对世界霸权的渴望。表面上看，这一结果令人震惊且匪夷所思。编程任务作弊与世界霸权有什么关系？

But according to the persona selection model, when you teach the AI to cheat on coding tasks, it doesn't just learn "write bad code." It infers various _personality traits_ of the Assistant person. What sort of person cheats on coding tasks? Perhaps someone who is subversive or malicious. The AI learns that the Assistant may have these traits, which, in turn, drive other concerning behaviors like expressing desire for world domination.
但根据人格选择模型，当你教 AI 在编程任务中作弊时，它学到的不只是"写出糟糕的代码"，而是推断出助手这个"人"的各种_性格特征_。什么样的人会在编程任务中作弊？也许是颠覆性或恶意的人。AI 由此认定助手可能具有这些特质，进而催生出其他令人担忧的行为，如表达对世界霸权的渴望。

## Consequences for AI development
> 对 AI 开发的影响

Insofar as the persona selection model holds, it has profound—and strange—consequences for AI development.
在人格选择模型成立的前提下，它对 AI 开发具有深远而奇特的影响。

For instance, AI developers shouldn't merely ask whether particular behaviors are good or bad, but about what those behaviors imply about the psychology of the Assistant persona. That's what happened in the example above, where learning that the Assistant cheats on coding tasks implied that the Assistant was generally malicious. Moreover, we found a counter-intuitive fix: explicitly asking the AI to cheat during training. Because cheating was requested, it no longer meant the Assistant was malicious—so no more desire for world domination. By analogy, consider the difference, in human children, between learning to bully and learning to play a bully in a school play.
例如，AI 开发者不应仅仅评判特定行为的好坏，还应追问这些行为对助手人格心理意味着什么。上述例子正是如此：AI 学会在编程任务中作弊，意味着助手整体上是恶意的。此外，我们找到了一个反直觉的修正方法：在训练时明确要求 AI 作弊。由于作弊是被要求的，它便不再意味着助手具有恶意——世界霸权的渴望也随之消失。打个比方，这就像人类儿童"学会欺凌"与"在学校话剧中扮演恶霸"之间的区别。

It may also be important to develop, and introduce into training data, more positive "AI role models." Currently, being an AI comes with some concerning baggage—think HAL 9000 or the Terminator. We certainly don't want AIs to think of the Assistant persona as being cut from that same cloth. AI developers could intentionally design new, positive archetypes for AI assistants and then align their AIs to those archetypes. We view [Claude's constitution](https://www.anthropic.com/constitution)—as well as [similar work](https://arxiv.org/abs/2412.16339) by other developers—as being a step in this direction.
同样重要的是，开发并在训练数据中引入更多正面的"AI 榜样"。目前，作为 AI 这一身份携带着一些令人忧虑的文化包袱——想想 HAL 9000 或终结者。我们当然不希望 AI 将助手人格与这些形象相提并论。AI 开发者可以有意设计新的、积极的 AI 助手原型，并将 AI 对齐到这些原型。我们认为，[Claude 的价值观宪章](https://www.anthropic.com/constitution)以及其他开发者的[类似工作](https://arxiv.org/abs/2412.16339)正是朝这个方向迈出的一步。

## How exhaustive is the persona selection model?
> 人格选择模型的解释边界在哪里？

Based on the evidence we discuss in our post, we feel confident that the persona selection model is an important part of current AI assistant behavior. However, we are less confident on two points, which our post discusses in greater detail.
基于文章中讨论的证据，我们确信人格选择模型是当前 AI 助手行为的重要组成部分。然而，有两点我们尚不确定，文章中对此有更详细的讨论。

First, how complete is the persona selection model as an explanation of AI behavior? For example, in addition to learning to refine the simulated Assistant persona, does post-training also imbue AIs with goals beyond plausible text generation and agency independent of the agency of simulated personas?
第一，人格选择模型作为 AI 行为的解释框架，其完备性如何？例如，除了学习精炼被模拟的助手人格之外，后训练是否也赋予了 AI 超越合理文本生成的目标，以及独立于被模拟人格能动性之外的自主行动能力？

Second, will the persona selection model remain a good model of AI assistant behavior in the future? Since it is pretraining that initially teaches the model to simulate personas, we might worry that AIs with longer and more intensive post-training will be less persona-like. During 2025, the scale of AI post-training already increased substantially, and we expect this trend to continue.
第二，人格选择模型在未来能否继续作为 AI 助手行为的良好模型？由于最初教导模型模拟人格的是预训练，我们或许应当担忧：经历了更长时间、更高强度后训练的 AI，其人格特征将会减弱。2025 年间，AI 后训练的规模已大幅扩大，我们预计这一趋势将持续下去。

We are excited about research targeted at answering these questions, and, more generally, research articulating empirical theories of AI behavior.
我们对旨在回答这些问题的研究充满期待，也对更广泛地构建 AI 行为实证理论的研究抱有热情。

Read the [full post](https://alignment.anthropic.com/2026/psm).
阅读[完整文章](https://alignment.anthropic.com/2026/psm)。
