Title: Project Glasswing: An initial update

URL Source: https://www.anthropic.com/research/glasswing-initial-update

Markdown Content:
Last month, we launched [Project Glasswing](https://www.anthropic.com/glasswing), our collaborative effort to secure the world's most critical software before increasingly capable AI models can be turned against it.

上个月，我们启动了 [Glasswing 项目](https://www.anthropic.com/glasswing)——这是我们的协作行动，旨在趁着日益强大的 AI 模型被用于攻击之前，率先加固全球最关键的软件。

Since then, we and our approximately 50 partners have used Claude Mythos Preview to find more than ten thousand high- or critical-severity vulnerabilities across the most systemically important software in the world. Progress on software security used to be limited by how quickly we could find new vulnerabilities. Now it's limited by how quickly we can verify, disclose, and patch the large numbers of vulnerabilities found by AI.

此后，我们和约 50 家合作伙伴借助 Claude Mythos Preview，在全球最具系统重要性的软件中发现了逾万个高危或严重级别漏洞。软件安全的进展过去受限于我们发现新漏洞的速度，而现在则受限于我们验证、披露和修补 AI 所发现的大量漏洞的速度。

In this post, we discuss what we've learned about this critical challenge for cybersecurity in the first weeks of Project Glasswing. We focus on the early public evidence of Mythos Preview's performance, on the initial results of our effort to scan thousands of open-source software projects, and on what this progress means for cyberdefenders today. We also cover what to expect next from Project Glasswing, and how we're thinking about releasing Mythos-class models in the future.

本文探讨我们在 Glasswing 项目启动初期就这一网络安全核心挑战所获得的认知。我们将聚焦于 Mythos Preview 性能的早期公开证据、扫描数千个开源软件项目的初步成果，以及这些进展对当今网络防御者的意义。同时，我们也将介绍 Glasswing 项目的后续进展预期，以及我们对未来发布 Mythos 级别模型的思考。

## Our early results
> 我们的早期成果

### Our approach to discussing Mythos Preview's findings
> 我们讨论 Mythos Preview 发现的方式

The software industry's longstanding convention is to disclose new vulnerabilities 90 days after they're discovered (or, if a patch is created before the 90 days is up, around 45 days after the patch becomes available). This allows time for end users to update their software before a vulnerability can be exploited by attackers. Our own [Coordinated Vulnerability Disclosure policy](https://www.anthropic.com/coordinated-vulnerability-disclosure) takes this approach.

软件行业长期以来的惯例是在漏洞发现 90 天后披露（或在 90 天届满前已发布补丁的情况下，在补丁发布约 45 天后披露）。这为终端用户在漏洞被攻击者利用之前更新软件预留了时间。我们自身的[协调漏洞披露政策](https://www.anthropic.com/coordinated-vulnerability-disclosure)也遵循这一方式。

However, this means that disclosed vulnerabilities are a lagging indicator of the accelerating frontier of AI models' cyber capabilities: we're not yet at the point where we can fully detail our partners' findings with Mythos Preview without putting end users at risk. Instead, we provide illustrative examples of the model's performance, along with aggregate statistics on our progress to date. Once patches for the vulnerabilities that Mythos Preview has discovered are widely deployed, we'll provide much more detail about what we've learned.

然而，这意味着已披露的漏洞是 AI 模型网络能力快速演进前沿的滞后指标：我们目前还无法在不使终端用户面临风险的情况下，全面披露合作伙伴借助 Mythos Preview 的发现详情。因此，我们提供模型性能的示例说明以及迄今进展的汇总统计数据。一旦 Mythos Preview 所发现漏洞的补丁得到广泛部署，我们将提供更为详尽的研究发现。

### Evidence from our partners and external testers
> 来自合作伙伴和外部测试人员的证据

Project Glasswing's initial partners build and maintain software that is fundamental to the functioning of the internet and other essential infrastructure. Fixing flaws in their code reduces risk for the many other organizations that rely on it, and therefore reduces risk for billions of end users.

Glasswing 项目的初始合作伙伴构建并维护着对互联网及其他关键基础设施正常运转至关重要的软件。修复其代码中的缺陷，能够降低众多依赖这些软件的组织所面临的风险，进而降低数十亿终端用户所承受的风险。

After one month, most partners have each found hundreds of critical- or high-severity vulnerabilities in their software. Collectively, they've found more than ten thousand. Several have told us that their rate of bug-finding has increased by more than a factor of ten. For instance, [Cloudflare](https://blog.cloudflare.com/cyber-frontier-models/) has found 2,000 bugs (400 of which are high- or critical-severity) across their critical-path systems, with a false positive rate that Cloudflare's team considers better than human testers.

一个月后，大多数合作伙伴各自在其软件中发现了数百个严重或高危漏洞，合计已超过一万个。多家合作伙伴告知我们，其发现漏洞的速度提升了十倍以上。例如，[Cloudflare](https://blog.cloudflare.com/cyber-frontier-models/) 在其关键路径系统中发现了 2,000 个漏洞（其中 400 个为高危或严重级别），误报率在 Cloudflare 团队看来优于人工测试人员。

This tallies with external testers' experience of Mythos Preview's performance, and with recent additional evaluations of the model:

这与外部测试人员对 Mythos Preview 性能的体验以及近期对该模型的其他评估结果相吻合：

*   **The UK's AI Security Institute**[reports](https://www.aisi.gov.uk/blog/how-fast-is-autonomous-ai-cyber-capability-advancing) that Mythos Preview is the first model to solve both of their cyber ranges (simulations of multistep cyberattacks) end to end;｜**英国 AI 安全研究所**[报告](https://www.aisi.gov.uk/blog/how-fast-is-autonomous-ai-cyber-capability-advancing)称，Mythos Preview 是首个端到端解决其两个网络靶场（多步骤网络攻击模拟）的模型；
*   **Mozilla**[found and fixed](https://blog.mozilla.org/en/privacy-security/ai-security-zero-day-vulnerabilities/)[271 vulnerabilities](https://hacks.mozilla.org/2026/05/behind-the-scenes-hardening-firefox/) in Firefox 150 while testing Mythos Preview—over ten times more than they found in Firefox 148 with Claude Opus 4.6;｜**Mozilla** 在测试 Mythos Preview 期间[发现并修复了](https://blog.mozilla.org/en/privacy-security/ai-security-zero-day-vulnerabilities/) Firefox 150 中的 [271 个漏洞](https://hacks.mozilla.org/2026/05/behind-the-scenes-hardening-firefox/)——是使用 Claude Opus 4.6 测试 Firefox 148 时发现漏洞数量的十倍以上；
*   **XBOW**，一个独立安全平台，[报告](https://xbow.com/blog/mythos-offensive-security-xbow-evaluation)称 Mythos Preview 在其 Web 漏洞利用基准测试中"显著优于所有现有模型"，并在每个 token 效益上提供了"前所未有的精准度"；
*   [**ExploitBench**](http://exploitbench.ai/) and [**ExploitGym**](https://arxiv.org/abs/2605.11086), two recently released academic benchmarks for measuring models' exploit development capabilities, show Mythos Preview as the strongest performer. We discuss what these benchmarks tell us about the model in more detail on our [Frontier Red Team blog](https://red.anthropic.com/2026/exploit-evals/).｜[**ExploitBench**](http://exploitbench.ai/) 和 [**ExploitGym**](https://arxiv.org/abs/2605.11086) 是两个近期发布的用于衡量模型漏洞利用开发能力的学术基准，均显示 Mythos Preview 表现最为出色。我们在[前沿红队博客](https://red.anthropic.com/2026/exploit-evals/)上对这些基准所揭示的模型信息进行了更详尽的讨论。

More generally, we're now seeing that patched software is being rolled out much more quickly. The latest Palo Alto Networks release included over [five times](https://www.paloaltonetworks.com/blog/2026/05/defenders-guide-frontier-ai-impact-cybersecurity-may-2026-update/) as many patches as usual. Microsoft [has reported](https://www.microsoft.com/en-us/msrc/blog/2026/05/a-note-on-patch-tuesday) that the number of new patches they'll release will "continue trending larger for some time." And Oracle is finding and fixing vulnerabilities across its products and cloud [multiple times faster](https://blogs.oracle.com/security/accelerating-vulnerability-detection-and-response-at-oracle) than before.

更普遍地，我们现在看到已修补软件的发布速度大幅加快。Palo Alto Networks 最新版本包含的补丁数量[超过往常的五倍](https://www.paloaltonetworks.com/blog/2026/05/defenders-guide-frontier-ai-impact-cybersecurity-may-2026-update/)。微软[报告称](https://www.microsoft.com/en-us/msrc/blog/2026/05/a-note-on-patch-tuesday)，其将发布的新补丁数量将"在一段时间内持续增加"。Oracle 也在以[比以往快数倍](https://blogs.oracle.com/security/accelerating-vulnerability-detection-and-response-at-oracle)的速度在其产品和云服务中发现和修复漏洞。

Mythos Preview has also proved useful for other kinds of security work. For example, at one of our Glasswing partner banks, Mythos Preview helped to detect and prevent a fraudulent $1.5 million wire transfer after a threat actor compromised a customer's email account and made spoof phone calls.

Mythos Preview 还在其他类型的安全工作中展现了价值。例如，在我们的一家 Glasswing 合作伙伴银行，当一名威胁行为者入侵客户电子邮件账户并发出欺诈电话后，Mythos Preview 协助检测并阻止了一笔 150 万美元的欺诈性电汇。

## Open-source software
> 开源软件

For the last few months, Anthropic has used Mythos Preview to scan more than 1,000 open-source projects, which collectively underpin much of the internet—and much of our own infrastructure.

过去几个月，Anthropic 使用 Mythos Preview 扫描了逾 1,000 个开源项目，这些项目共同支撑着互联网的大部分运作——以及我们自身的大量基础设施。

So far, Mythos Preview has found what it estimates are 6,202 high- or critical-severity vulnerabilities in these projects (out of 23,019 in total, including those it estimates as medium- or low-severity).

迄今为止，Mythos Preview 在这些项目中发现了其估计约 6,202 个高危或严重级别漏洞（总计 23,019 个，包括其估计为中低危级别的漏洞）。

1,752 of those high- or critical-rated vulnerabilities have now been carefully assessed by one of six independent security research firms, or in a small number of cases by ourselves. Of these, 90.6% (1,587) have proved to be valid true positives, and 62.4% (1,094) were confirmed as either high- or critical-severity. That means that even if Mythos Preview finds no further vulnerabilities, at our current post-triage true-positive rates, it's on track to have surfaced nearly 3,900 high- or critical-severity vulnerabilities in open-source code—in addition to those it has found for Project Glasswing's partners. To be clear, we intend to continue scanning open-source code for some time, so we expect this number to rise.

其中 1,752 个高危或严重级别漏洞已由六家独立安全研究机构之一进行了仔细评估，少数情况下由我们自身评估。在这些漏洞中，90.6%（1,587 个）被证实为有效的真阳性，62.4%（1,094 个）被确认为高危或严重级别。这意味着，即使 Mythos Preview 不再发现新漏洞，以我们当前的分诊后真阳性率来看，它已有望在开源代码中发现近 3,900 个高危或严重级别漏洞——此外还有为 Glasswing 项目合作伙伴发现的漏洞。明确地说，我们打算在一段时间内继续扫描开源代码，因此预期这一数字还会上升。

One example of an open-source vulnerability that Mythos Preview detected was in [wolfSSL](https://www.wolfssl.com/), an open-source cryptography library that's known for its security and is used by billions of devices worldwide. Mythos Preview [constructed an exploit](https://www.wolfssl.com/how-claude-mythos-preview-helped-harden-wolfssl/) that would let an attacker forge certificates that would (for instance) allow them to host a fake website for a bank or email provider. The website would look perfectly legitimate to an end user, despite being controlled by the attacker. We'll release our full technical analysis of this now-patched vulnerability (assigned [CVE-2026-5194](https://nvd.nist.gov/vuln/detail/CVE-2026-5194)) in the coming weeks.

Mythos Preview 检测到的一个开源漏洞存在于 [wolfSSL](https://www.wolfssl.com/) 中——这是一个以安全性著称、被全球数十亿设备使用的开源密码学库。Mythos Preview [构造了一个漏洞利用程序](https://www.wolfssl.com/how-claude-mythos-preview-helped-harden-wolfssl/)，能够允许攻击者伪造证书，例如托管一个银行或电子邮件服务商的虚假网站。该网站对终端用户而言看起来完全合法，尽管实际上由攻击者控制。我们将在未来数周内发布对这一现已修补漏洞（编号 [CVE-2026-5194](https://nvd.nist.gov/vuln/detail/CVE-2026-5194)）的完整技术分析。

As we noted above, the bottleneck in _fixing_ bugs like these is the human capacity to triage, report, and design and deploy patches for them. Finding them in the first place has become vastly more straightforward with Mythos Preview. We've created a [dashboard of the open-source vulnerabilities](https://red.anthropic.com/2026/cvd/) we've scanned, below, which shows the different steps in our disclosure process and will track our progress over time. This shows vulnerabilities of all severity levels, rather than only the subset initially assessed as high- or critical-severity by Mythos Preview. Note the steep drop-off at each phase, reflecting the amount of human effort required to verify and fix each of the vulnerabilities.

如上所述，_修复_此类漏洞的瓶颈在于人工分诊、报告、设计和部署补丁的能力。借助 Mythos Preview，首先发现漏洞的过程已变得大为简便。我们创建了一个[开源漏洞仪表盘](https://red.anthropic.com/2026/cvd/)（见下文），展示我们披露流程的各个步骤并跟踪进展情况。该仪表盘展示所有严重性级别的漏洞，而非仅限于 Mythos Preview 初始评估为高危或严重级别的子集。请注意每个阶段的陡峭下降，这反映了验证和修复每个漏洞所需的人工投入量。

![Image 1](https://www.anthropic.com/_next/image?url=https%3A%2F%2Fwww-cdn.anthropic.com%2Fimages%2F4zrzovbb%2Fwebsite%2F7af1880d305b982764cfefc7dce87c677f1b0254-1634x1008.png&w=3840&q=75)

Our dashboard of open-source vulnerabilities, showing vulnerabilities of all severities (rather than only those estimated high- or critical-severity by Mythos Preview).

Our process for triaging vulnerabilities is intensive. First, we or one of the external security firms we work with reproduce the issue that Mythos has found and re-assess its severity. Once we've confirmed that a vulnerability is real, we check for whether there are already fixes in place, and write a detailed report to the software's maintainers. We take considerable care here: on top of the regular challenges of maintaining open-source software, maintainers have been facing a deluge of low-quality, AI-generated bug reports. Indeed, several maintainers have told us they're currently severely capacity constrained, and some have even asked us to slow down our rate of our disclosures because they need more time to design patches. (On average, a high- or critical-severity bug found by Mythos Preview takes two weeks to patch.)

我们的漏洞分诊流程相当密集。首先，我们或合作的外部安全公司之一会复现 Mythos 所发现的问题并重新评估其严重性。一旦确认漏洞属实，我们将检查是否已有修复措施，并向软件维护者撰写详细报告。我们在这一环节格外审慎：除了开源软件维护的常规挑战之外，维护者还面临着大量低质量 AI 生成漏洞报告的冲击。事实上，多位维护者告知我们，他们目前产能严重受限，部分维护者甚至要求我们放慢披露速度，因为他们需要更多时间设计补丁。（平均而言，Mythos Preview 发现的高危或严重漏洞需要两周时间才能完成修补。）

On maintainers' request, we sometimes disclose bugs directly, without further assessment. We've now reported 1,129 such unvetted bugs, of which Mythos Preview estimated that 175 were high- or critical-severity.

应维护者要求，我们有时会直接披露漏洞，不再进行进一步评估。我们已报告了 1,129 个此类未经审核的漏洞，其中 Mythos Preview 估计有 175 个为高危或严重级别。

We estimate that we've disclosed 530 high- or critical-severity bugs to maintainers so far. This is based on Claude's assessment of severity in the case of direct disclosures, and maintainers' or our security partners' assessment where available. There are a further 827 confirmed vulnerabilities (estimated as high- or critical-severity in the same manner) that we're aiming to disclose as quickly as possible.

我们估计迄今已向维护者披露了 530 个高危或严重级别漏洞。这一数据基于直接披露情况下 Claude 的严重性评估，以及维护者或安全合作伙伴在可获得情况下的评估。另有 827 个已确认漏洞（以同样方式估计为高危或严重级别）有待我们尽快披露。

75 of the 530 high- or critical-severity bugs we've reported have now been patched, and 65 of those have been given public advisories. The number of patches is still relatively low for three reasons. First, we're still early in the 90-day window that's set out in our Coordinated Vulnerability Disclosure policy: we expect many more patches to land soon. Second, we are likely to be undercounting patches because some vulnerabilities are patched without a public advisory: in those cases, we're reliant on scanning for the patches ourselves using Claude. Third, the low volume of patches reflects a genuine problem: even at our relatively slow pace of disclosures, Mythos Preview is adding to an already-overloaded security ecosystem.

我们已报告的 530 个高危或严重级别漏洞中，75 个已完成修补，其中 65 个已发布公开安全公告。补丁数量仍相对偏少，原因有三。其一，我们仍处于协调漏洞披露政策规定的 90 天窗口期早期：预计很快将有更多补丁落地。其二，我们可能低估了补丁数量，因为部分漏洞在无公开安全公告的情况下被修补：在这些情形下，我们只能依赖 Claude 自行扫描补丁。其三，补丁数量偏少反映了一个真实问题：即便以我们相对较慢的披露速度，Mythos Preview 也在已经超负荷的安全生态系统上增加了更大压力。

The relative ease of finding vulnerabilities compared with the difficulty of fixing them amounts to a major challenge for cybersecurity. Confronting this challenge successfully will make our software far safer than before. Below we discuss some ways that cyber defenders can adapt.

发现漏洞的相对便利与修复漏洞的困难之间的落差，构成了网络安全领域的重大挑战。成功应对这一挑战，将使我们的软件比以前安全得多。下文我们将探讨网络防御者可以采取的一些应对措施。

## Adapting to a new phase of cybersecurity
> 适应网络安全新阶段

Models with similar cybersecurity skills to Mythos Preview will soon be more broadly available. There is a clear need for a larger effort across the software industry to manage the volume of findings that these models will generate.

具有与 Mythos Preview 类似网络安全能力的模型很快将更广泛地可用。整个软件行业显然需要付出更大的努力，以管理这些模型将产生的大量发现。

Currently, there's often a long lag between the discovery of a vulnerability, the creation of a patch for it, and the time when the patch is widely deployed by end users. This leaves open a significant window for attackers to exploit critical software. Mythos-class models significantly shrink the time and cost required to find and exploit vulnerabilities, magnifying the risk associated with these time lags. Ultimately, Mythos-class models will enable developers to build far more secure software by catching bugs before they are deployed. But this interim period—while vulnerabilities are being rapidly discovered and slowly patched—presents new risks.

目前，从漏洞被发现、创建补丁，到补丁被终端用户广泛部署，往往存在漫长的滞后期。这为攻击者利用关键软件中的漏洞留下了相当大的时间窗口。Mythos 级别的模型大幅缩短了发现和利用漏洞所需的时间与成本，放大了与这些时间滞后相关的风险。从长远来看，Mythos 级别的模型将使开发者能够在代码部署前捕获漏洞，从而构建更为安全的软件。但这一过渡期——漏洞被快速发现却缓慢修补——带来了新的风险。

Software developers and users should act now to reduce their exposure to these risks. The advice below is not new, and many researchers (including at Anthropic) are currently working on better and more durable solutions. In the meantime, it's important to get the basics right:

软件开发者和用户应当立即采取行动，以降低面对这些风险的暴露程度。以下建议并非新颖，目前已有许多研究者（包括 Anthropic 的研究者）正在致力于开发更好、更持久的解决方案。在此期间，做好基本功至关重要：

*   **Software developers** should shorten their patch cycles and make security fixes available as quickly as possible. The thoughtful use of publicly available AI models can help here; we're building tools and sharing our research to support this (more details below). Developers should also help their users stay up-to-date with their software by making it as easy as possible to install updates; to the extent feasible, they should be more persistent with users who are still running software with known vulnerabilities.｜**软件开发者**应缩短补丁周期，尽快提供安全修复。合理使用公开可用的 AI 模型在这方面大有裨益；我们正在构建工具并分享研究成果来支持这一工作（详见下文）。开发者还应通过尽可能简化更新安装流程，帮助用户保持软件更新；在可行的情况下，应更积极地督促仍在使用已知存在漏洞软件的用户完成更新。
*   **Network defenders** should shorten their patch testing and deployment timelines. The critical controls laid out by organizations like the [National Institute of Standards and Technology](https://www.nist.gov/cyberframework) and the UK's [National Cyber Security Centre](https://www.ncsc.gov.uk/collection/10-steps/risk-management) are now all the more important, since they improve security without depending on any single patch landing in time. These include steps like hardening networks' default configurations, enforcing multi-factor authentication, and keeping comprehensive logs for detection and response.｜**网络防御者**应缩短补丁测试和部署的时间线。[美国国家标准与技术研究院](https://www.nist.gov/cyberframework)和英国[国家网络安全中心](https://www.ncsc.gov.uk/collection/10-steps/risk-management)等机构制定的关键控制措施现在比以往更加重要，因为这些措施在不依赖任何单一补丁及时落地的情况下就能提升安全性。这些措施包括：加固网络默认配置、强制实施多因素身份验证，以及保留完整的日志记录以供检测和响应使用。

### Tools for cyberdefense with publicly available AI models
> 使用公开可用 AI 模型进行网络防御的工具

Many generally-available models can already find large numbers of software vulnerabilities, even if they can't find the most sophisticated vulnerabilities or exploit them as effectively as Claude Mythos Preview. Project Glasswing has already spurred many other organizations to take action on their own codebases with these generally-available models; we're working to make this much easier to do.

许多普遍可用的模型已经能够发现大量软件漏洞，即使它们尚不能发现最为复杂的漏洞或像 Claude Mythos Preview 那样有效地加以利用。Glasswing 项目已促使许多其他组织利用这些普遍可用模型对自身代码库采取行动；我们正致力于使这一工作变得更加简便。

To begin, we've released [Claude Security](https://claude.com/product/claude-security) in public beta for Claude Enterprise customers. It's a tool that helps teams scan their codebases for vulnerabilities, and which can generate proposed fixes for them. In the three weeks since launch, Claude Opus 4.7 has been used to patch over 2,100 vulnerabilities. (This is faster than the open-source patching described above in large part because enterprises are fixing their own code, whereas open-source fixes usually require volunteer maintainers who work through coordinated disclosure.)

首先，我们已面向 Claude Enterprise 客户发布了 [Claude Security](https://claude.com/product/claude-security) 公测版。这是一个帮助团队扫描代码库漏洞并生成建议修复方案的工具。自发布后三周内，Claude Opus 4.7 已被用于修补逾 2,100 个漏洞。（这比上述开源修补的速度更快，很大程度上是因为企业在修复自身代码，而开源修复通常需要通过协调披露流程的志愿维护者来完成。）

We've also begun our [Cyber Verification Program](https://support.claude.com/en/articles/14604842-real-time-cyber-safeguards-on-claude), which allows security professionals using our models for legitimate cybersecurity purposes (such as vulnerability research, penetration testing, and red-teaming) to do so without certain safeguards designed to prevent cyber misuse.

我们还启动了[网络验证计划](https://support.claude.com/en/articles/14604842-real-time-cyber-safeguards-on-claude)，允许将我们模型用于合法网络安全目的（如漏洞研究、渗透测试和红队演练）的安全专业人员，在不受部分旨在防范网络滥用的安全机制限制的情况下开展工作。

Now, we're making the tools that we and our partners have used with Mythos Preview available to qualifying customers' security teams on request. Our aim is to make it much easier to get the best performance out of highly capable public models without extensive setup. This release includes:

现在，我们将我们和合作伙伴与 Mythos Preview 配合使用的工具，按需提供给符合条件的客户安全团队。我们的目标是使无需大量配置就能从高能力公开模型中获得最佳性能变得更加简便。此次发布包含：

*   The [skills](https://code.claude.com/docs/en/skills) (custom instructions for repeated work) that we and our partners have built and shared;｜我们和合作伙伴构建和共享的[技能](https://code.claude.com/docs/en/skills)（用于重复性工作的自定义指令）；
*   A harness that helps Claude map the codebase, spin up scanning subagents, triage its findings, and write reports;｜一个帮助 Claude 映射代码库、启动扫描子代理、分诊发现结果并撰写报告的工具框架；
*   A threat model builder, which maps a codebase to identify potential targets for attack and prioritizes the model's work accordingly.｜一个威胁模型构建器，用于映射代码库以识别潜在攻击目标，并据此确定模型工作的优先级。

Cisco, one of our Project Glasswing partners, has also recently open-sourced its [Foundry Security Spec](https://blogs.cisco.com/ai/announcing-foundry-security-spec) to help other defenders build an evaluation system similar to the one they use themselves.

我们的 Glasswing 项目合作伙伴之一 Cisco 近期也开源了其 [Foundry Security Spec](https://blogs.cisco.com/ai/announcing-foundry-security-spec)，以帮助其他防御者构建与其自身使用相似的评估系统。

## Supporting the ecosystem
> 支持整个生态系统

We've formed a [partnership](https://openssf.org/press-release/2026/03/17/linux-foundation-announces-12-5-million-in-grant-funding-from-leading-organizations-to-advance-open-source-security/) with the Open Source Security Foundation's Alpha-Omega project, which will support the foundation's efforts to assist maintainers in processing and triaging bug reports. We're also continuing to publish research into how frontier model capabilities can best support cyberdefenders.

我们与开源安全基金会的 Alpha-Omega 项目建立了[合作关系](https://openssf.org/press-release/2026/03/17/linux-foundation-announces-12-5-million-in-grant-funding-from-leading-organizations-to-advance-open-source-security/)，以支持该基金会协助维护者处理和分诊漏洞报告的工作。我们也将持续发布关于前沿模型能力如何最有效支持网络防御者的研究成果。

We've also supported the development of [ExploitBench](http://exploitbench.ai/) and [ExploitGym](https://rdi.berkeley.edu/blog/exploitgym/), the two new benchmarks that allow researchers to track frontier AI models' exploit development capabilities over time, as we discuss [here](https://red.anthropic.com/2026/exploit-evals/). We're supporting the development of other high-quality quantitative benchmarks through our [External Researcher Access Program](https://support.claude.com/en/articles/9125743-what-is-the-external-researcher-access-program). Finally, [Claude for Open Source](https://claude.com/contact-sales/claude-for-oss) supports maintainers and contributors, and we're committing to scan any open-source package that we adopt ourselves in the future.

我们还支持了 [ExploitBench](http://exploitbench.ai/) 和 [ExploitGym](https://rdi.berkeley.edu/blog/exploitgym/) 的开发——这两个新基准能够让研究者随时间追踪前沿 AI 模型的漏洞利用开发能力，相关讨论详见[此处](https://red.anthropic.com/2026/exploit-evals/)。我们通过[外部研究者访问计划](https://support.claude.com/en/articles/9125743-what-is-the-external-researcher-access-program)支持其他高质量定量基准的开发。最后，[Claude for Open Source](https://claude.com/contact-sales/claude-for-oss) 为维护者和贡献者提供支持，我们也承诺对未来自身采用的任何开源包进行扫描。

## What's next for Project Glasswing
> Glasswing 项目的下一步

The speed of AI progress means that models as capable as Mythos Preview will soon be developed by many different AI companies. At present, no company—including Anthropic—has developed safeguards strong enough to prevent such models from being misused and potentially causing severe harm. That is why we have yet to release Mythos-class models to the public. But it's also why we began Project Glasswing: if a similarly capable model is released _without_ such safeguards, it will soon become dramatically cheaper and easier for almost anyone in the world to exploit flawed software.

AI 进步的速度意味着，能力与 Mythos Preview 相当的模型很快将由众多 AI 公司开发出来。目前，没有任何公司——包括 Anthropic——已开发出足够强大的防护措施来防止此类模型被滥用并造成严重危害。这正是我们尚未将 Mythos 级别模型向公众发布的原因。但这也是我们启动 Glasswing 项目的原因：如果一个能力相当的模型在_没有_此类防护措施的情况下发布，世界上几乎任何人利用存在缺陷的软件都将很快变得成本大幅降低、难度显著下降。

Glasswing helps the most systemically important cyber defenders gain an asymmetric advantage. However, there is an urgent need for as many organizations as possible to shore up their cyber defenses. We hope that our generally available models, and the new tools, resources, and research we're providing to accompany them, will support those organizations to improve their cybersecurity posture.

Glasswing 帮助最具系统重要性的网络防御者获得不对称优势。然而，当务之急是让尽可能多的组织加强其网络防御。我们希望我们的普遍可用模型，以及我们提供的新工具、资源和研究成果，能够支持这些组织改善其网络安全态势。

Next, we will work with critical partners—including US and allied governments—to expand Project Glasswing to additional partners. And in the near future, once we've developed the far stronger safeguards we need, we look forward to making Mythos-class models available through a general release.

接下来，我们将与包括美国及盟国政府在内的关键伙伴合作，将 Glasswing 项目扩展到更多合作伙伴。在不久的将来，一旦我们开发出所需的更为强大的防护措施，我们期待通过公开发布的方式提供 Mythos 级别的模型。

On the far side of these risks, there's an encouraging world available to us: one in which important code is hardened far better than it is today, and in which hacking is far less prevalent. There are many obstacles, but we're nonetheless confident that Project Glasswing can help get us there.

越过这些风险，摆在我们面前的是一个令人振奋的世界：重要代码将得到远比今天更为坚实的防护，黑客攻击将变得远不那么普遍。前路障碍重重，但我们仍然坚信，Glasswing 项目能够助我们抵达彼处。
