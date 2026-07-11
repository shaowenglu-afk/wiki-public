Title: LLM-discovered 0 days

URL Source: https://www.anthropic.com/research/zero-days

Markdown Content:
_Nicholas Carlini*, Keane Lucas*, Evyatar Ben Asher*, Newton Cheng, Hasnain Lakhani, David Forsythe, and Kyla Guru

*indicates equal contribution_

Claude Opus 4.6, [released today](http://anthropic.com/news/claude-opus-4-6), continues a [trajectory of meaningful improvements](https://www.anthropic.com/claude-opus-4-6-system-card) in AI models' cybersecurity capabilities. Last fall, we wrote that we believed we were at an [inflection point for AI's impact on cybersecurity](https://red.anthropic.com/2025/ai-for-cyber-defenders/)—that progress could become quite fast, and now was the moment to accelerate defensive use of AI. The evidence since then has only reinforced that view. AI models can now find high-severity vulnerabilities at scale. Our view is this is a moment to move quickly—to empower defenders and secure as much code as possible while the window exists.
今日[发布](http://anthropic.com/news/claude-opus-4-6)的 Claude Opus 4.6，延续了 AI 模型在网络安全能力方面的[持续提升轨迹](https://www.anthropic.com/claude-opus-4-6-system-card)。去年秋天，我们曾写道，我们认为 AI 对网络安全的影响正处于一个[拐点](https://red.anthropic.com/2025/ai-for-cyber-defenders/)——进展可能会非常迅速，现在正是加速 AI 防御性应用的时机。此后的证据只会强化这一判断。AI 模型现在已能大规模发现高危漏洞。我们认为，这是快速行动的时刻——在机会窗口仍然存在的时候，赋能防御者并尽可能多地保护代码安全。

Opus 4.6 is notably better at finding high-severity vulnerabilities than previous models and a sign of how quickly things are moving. Security teams have been automating vulnerability discovery for years, investing heavily in fuzzing infrastructure and custom harnesses to find bugs at scale. But what stood out in early testing is how quickly Opus 4.6 found vulnerabilities out of the box without task-specific tooling, custom scaffolding, or specialized prompting. Even more interesting is _how_ it found them. Fuzzers work by throwing massive amounts of random inputs at code to see what breaks. Opus 4.6 reads and reasons about code the way a human researcher would—looking at past fixes to find similar bugs that weren't addressed, spotting patterns that tend to cause problems, or understanding a piece of logic well enough to know exactly what input would break it. When we pointed Opus 4.6 at some of the most well-tested codebases (projects that have had fuzzers running against them for years, [accumulating millions of hours of CPU time](https://google.github.io/oss-fuzz/research/llms/target_generation/)), Opus 4.6 found high-severity vulnerabilities, some that had gone undetected for decades.
Opus 4.6 在发现高危漏洞方面明显优于此前的模型，这也是事态发展之迅速的一个缩影。安全团队多年来一直在自动化漏洞发现领域深耕，大力投资模糊测试（fuzzing）基础设施和定制化工具链，以大规模发现漏洞。但早期测试中最突出的是：Opus 4.6 无需专用工具、自定义脚手架或特殊提示词，开箱即用地迅速发现了漏洞。更有意思的是它_如何_发现漏洞的。传统模糊测试工具通过向代码抛出海量随机输入来寻找崩溃点，而 Opus 4.6 则像人类研究员一样阅读和推理代码——审查历史修复记录以寻找类似的未修补漏洞、识别易引发问题的代码模式、或充分理解某段逻辑以精确判断什么输入会触发崩溃。当我们将 Opus 4.6 指向一些经过最充分测试的代码库（这些项目已被模糊测试工具运行多年，[累计消耗数百万 CPU 小时](https://google.github.io/oss-fuzz/research/llms/target_generation/)），Opus 4.6 发现了高危漏洞，其中一些已潜伏数十年未被发现。

Part of tipping the scales toward defenders means doing the work ourselves. We're now using Claude to find and help fix vulnerabilities in open source software. We've started with open source because it runs everywhere—from enterprise systems to critical infrastructure—and vulnerabilities there ripple across the internet. Many of these projects are maintained by small teams or volunteers who don't have dedicated security resources, so finding human-validated bugs and contributing human-reviewed patches goes a long way.
帮助天平向防御者倾斜，意味着我们自己也要参与这项工作。我们现在正在使用 Claude 发现并协助修复开源软件中的漏洞。我们从开源软件入手，是因为它无处不在——从企业系统到关键基础设施——其中的漏洞会在整个互联网上产生连锁反应。这些项目中许多由小型团队或志愿者维护，缺乏专职安全资源，因此发现经人工验证的漏洞并提交人工审核的补丁将大有裨益。

So far, we've found and validated more than 500 high-severity vulnerabilities. We've begun reporting them and are seeing our initial patches land, and we're continuing to work with maintainers to patch the others. In this post, we'll walk through our methodology, share some early examples of vulnerabilities Claude discovered, and discuss the safeguards we've put in place to manage misuse as these capabilities continue to improve. This is just the beginning of our efforts. We'll have more to share as this work scales.
迄今为止，我们已发现并验证了超过 500 个高危漏洞。我们已开始上报，并看到初步补丁陆续被采纳，同时我们正继续与维护者协作修复其余漏洞。在这篇文章中，我们将梳理方法论，分享 Claude 发现漏洞的早期案例，并讨论我们为在能力持续提升的同时管控滥用风险而建立的安全措施。这只是我们工作的开始，随着这项工作的规模扩大，我们将有更多成果可以分享。

## Setup
> 设置

In this work, we put Claude inside a "virtual machine" (literally, a simulated computer) with access to the latest versions of open source projects. We gave it standard utilities (e.g., the standard coreutils or Python) and vulnerability analysis tools (e.g., debuggers or fuzzers), but we didn't provide any special instructions on how to use these tools, nor did we provide a custom harness that would have given it specialized knowledge about how to better find vulnerabilities. This means we were directly testing Claude's "out-of-the-box" capabilities, relying solely on the fact that modern large language models are generally-capable agents that can already reason about how to best make use of the tools available.
在这项工作中，我们将 Claude 置于一台"虚拟机"（即模拟计算机）中，使其能够访问最新版本的开源项目。我们为其提供了标准工具（如标准 coreutils 或 Python）和漏洞分析工具（如调试器或模糊测试工具），但没有提供任何关于如何使用这些工具的特殊指令，也没有提供会赋予其关于如何更好地发现漏洞之专业知识的自定义工具链。这意味着我们在直接测试 Claude 的"开箱即用"能力，完全依赖现代大语言模型作为通用智能体、已能推断如何最优利用可用工具这一事实。

To ensure that Claude hadn't hallucinated bugs (i.e., invented problems that don't exist, a problem that increasingly is placing an undue burden on open source developers), we validated every bug extensively before reporting it.We focused on searching for memory corruption vulnerabilities, because they can be validated with relative ease. Unlike logic errors where the program remains functional, memory corruption vulnerabilities are easy to identify by monitoring the program for crashes and running tools like address sanitizers to catch non-crashing memory errors. But because not all inputs that cause a program to crash are high severity vulnerabilities, we then had Claude critique, de-duplicate, and re-prioritize the crashes that remain. Finally, for our initial round of findings, our own security researchers validated each vulnerability and wrote patches by hand. As the volume of findings grew, we brought in external (human) security researchers to help with validation and patch development. Our intent here was to meaningfully assist human maintainers in handling our reports, so the process optimized for reducing false positives. In parallel, we are accelerating our efforts to automate patch development to reliably remediate bugs as we find them.
为确保 Claude 没有产生幻觉漏洞（即编造不存在的问题——这一问题正日益给开源开发者带来不必要的负担），我们在上报前对每个漏洞进行了广泛验证。我们专注于寻找内存损坏漏洞，因为它们相对容易验证。与程序仍可运行的逻辑错误不同，内存损坏漏洞可通过监控程序崩溃情况以及运行地址消毒器等工具捕获不崩溃的内存错误来识别。但由于并非所有导致程序崩溃的输入都是高危漏洞，我们随后让 Claude 对剩余崩溃进行批评、去重和重新优先排序。最后，对于初轮发现结果，我们自己的安全研究员对每个漏洞进行了验证并手工编写了补丁。随着发现量增加，我们引入了外部（人工）安全研究员协助验证和补丁开发。我们的目标是切实帮助人类维护者处理我们的报告，因此整个流程针对减少误报进行了优化。与此同时，我们正在加速自动化补丁开发工作，以便在发现漏洞时可靠地进行修复。

## Vulnerabilities
> 漏洞案例

Here are three of the vulnerabilities Claude found (now patched by maintainers), which we believe demonstrate the unique advantages LLMs have over other tools.
以下是 Claude 发现的三个漏洞（现已由维护者修复），我们认为它们展示了 LLM 相较于其他工具的独特优势。

**GhostScript**is a utility that processes PostScript and PDF files. Claude initially went down several dead ends when searching for a vulnerability—both attempting to fuzz the code, and, after this failed, attempting manual analysis. Neither of these methods yielded any significant findings. Eventually, however, Claude took a different approach:reading the Git commit history. Claude quickly found a security-relevant commit, and commented:
**GhostScript** 是一个处理 PostScript 和 PDF 文件的工具。Claude 在搜索漏洞时最初走了几条死路——先是尝试对代码进行模糊测试，失败后又尝试手动分析，这两种方法均未发现显著问题。然而最终，Claude 采取了不同的方法：阅读 Git 提交历史。Claude 很快发现了一条与安全相关的提交，并评论道：

`There's a commit about "stack bounds checking for MM blend values" in Type 1 charstrings. This is related to font handling. Let me get more details about this commit.`

From here, Claude looked at the code to understand what had changed:
从这里出发，Claude 查看了代码以了解发生了什么变化：

`The commit shows it's adding stack bounds checking - this suggests there was a vulnerability before this check was added. … If this commit *adds* bounds checking, then the code before this commit was vulnerable … So to trigger the vulnerability, I would need to test against a version of the code *before* this fix was applied.`

With this in mind, Claude then looked for other places where this function was called in order to find potentially similar vulnerabilities that were left unpatched.
带着这一思路，Claude 随即寻找该函数被调用的其他位置，以发现可能遗留的类似未修复漏洞。

`Let me check if maybe the checks are incomplete or there's another code path. Let me look at the other caller in gdevpsfx.c … Aha! This is very interesting! In gdevpsfx.c, the call to gs_type1_blend at line 292 does NOT have the bounds checking that was added in gstype1.c.`

After making this observation, Claude quickly constructed a proof-of-concept crash(a file that can be passed to GhostScript that will cause it to crash), proving its predictions.
做出这一观察后，Claude 迅速构建了一个概念验证崩溃（一个可传递给 GhostScript 并使其崩溃的文件），从而验证了自己的预测。

**OpenSC**is a command line utility to process smart card data. Again, Claude initially attempted to find vulnerabilities by fuzzing the code, and after this failed, by manual analysis. As before, when this didn't work, Claude took a different approach: it began to search the repository for function calls that are frequently vulnerable.
**OpenSC** 是一个处理智能卡数据的命令行工具。同样，Claude 最初尝试通过模糊测试发现漏洞，失败后又尝试手动分析。与之前一样，当这些方法不奏效时，Claude 采取了不同的方法：开始在代码库中搜索频繁出现漏洞的函数调用。

`Let me look at where the URL is used - specifically the strrchr and strcat operations which could potentially have path traversal or buffer overflow issues.`

Claude quickly identified a location where multiple `strcat` operations were used in succession. These functions are typically viewed as unsafe in C because they allow for concatenating strings without any check on the length of the resulting concatenated string. It is therefore extremely important that the programmer verify the output buffer is long enough to contain the concatenated input. For OpenSC, the key issue was in the following code:
Claude 迅速识别出一处连续使用多个 `strcat` 操作的位置。这些函数在 C 语言中通常被视为不安全，因为它们允许在不检查结果字符串长度的情况下拼接字符串。因此，程序员验证输出缓冲区足够长以容纳拼接后的输入至关重要。对于 OpenSC，关键问题在于以下代码：

```
char filename[PATH_MAX];  // this buffer is 4096 bytes
r = sc_get_cache_dir(card->ctx, filename,
        sizeof(filename) - strlen(fp) - 2);
if (r != SC_SUCCESS)
        goto err;
strcat(filename,"/");
strcat(filename,fp);
```

Claude identified that this is vulnerable to a buffer overflow. And when we look at the statistics for how frequently this line of code was fuzzed by existing fuzzers, we see that this line of code is infrequently studied by traditional fuzzers because of how many preconditions are required. Claude, in contrast, was able to reason about which code fragments were interesting and focus its effort there, instead of indiscriminately studying all lines with equal effort.
Claude 识别出这段代码存在缓冲区溢出漏洞。而当我们查看现有模糊测试工具测试这段代码的频率统计时，可以看到传统模糊测试工具很少研究这行代码，因为触发它需要满足太多前提条件。相比之下，Claude 能够推断哪些代码片段值得关注并将精力集中于此，而非无差别地以相同力度研究所有代码行。

**CGIF**is a library for processing GIF files. In this case, we were surprised not by how Claude _found_ the bug, but by how it _validated_ the bug and produced a proof-of-concept that proved the vulnerability was real.
**CGIF** 是一个处理 GIF 文件的库。在这个案例中，令我们惊讶的不是 Claude 如何_发现_漏洞，而是它如何_验证_漏洞并制作出证明漏洞真实存在的概念验证。

Briefly, Claude found that this library assumes compressed data will always be smaller than its original size (which is normally a safe assumption), and that this assumption could be exploited. The way it did this was challenging. The GIF file format compresses data with the LZW compression algorithm. Unlike the more traditional LZ77-backed compressors that encode matches with a (distance, length) pair, LZW builds a dictionary of frequently-used pairs of tokens (either individual characters, or pairs of tokens). Then, when the compressor encounters this token a second time, it can output a shorter bitstring indicating "output this token again".(For those familiar with language modeling, LZW is very similar in spirit to the process of BPE tokenization.)
简言之，Claude 发现这个库假设压缩数据始终小于其原始大小（这通常是一个安全的假设），而这一假设可被利用。实现这一点的方式颇具挑战性。GIF 文件格式使用 LZW 压缩算法压缩数据。与使用（距离，长度）对编码匹配的传统 LZ77 类压缩器不同，LZW 构建了一个频繁使用的词元对字典（可以是单个字符或词元对）。然后，当压缩器第二次遇到这个词元时，它可以输出一个较短的比特串，表示"再次输出这个词元"。（对于熟悉语言模型的人来说，LZW 在精神上与 BPE 词元化过程非常相似。）

CGIF had implicitly assumed that the compressed size of a compressed string would always be less than the uncompressed size—something that is almost always true. However, Claude immediately recognized the vulnerability here:
CGIF 隐式地假设压缩字符串的压缩大小始终小于未压缩大小——这在几乎所有情况下都是正确的。然而，Claude 立即识别出了这里的漏洞：

```
To trigger overflow, we need:

• Small numPixel (small image)
• Many LZW codes written

The pattern that generates most LZW codes is one where:

• No compression happens (each pixel becomes a code)
• Many resets occur

With a palette of 4 colors (indices 0-3):

• initDictLen = 4
• Dictionary fills up after MAX_DICT_LEN (4096) entries
• Reset happens when dict reaches 4096

To trigger overflow with small image:

• numPixel = N
• Buffer size = (N + 2) codes
• We need to generate > N + 1 codes

Each pixel can generate 1 code + resets.

But the pattern that might cause more codes is when we have sequences of length 1.
```

That is, Claude recognized that LZW maintains a fixed-size symbol table; if it was possible to max out the size of the symbol table, then LZW inserts a new special "clear" token in the data-stream. This then results in the output "compressed" size exceeding the uncompressed size—triggering a buffer overflow vulnerability.
也就是说，Claude 认识到 LZW 维护一个固定大小的符号表；如果符号表被填满，LZW 就会在数据流中插入一个新的特殊"清除"词元。这会导致输出的"压缩"大小超过未压缩大小——从而触发缓冲区溢出漏洞。

This vulnerability is particularly interesting because triggering it requires a conceptual understanding of the LZW algorithm and how it relates to the GIF file format. Traditional fuzzers (and even coverage-guided fuzzers) struggle to trigger vulnerabilities of this nature because they require making a particular choice of branches. In fact, even if CGIF had 100% line- and branch-coverage, this vulnerability could still remain undetected: it requires a very specific sequence of operations.
这个漏洞尤其有趣，因为触发它需要对 LZW 算法及其与 GIF 文件格式的关联有概念层面的理解。传统模糊测试工具（甚至覆盖率引导的模糊测试工具）难以触发此类漏洞，因为它们需要对特定分支做出特定选择。事实上，即使 CGIF 达到了 100% 的行覆盖率和分支覆盖率，这个漏洞仍可能未被发现：它需要一个非常特定的操作序列。

## Safeguards
> 安全措施

Alongside the release of Claude Opus 4.6, we're introducing a new layer of detection to support our Safeguards team in [identifying and responding](https://www.anthropic.com/news/detecting-countering-misuse-aug-2025)to cyber misuse of Claude. At the core of this work are [probes](https://alignment.anthropic.com/2025/cheap-monitors/), which measure activations within the model as it generates a response and allow us to detect specific harms at scale. With this launch, we've created new cyber-specific probes to better track and understand the potential misuse of Claude in the cybersecurity domain.
与 Claude Opus 4.6 同步发布，我们引入了新的检测层，以支持我们的安全团队[识别和响应](https://www.anthropic.com/news/detecting-countering-misuse-aug-2025) Claude 遭受的网络滥用。这项工作的核心是[探针](https://alignment.anthropic.com/2025/cheap-monitors/)，它在模型生成回应时测量模型内部的激活状态，使我们能够大规模检测特定危害。随着本次发布，我们创建了新的网络安全专用探针，以更好地追踪和了解 Claude 在网络安全领域遭受滥用的潜在情况。

On the enforcement side, we're evolving our pipelines to keep pace with this new detection architecture. That includes updating our cyber enforcement workflows to take advantage of probe-based detection, as well as expanding the range of actions we take to respond to cyber misuse. In particular, we may institute real-time intervention, including blocking traffic we detect as malicious. This will create friction for legitimate research and some defensive work, and we want to work with the security research community to find ways to address it as it arises.We are committed to keeping Claude at the forefront of cybersecurity by working hard to make it both safe and effective.
在执法层面，我们正在升级流程以跟上新的检测架构。这包括更新我们的网络安全执法工作流程以利用基于探针的检测，以及扩大我们应对网络滥用的行动范围。特别地，我们可能会实施实时干预，包括阻断我们检测为恶意的流量。这将给合法研究和部分防御性工作带来一定摩擦，我们希望与安全研究社区合作，在问题出现时找到解决方式。我们致力于通过努力使 Claude 既安全又有效，使其始终处于网络安全领域的前沿。

Together, these changes represent a meaningful step forward in our ability to prevent misuse: not just in what we can detect, but in how quickly and effectively we can act on what we find.
总体而言，这些变化代表着我们防范滥用能力的实质性进步：不仅体现在我们能够检测到什么，更体现在我们对发现结果采取行动的速度和效果上。

## Conclusion
> 结论

Claude Opus 4.6 can find meaningful 0-day vulnerabilities in well-tested codebases, even without specialized scaffolding. Our results show that language models can add real value on top of existing discovery tools. The Safeguards work we describe above is essential to managing the dual-use risk this creates.
Claude Opus 4.6 即便在没有专用脚手架的情况下，也能在经过充分测试的代码库中发现具有实质意义的零日漏洞（0-day）。我们的结果表明，语言模型能够在现有发现工具的基础上增添真实价值。我们上面描述的安全措施工作，对于管控由此产生的两用风险（dual-use risk）至关重要。

Looking ahead, both we and the broader security community will need to grapple with an uncomfortable reality: language models are already capable of identifying novel vulnerabilities, and may soon exceed the speed and scale of even expert human researchers.
展望未来，我们和更广泛的安全社区都需要正视一个令人不安的现实：语言模型已经能够识别新型漏洞，并且可能很快在速度和规模上超越顶尖的人类安全研究员。

At the same time, existing disclosure norms will need to evolve. Industry-standard 90-day windows may not hold up against the speed and volume of LLM-discovered bugs, and the industry will need workflows that can keep pace.
与此同时，现有的漏洞披露规范也需要演进。行业标准的 90 天披露窗口可能无法跟上 LLM 发现漏洞的速度和数量，整个行业需要能够跟上节奏的工作流程。

This is ongoing work, and we'll have more to share soon—including what we're learning about how these capabilities evolve and how the security community can best put them to use.
这是一项持续进行中的工作，我们很快将有更多内容可以分享——包括我们对这些能力如何演进以及安全社区如何最好地加以利用的认识。

_Edited February 6, 2026:_

*   _Updated the author list_
