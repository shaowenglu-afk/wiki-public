Title: Long-running Claude for scientific computing

URL Source: https://www.anthropic.com/research/long-running-Claude

Markdown Content:
_In this post, Siddharth Mishra-Sharma_, _a researcher on the Discovery team, explains how to apply multi-day agentic coding workflows—test oracles, persistent memory, and orchestration patterns—to scientific computing tasks even outside of one's domain._
_在这篇文章中，Discovery团队的研究员Siddharth Mishra-Sharma解释了如何将多天的智能体编程工作流——测试预言（test oracle）、持久化记忆和编排模式——应用于科学计算任务，即便是在自己专业领域之外。_

### **The premise**
> **前提**

Most scientists currently using AI agents work in a conversational loop, managing each step of the process on a tight leash. As models have become [significantly better at long-horizon tasks](https://metr.org/time-horizons/) over the last year or so, a new way of working emerged: rather than getting involved with every detail, we can specify the high-level objective and set a team of agents loose to work autonomously. This makes it possible to complete projects in mere hours that might otherwise take us days, weeks, or even months. Certain types of scientific tasks fit well within this model, e.g., reimplementing a numerical solver, converting legacy scientific software written in an old Fortran dialect to a modern language, and debugging a large codebase against a reference implementation. These are tasks where the work is well-scoped, the success criteria are clear, and human oversight can be occasional rather than continuous.
目前使用AI智能体的大多数科学家工作于对话循环中，对流程的每一步都保持着紧密的掌控。随着过去一年左右模型在长周期任务上变得显著更强，一种新的工作方式应运而生：与其介入每一个细节，不如指定高层目标，让一组智能体自主运作。这使得原本可能需要数天、数周甚至数月的项目，在短短几小时内就能完成。某些类型的科学任务非常适合这种模式，例如：重新实现一个数值求解器、将老旧Fortran方言写成的遗留科学软件转换为现代语言，或根据参考实现调试大型代码库。这些任务范围明确、成功标准清晰，人工监督可以是偶发性的而非持续性的。

Anthropic's [C compiler project](https://www.anthropic.com/engineering/building-c-compiler) demonstrated a version of this, where Claude worked across roughly 2,000 sessions to build a C compiler capable of compiling the Linux kernel. This post describes how to set up a similar pattern for scientific computing tasks using Claude Code, with a typical academic lab in mind. As a concrete example, I will walk through using Claude Opus 4.6 to [implement a differentiable version of a cosmological Boltzmann solver](https://github.com/smsharma/clax). This is numerical code that predicts the statistical properties of the afterglow of the Big Bang—the Cosmic Microwave Background, or CMB. It does this by evolving coupled equations for photons, baryons, neutrinos, and dark matter through the early universe.
Anthropic的C编译器项目展示了这种方式的一个版本，其中Claude跨越约2,000次会话，构建了一个能够编译Linux内核的C编译器。本文描述了如何使用Claude Code为科学计算任务设置类似的模式，以典型的学术实验室为背景。作为具体示例，我将介绍使用Claude Opus 4.6实现宇宙学玻尔兹曼求解器的可微分版本的过程。这是预测宇宙大爆炸余晖——宇宙微波背景（CMB）——统计特性的数值代码，通过演化早期宇宙中光子、重子、中微子和暗物质的耦合方程来实现。

Boltzmann solvers like [CLASS](http://class-code.net/) and [CAMB](https://camb.info/) are core pieces of scientific infrastructure in cosmology, allowing us to constrain cosmological models using data from surveys like _Planck_ and the _Simons Observatory._ A differentiable version—one that can propagate gradients through the full solver—enables the use of gradient-based inference methods, dramatically speeding up parameter estimation. Writing it in JAX is a natural fit here, since it gives us automatic differentiation and compatibility with accelerators (e.g., GPUs) essentially for free.
CLASS和CAMB等玻尔兹曼求解器是宇宙学核心科学基础设施，允许我们使用普朗克卫星和西蒙斯天文台等巡天项目的数据来约束宇宙学模型。可微分版本——能够在整个求解器中传播梯度——使得基于梯度的推断方法成为可能，从而大幅加速参数估计。用JAX编写它在这里是自然之选，因为它几乎免费地提供了自动微分和与加速器（如GPU）的兼容性。

Notably, the task isn't in my core scientific domain—I have a high-level familiarity with the tools and the science, but don't have the expertise to complete it myself in any reasonable time frame. Groups who _do_ have that expertise have built [differentiable](https://arxiv.org/abs/2311.03291)[solvers](https://arxiv.org/abs/2602.15104) in JAX with a subset of the features present in CLASS. These efforts typically represent months to years of researcher-time. The point here was to see if an agent could go further with minimal steering from a non-domain expert.
值得注意的是，这个任务并不在我的核心科学领域——我对相关工具和科学有高层次的了解，但没有在合理时间框架内独立完成它的专业知识。确实拥有这些专业知识的团队已经用JAX构建了具有CLASS部分功能的可微分求解器。这些努力通常代表着数月至数年的研究人员工时。这里的重点是看看智能体是否能够在非领域专家的最少引导下走得更远。

This kind of task is structurally different from the C compiler project, which can be farmed out to a large number of parallel agents. A Boltzmann solver, on the other hand, is a deeply coupled pipeline—a small numerical error or poor approximation in modeling how the early universe recombines can subtly shift everything downstream. It thus requires a different set of agent skills. Debugging requires tracing causally through the entire chain and drawing from domain knowledge, which may be better suited to a single agent working sequentially, spawning subagents as needed, and using the reference implementation to bisect discrepancies.
这类任务在结构上与C编译器项目不同，后者可以分发给大量并行智能体。而玻尔兹曼求解器是一个深度耦合的管道——在模拟早期宇宙复合过程时，一个微小的数值误差或不良近似都可能微妙地影响下游的一切。因此，它需要不同的智能体技能。调试需要在整个链条中进行因果追踪并借助领域知识，这可能更适合单个智能体按顺序工作，按需生成子智能体，并利用参考实现来排查差异。

We'll use an HPC cluster running the SLURM job scheduler as our compute environment, but the core ideas—a progress file, a test oracle, an agent prompt with clear rules—apply regardless of where you run Claude Code.
我们将使用运行SLURM作业调度器的HPC（高性能计算）集群作为计算环境，但核心理念——进度文件、测试预言、带有明确规则的智能体提示——无论你在哪里运行Claude Code都适用。

### **Draft a plan and iterate locally**
> **起草计划并在本地迭代**

In this shift toward managing an autonomous research team of agents, you should spend most of your time (in consultation with Claude), crafting a set of instructions that clearly articulates the project's deliverables and relevant context. These instructions should live in a CLAUDE.md file located in the root directory. Claude treats this file specially, keeping it in context and referencing it for the overall plan. Crucially, Claude can edit these instructions as it works, updating them for future work as it works through issues.
在向管理自主智能体研究团队的转变中，你应该将大部分时间（与Claude协商）用于制定一套清晰阐明项目交付物和相关背景的指令。这些指令应存放在根目录的CLAUDE.md文件中。Claude会特别对待这个文件，将其保存在上下文中并将其作为整体计划的参考。关键的是，Claude可以在工作过程中编辑这些指令，在解决问题的过程中为未来的工作更新它们。

[Here](https://github.com/smsharma/clax/blob/6a6b2330cf25edded1bb31ec57a0091aa794a5d3/CLAUDE.md) is an early CLAUDE.md for the cosmological Boltzmann solver project, showing the overall plan and design decisions codified after an initial attempt at writing the solver. To arrive at this, I specified the high-level goals of the project—achieving full feature-parity with the reference CLASS implementation while being fully differentiable, and having an accuracy target of 0.1% against CLASS in the main science deliverables—and iterated with Claude until the plan seemed satisfactory. Given that 0.1% is the typical level of agreement between the two canonical Boltzmann codes CLASS and CAMB, this seemed like a good science target.
以下是宇宙学玻尔兹曼求解器项目的早期CLAUDE.md文件，展示了在初次尝试编写求解器后整理出的整体计划和设计决策。为了达到这一结果，我指定了项目的高层目标——在完全可微分的同时实现与参考CLASS实现的完整功能对等，并在主要科学交付物上对CLASS达到0.1%的精度目标——并与Claude反复迭代直到计划令人满意。鉴于0.1%是两个典型玻尔兹曼代码CLASS和CAMB之间典型的一致程度，这似乎是一个合适的科学目标。

### **Memory across sessions**
> **跨会话的记忆**

The progress file, which by convention we call here CHANGELOG.md, is the agent's portable long-term memory, acting as a sort of lab notes. In CLAUDE.md, Claude was instructed to keep track of progress in this file.
进度文件（按惯例我们在这里称为CHANGELOG.md）是智能体的便携式长期记忆，起到一种实验记录的作用。在CLAUDE.md中，Claude被指示在这个文件中跟踪进度。

A good progress file might track current status, completed tasks, failed approaches and why they didn't work, accuracy tables at key checkpoints, and known limitations. The failed approaches are important—without them, successive sessions will re-attempt the same dead ends. An entry might look like: "Tried using Tsit5 for the perturbation ODE, system is too stiff. Switched to Kvaerno5." [Here](https://github.com/smsharma/clax/blob/main/CHANGELOG.md) is the changelog for the running example, showing these elements.
一个好的进度文件可能会追踪当前状态、已完成的任务、失败的方案及其失败原因、关键检查点的精度表格，以及已知的局限性。失败的方案很重要——没有它们，后续会话将会重复尝试同样的死路。一条记录可能看起来像："尝试使用Tsit5求解扰动ODE，系统过于刚性，改用Kvaerno5。"以下是运行示例的更新日志，展示了这些元素。

### **The test oracle**
> **测试预言**

While more open-ended scientific discovery via agents is certainly on the horizon, long-running autonomous scientific work today crucially depends on the agent having a way to know whether it's making progress. For scientific code, this could be a reference implementation, a clearly quantifiable objective, or an existing test suite. It can also be helpful to instruct the agent to expand the test suite and run tests as it works, to prevent regressions. In my example task, Claude was instructed to construct and continuously run unit tests using [CLASS C source](https://github.com/lesgourg/class_public) as a reference implementation.
虽然通过智能体进行更开放式的科学发现无疑即将到来，但当今长时间运行的自主科学工作关键在于智能体拥有一种知道自己是否在取得进展的方式。对于科学代码，这可以是参考实现、清晰可量化的目标或现有的测试套件。指示智能体在工作过程中扩展测试套件并运行测试以防止回归，也很有帮助。在我的示例任务中，Claude被指示使用CLASS C源代码作为参考实现来构建并持续运行单元测试。

### **Git as coordination**
> **Git作为协调工具**

Git can be a good way to monitor and coordinate the agent's progress in a hands-off manner. The agent should commit and push after every meaningful unit of work. This gives you a recoverable history if something goes awry, makes progress visible locally, and prevents work from being lost if, for instance, your compute allocation runs out mid-session.
Git是一种以非干预方式监控和协调智能体进度的好方法。智能体应在每个有意义的工作单元完成后提交并推送。这在出现问题时给你提供了可恢复的历史记录，使进度在本地可见，并防止工作丢失，例如在计算配额在会话中途耗尽的情况下。

Practically, this could be a set of instructions in CLAUDE.md, e.g. "Commit and push after every meaningful unit of work. Run `pytest tests/ -x -q` before every commit. Never commit code that breaks existing passing tests."
在实践中，这可以是CLAUDE.md中的一组指令，例如："在每个有意义的工作单元完成后提交并推送。每次提交前运行`pytest tests/ -x -q`。永不提交会破坏现有通过测试的代码。"

For steering the agent, you can always SSH into the cluster and manually re-prompt and/or update its instructions. It is typically more ergonomic to simply ask a local instance of Claude Code to SSH in and run commands for you; this will also apply to everything described below.
对于引导智能体，你可以随时SSH进入集群并手动重新提示和/或更新其指令。通常更方便的做法是直接要求本地的Claude Code实例SSH进入并为你运行命令；这同样适用于下面描述的所有内容。

### **The execution loop**
> **执行循环**

As mentioned above, it's often useful to first iterate on the plan locally until you have one that looks reasonable and is encoded in CLAUDE.md. From there, start a Claude Code session inside a terminal multiplexer like tmux on a compute node, tell the agent where to find your codebase, and let it cook. Because the session runs inside tmux, you can detach, close your laptop, and occasionally check on progress (in the case of the Boltzmann solver, I would check in on GitHub on my phone, e.g. while waiting in line for a coffee).
如上所述，通常有用的做法是先在本地迭代计划，直到获得一个看起来合理并编码在CLAUDE.md中的计划。之后，在计算节点上的tmux等终端复用器中启动Claude Code会话，告诉智能体在哪里找到你的代码库，然后让它运行。由于会话在tmux中运行，你可以断开连接，合上笔记本，偶尔检查进度（以玻尔兹曼求解器为例，我会在手机上查看GitHub，例如在排队买咖啡时）。

On an HPC cluster you might request a node through the SLURM scheduler, and an example job script that launches Claude Code in a tmux session might look like the following:
在HPC集群上，你可能通过SLURM调度器申请一个节点，一个在tmux会话中启动Claude Code的示例作业脚本可能如下所示：

```
#!/bin/bash
#SBATCH --job-name=claude-agent
#SBATCH --partition=GPU-shared
#SBATCH --gres=gpu:h100-32:1
#SBATCH --time=48:00:00
#SBATCH --output=agent_%j.log
cd $PROJECT/my-solver
source .venv/bin/activate
export TERM=xterm-256color
tmux new-session -d -s claude "claude; exec bash"
tmux wait-for claude
```

Once the job starts, you attach to the tmux session, give Claude Code direction (e.g., "Read CHANGELOG.md and pick up the next task"), and detach when you're satisfied it's on the right track. You can re-attach whenever you want to check in, steer, or start a new task using something like:
一旦作业启动，你附加到tmux会话，给Claude Code指示（例如，"读取CHANGELOG.md并继续下一个任务"），当你满意它走在正确轨道上时就断开连接。你可以随时使用如下命令重新附加以检查进度、引导或启动新任务：

`srun --jobid=JOBID --overlap --pty tmux attach -t claude`

**The Ralph loop:** As models get more capable, they require less bespoke orchestration such as prompt engineering, RAG, or context stuffing. At a given point in time, however, it can be useful to provide some level of scaffolding as a capability uplift. For example, current models can suffer from _agentic laziness_—when asked to complete a complex, multi-part task, they can sometimes find an excuse to stop before finishing the entire task ("It's getting late, let's pick back up again tomorrow?").
**Ralph循环：** 随着模型变得更加强大，它们需要的定制化编排（如提示工程、RAG或上下文填充）越来越少。然而，在某个给定时间点，提供一定程度的脚手架作为能力提升是有用的。例如，当前模型可能患有"智能体懒惰"——当被要求完成一项复杂的多部分任务时，它们有时会找借口在完成整个任务之前停下来（"时间不早了，我们明天继续吧？"）。

To circumvent this, a useful orchestration pattern is the [_Ralph loop_](https://ghuntley.com/loop/), which is essentially a _for_ loop which kicks the agent back into context when it claims completion, and asks if it's _really_ done. This can be useful for long-running tasks since the agent will admit the task is not up to spec, and continue working until it is. Other similar patterns include [GSD](https://github.com/gsd-build/get-shit-done) (and [domain-specific](https://arxiv.org/abs/2603.20179)[variants](https://github.com/psi-oss/get-physics-done)) as well as the native-to-Claude Code /loop command.
为了规避这一点，一个有用的编排模式是Ralph循环，本质上是一个for循环，当智能体声称完成时将其踢回上下文，并询问它是否真的完成了。这对于长时间运行的任务很有用，因为智能体会承认任务不符合规格，并继续工作直到符合为止。其他类似的模式包括GSD（以及领域特定变体）以及Claude Code原生的/loop命令。

Ralph can be installed via /plugin. A typical invocation prompt in Claude Code could look like
Ralph可以通过/plugin安装。在Claude Code中的典型调用提示可能如下所示：

`/ralph-loop:ralph-loop "Please keep working on the task until the success criterion of 0.1% accuracy across the entire parameter range is achieved." --max-iterations 20 --completion-promise "DONE"`

Here, Claude will iterate up to 20 times until it guarantees that the task is done with a "DONE" incantation.
在这里，Claude将最多迭代20次，直到它用"DONE"咒语保证任务已完成。

### **The result**
> **结果**

Claude worked on [the project](https://github.com/smsharma/clax) from scratch over a few days, reaching sub-percent agreement with the reference CLASS implementation across its various outputs. I asked Claude to reconstruct the accuracy of some of the main outputs of the code—the various CMB angular power spectra—over the course of the project, also labeling milestones during development. It produced the plot below, illustrating the path to sub-percent accuracy.
Claude从头开始在几天内完成了该项目，在其各种输出上达到了与参考CLASS实现的亚百分比一致性。我要求Claude重建代码主要输出——各种CMB角功率谱——在整个项目过程中的精度，同时标记开发过程中的里程碑。它生成了下图，展示了达到亚百分比精度的路径。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2Fd6b037407956ad8d5317c97730fd9f273a6a6afa-1680x880.png&w=3840&q=75)

The path to sub-percent accuracy over time as the agent worked on the codebase.
智能体处理代码库过程中随时间推移达到亚百分比精度的路径。

The agent's development trajectory was somewhat clunky. For example, there were clear gaps in its test coverage—for a while it was only testing the code at a single (fiducial) parameter point, drastically reducing its bug-catching surface area. It can also make elementary mistakes, such as tripping over gauge conventions or spending hours chasing bugs that a cosmologist would spot instantly, but it kept making sustained progress towards the stated goal of sub-percent accuracy.
智能体的开发轨迹有些磕绊。例如，其测试覆盖范围存在明显缺口——有一段时间它只在单个（基准）参数点测试代码，大幅减少了其捕获错误的覆盖面积。它也会犯基础性错误，例如在规范约定上绊倒，或花费数小时追踪一个宇宙学家会立即发现的错误，但它始终保持着朝着亚百分比精度这一既定目标的持续进展。

A side effect of the project was that I learned a surprising amount about Boltzmann solvers and the physics they model by watching the git commit history. The project isn't drawn from my core scientific domain, but following Claude's incremental progress and looking up what I didn't recognize turned out to be an effective way to osmose the science. The [commit log](https://github.com/smsharma/clax/commits/main/) reads like lab notes from a fast, hyper-literal postdoc.
这个项目的一个副作用是，通过观察git提交历史，我对玻尔兹曼求解器及其建模的物理学有了意外的大量了解。这个项目不属于我的核心科学领域，但跟随Claude的渐进进展并查找我不认识的内容，结果成为一种有效地吸收这门科学的方式。提交日志读起来像一个工作效率极高、字面理解能力超强的博士后的实验记录。

While the resulting solver is not production-grade (e.g., it doesn't match the reference CLASS implementation to an acceptable accuracy in every regime), it demonstrates that agent-driven development can compress months or even years of researcher work into days.
虽然最终的求解器不是生产级别的（例如，它在每个参数区间都无法以可接受的精度匹配参考CLASS实现），但它证明了智能体驱动的开发可以将研究人员数月乃至数年的工作压缩到几天之内。

This kind of compression changes what counts as idle time. A universal experience in AI research is to launch an experiment (e.g., a training run) overnight and then have the satisfaction of seeing the results in the morning. Not running the experiment comes with an opportunity cost. These days, not running agents feels like it has a cost as well. If you have the compute and projects with well-defined success criteria, every night you _don't_ have agents working for you is potential progress left on the table.
这种压缩改变了什么算作闲置时间的定义。AI研究中一个普遍的体验是在夜间启动一个实验（例如一次训练运行），然后在早上看到结果时获得满足感。不运行实验会带来机会成本。如今，不运行智能体感觉也有代价。如果你有计算资源和具有明确成功标准的项目，每一个你没有让智能体为你工作的夜晚，都是桌面上未被触及的潜在进展。

### **Acknowledgments**

We thank Eric Kauderer-Abrams for peer-review, as well as Xander Balwit, Ethan Dyer, and Rebecca Hiscott for providing helpful feedback.
