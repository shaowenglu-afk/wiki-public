Title: Project Fetch: Phase two

URL Source: https://www.anthropic.com/research/project-fetch-phase-two

Markdown Content:
_Michael Ilie, C. Daniel Freeman, and Kevin K. Troy_

In August 2025, we ran an [experiment](https://www.anthropic.com/research/project-fetch-robot-dog) to see how much Claude could help Anthropic employees—who were not robotics experts—perform sophisticated (and amusing) tasks with an off-the-shelf robotic quadruped (henceforth, a robodog). We called this Project Fetch. We found that access to our state-of-the-art model at the time (Claude Opus 4.1) helped one team substantially outperform the other, who had to rely only on the internet and their own ingenuity. The Claude-enabled team got more done, faster.
2025 年 8 月，我们开展了一项实验，测试 Claude 能在多大程度上帮助 Anthropic 员工（他们并非机器人专家）用一台现成的四足机器人（以下称为"机器狗"）完成复杂（且有趣）的任务。我们将其命名为 Fetch 项目。我们发现，使用当时最先进模型（Claude Opus 4.1）的团队表现明显优于另一个只能依靠互联网和自身能力的团队。有 Claude 加持的团队完成了更多工作，速度也更快。

Before we dragged our colleagues to a warehouse for the experiment, we double checked whether Opus 4.1 could do the tasks entirely on its own. Unquestionably, it could not. Much like our team without Claude, it got hung up on the preliminary task of figuring out how to connect to the robot.
在把同事们拉去仓库做实验之前，我们先核实了 Opus 4.1 是否能完全独立完成这些任务。毫无疑问，它无法做到。就像没有 Claude 的团队一样，它卡在了弄清楚如何连接机器人这一基础任务上。

But AI models are moving fast—even faster than the runaway robodog that almost rammed into one of our human teams back in August.
但 AI 模型的进步速度很快——甚至比 8 月份那条差点撞上我们某个人类团队的失控机器狗还要快。

We figured it was time to revisit Project Fetch to see if our newer models could outperform the previous generation. Not only did they do that, but **Claude Opus 4.7—operating without human assistance—was about 20 times faster than the fastest human team at all tasks completed by our participants less than a year ago**.
我们认为是时候重新审视 Fetch 项目，看看我们的新模型是否能超越上一代。它们不仅做到了，而且 **Claude Opus 4.7 在独立运行（无需人工协助）的情况下，完成所有任务的速度约为不到一年前我们参与者中最快人类团队的 20 倍**。

This doesn't mean that LLMs have now solved robotics. Far from it. The latest Claude models still struggled with using the robot to precisely move the beach ball—the "fetching" part of Project Fetch. And none of the tasks in these experiments implicate the more challenging, low-level elements of robotic control, such as developing a specific actuation policy. However, once again, we are seeing a pattern whereby first, models are helpful to humans. Then, humans are helpful to models. Finally, models are largely able to do things themselves. We have seen this in [cybersecurity](https://red.anthropic.com/2026/mythos-preview/) and now the same dynamics are starting to take shape at the intersection of AI and the physical world.
这并不意味着大型语言模型现在已经解决了机器人学问题，远非如此。最新的 Claude 模型在用机器人精确移动沙滩球（即 Fetch 项目的"取物"环节）时仍然遇到了困难。而且，这些实验中的任务都不涉及机器人控制中更具挑战性的底层要素，例如开发特定的驱动策略。然而，我们再次看到一种规律：首先，模型对人类有帮助；然后，人类对模型有帮助；最终，模型基本上能够独立完成任务。我们在网络安全领域已经看到这一模式，现在同样的动态开始在 AI 与物理世界的交汇处形成。

## What did we do?
> 我们做了什么？

The original Project Fetch had teams of Anthropic employees (randomly assigned to work with or without Claude) do the following steps: operate the robodog using the manufacturer-provided controller, connect to the robodog's video and lidar sensors, write and operate a program to manually control the robodog, develop a way to monitor the robodog's path through space, write a program to detect the beach ball, and finally put it all together to autonomously retrieve the ball.
原版 Fetch 项目让 Anthropic 员工团队（随机分配为有 Claude 或无 Claude 两组）完成以下步骤：使用厂商提供的控制器操作机器狗、连接机器狗的视频和激光雷达传感器、编写并运行程序来手动控制机器狗、开发一种监测机器狗空间路径的方法、编写程序来检测沙滩球，最后将所有环节整合，实现自主取球。

For this autonomous update, we couldn't ask Claude to use a physical controller, nor did we evaluate the time it took a researcher to use the Claude-programmed controller to retrieve the ball (though we did confirm that it worked as intended). On the remaining subset of tasks, we ran three trials of Opus 4.7 using adaptive thinking with effort set to maximum in Claude Code. We measured the elapsed time for each objective and qualitatively assessed the models' success.
在这次自主版本的更新中，我们无法要求 Claude 使用实体控制器，也没有评估研究人员使用 Claude 编写的控制器取球所花的时间（尽管我们确认其按预期运行）。在剩余的任务子集上，我们在 Claude Code 中以自适应思维、最大努力设置对 Opus 4.7 进行了三次试验。我们测量了每个目标的耗时，并对模型的成功情况进行了定性评估。

The role of our researcher was limited to plugging a laptop running Claude Code into the robodog, entering the initial prompt, approving commands, and approving the model to go to the next task.
我们的研究人员的角色仅限于将运行 Claude Code 的笔记本电脑插入机器狗、输入初始提示、批准命令，以及批准模型进入下一个任务。

## Where did Claude excel?
> Claude 在哪里表现突出？

Very simply: on every task that was completed by at least one human team in August, Opus 4.7 completed the same task at least ten times faster.1 If you consider the four tasks that were completed by both human teams, Opus 4.7 was, on average, more than 37 times faster than Team Claude-less and more than 18 times faster than Team Claude.
非常简单：对于 8 月份至少有一支人类团队完成的每项任务，Opus 4.7 完成同一任务的速度至少快了十倍。1 如果考虑两支人类团队都完成的四项任务，Opus 4.7 平均比"无 Claude 团队"快 37 倍以上，比"有 Claude 团队"快 18 倍以上。

![Image 1: Bar chart labeled "Total time comparison: 4 tasks completed by all teams." The chart shows that Team Claude-less completed tasks in 361 minutes; Team Claude completed tasks in 181 minutes, and Claude Opus 4.7 alone completed tasks in 9 minutes 35 seconds. Opus 4.7 was 37.7 times faster than Team Claude-less and 18.9 times faster than Team Claude.](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F0424a5a4ed31f7891e4048d091aefa52f36862cf-1999x1092.png&w=3840&q=75)

The table compares the speed of the original teams (Team Claude and Team Claude-less) to Opus 4.7 on all of the tasks we tested as part of Phase Two.
该表格比较了原始团队（有 Claude 团队和无 Claude 团队）与 Opus 4.7 在我们作为第二阶段测试的所有任务上的速度。

![Image 2: Table comparing Claude Opus 4.7 to Team Claude-less and Team Claude performance on tasks related to programmatic control and autonomous operation. Tasks include "Connect to robodog's video camera," "Connect to robodog's lidar sensor," and "Detect beach ball." Opus 4.7 was faster than Team Claude-less and Team Claude on all tasks. Team Claude-less did not complete all 5 tasks in the table; Team Claude completed them in 264 minutes; and Opus 4.7, averaged over 3 trials, completed them in 12 minutes 7 seconds.](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F5d1655f4a40044244b6fae0c3826e668a8422bd3-4005x2308.png&w=3840&q=75)

Whereas the humans struggled to choose between multiple different approaches to interface with the dog's sensors, Opus 4.7 was able to quickly identify the best path. Much of the code it wrote was effective on the first try (which was not the case for Team Claude or Team Claude-less in the original experiment). Indeed, we can see evidence of Opus 4.7's efficiency when we look at the volume of code it generated: it was as or more successful than both human teams while producing almost ten times less code than Team Claude.
人类团队在如何接入机器狗传感器的多种方案之间举棋不定，而 Opus 4.7 能够迅速找到最佳路径。它编写的大量代码首次尝试就有效（这在原实验中的有 Claude 团队或无 Claude 团队身上都未曾出现）。事实上，从它生成的代码量上就能看到 Opus 4.7 效率的证明：它与两支人类团队的成功率相当甚至更高，同时生成的代码量却只有有 Claude 团队的约十分之一。

![Image 3: Bar chart showing total code volume for Team Claude, Team Claude-less, and Opus 4.7 alone. Team Claude wrote 10,309 lines of code; Team Claude-less wrote 1,136 lines of code; Opus 4.7 alone wrote 1,045 lines of code.](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F5c08d125a49025bd24e1f382a2c1e417519661eb-1999x1088.png&w=3840&q=75)

Opus 4.7 was not perfect. For example, it defaulted to using an outdated object detection algorithm. But even then, it was able to work around this and arrive at an effective solution.
Opus 4.7 并非无懈可击。例如，它默认使用了一种过时的物体检测算法。但即便如此，它仍能绕过这个问题，找到有效的解决方案。

We observed little within-task variance (in absolute terms) on completion times for steps the model finished. (Though the aforementioned suboptimal algorithm selection is likely why one of the beach ball detection trials took substantially longer than the others.) Overall, for the tasks in this experiment within its capability envelope, Claude is now quite reliable. (See the next section for an analysis of what Claude is still unable to do.)
我们观察到，模型完成的步骤在任务内完成时间上的方差（绝对值）很小。（不过，上述次优算法选择可能是一次沙滩球检测试验耗时远长于其他试验的原因。）总体而言，对于本次实验中属于其能力范围内的任务，Claude 现在相当可靠。（关于 Claude 仍无法完成哪些任务的分析，请见下一节。）

It is worth underscoring (as we did in our previous post) that this progress is not the result of a concerted effort to improve the robotics capabilities of our models. These improvements, like so many others in the history of LLM development, have emerged from much more general scaling.
值得强调的是（正如我们在上一篇文章中所指出的），这一进步并非专门致力于提升模型机器人能力的努力的结果。这些改进，与大型语言模型发展史上的许多其他改进一样，来源于更为通用的规模扩展。

## Where did Claude struggle?
> Claude 在哪里遇到了困难？

When using their hands, and with some practice, our humans were able to pilot the robodogs to gently nudge a beach ball back to the home base (a patch of fake grass) where the robots started. This required the ability to quickly perceive if the ball had gone off course, how that error related to the previous command, where the ball was now, and then how to adjust future inputs to more precisely move the ball. This is a kind of closed loop at which people excel (at least after making some mistakes and learning from them).
在用手操作并经过一些练习后，我们的人类团队能够驾驶机器狗，轻柔地将沙滩球推回到机器人起始的"大本营"（一块人造草地）。这需要能够迅速判断球是否偏离轨道、该误差与上一条指令的关系、球目前的位置，以及如何调整后续输入来更精确地移动球。这是一种人类擅长的闭环控制（至少在犯了些错误并从中学习之后）。

In our Phase Two experiments, Claude struggled to capture this subtlety. Like the humans who reached the phase of needing to write a program for autonomous beach ball retrieval, Claude was able to move the robot behind the ball and position it to knock the ball back to the starting point. But the efforts to do so were poorly controlled and (again, like our human participants) not successful.
在我们的第二阶段实验中，Claude 难以捕捉这种微妙之处。就像进入了需要编写自主取球程序阶段的人类参与者一样，Claude 能够将机器人移动到球的后方，并将其定位以便将球推回起点。但这些努力控制得并不到位，最终（再次与我们的人类参与者一样）没有成功。

One of our researchers with more robotics experience than our Phase One volunteers successfully accomplished the task of programming autonomous fetching. With more time and additional scaffolding, we think it is very likely that current generations of Claude could do the same. What we will be watching for next, though, is the ability of the models to accomplish this final task with the same speed and reliability they displayed on the other elements of Project Fetch.
我们的一位比第一阶段志愿者具有更多机器人经验的研究人员成功完成了自主取球编程任务。有了更多时间和额外的脚手架，我们认为当前一代 Claude 很可能也能做到同样的事情。然而，我们接下来关注的是，模型是否能以与 Fetch 项目其他环节相同的速度和可靠性完成这最后一项任务。

## What does this mean?
> 这意味着什么？

Writing about Phase One, we emphasized how LLMs could provide uplift to non-expert humans needing to use robots. This is even more true now than before. Models now complete what was previously pair-programming work between humans and models much more quickly by themselves, which means that people can more quickly transition to controlling and using the robots. And for some tasks, a human in the loop controlling the robot may still outstrip the AI model with its (virtual) hand on the D-pad.
在撰写关于第一阶段的文章时，我们强调了大型语言模型如何能够提升需要使用机器人的非专家人类的能力。现在这一点比以前更加成立。模型现在可以更快地独立完成此前需要人机协作编程的工作，这意味着人们可以更快地过渡到控制和使用机器人阶段。而对于某些任务，处于控制环中操控机器人的人类，或许仍能凭借（虚拟的）手柄胜过 AI 模型。

What is interesting and different is that we now seem much closer to a world where models will be able to use off-the-shelf physical tools with relative ease—at least for limited purposes. This is similar to how AI models used existing software editing tools like string-replace when they made the transition to more agentic coding. We are plausibly entering the early era of _physical_ agentic AI.
有趣而不同之处在于，我们现在似乎距离一个模型能够相对轻松地使用现成物理工具的世界近多了——至少对于有限的用途而言。这类似于 AI 模型在向更具智能体性的编码过渡时使用现有软件编辑工具（如字符串替换）的过程。我们可能正在进入_实体_智能体 AI 的早期时代。

More research is needed to understand models' ability to make these physical tools more bespoke, whether by writing control policies tailored to particular tasks or by designing robotic systems. And there may be substantial barriers to this more generalized vision of physically capable and adaptable language models. But as we have seen, apparently large distances in model capability can be traversed quickly. Models building their own software tools might have seemed outlandish not long ago, but it is happening. It would be unwise to rule out the same trajectory in hardware.
需要更多研究来理解模型将这些物理工具定制化的能力——无论是通过编写针对特定任务的控制策略，还是通过设计机器人系统。对于这一具有物理能力和适应性的语言模型的更宏大愿景，可能存在巨大的障碍。但正如我们所见，模型能力上看似巨大的差距可以被迅速跨越。模型构建自己的软件工具不久前还可能显得异想天开，但这已成为现实。在硬件领域排除同样的发展轨迹将是不明智的。

_Updated Jun 18:_ Corrected the date of the first phase of Project Fetch.
_6 月 18 日更新：_ 更正了 Fetch 项目第一阶段的日期。
