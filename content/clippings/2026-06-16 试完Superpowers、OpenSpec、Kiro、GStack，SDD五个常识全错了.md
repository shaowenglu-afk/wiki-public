---
title: "试完Superpowers、OpenSpec、Kiro、GStack，SDD五个常识全错了"
source: "https://mp.weixin.qq.com/s/tFwrafr7pLIXz2hy9UOi-Q"
author:
  - "[[Dolphin7]]"
published:
created: 2026-06-16
description: "试完 Superpowers、OpenSpec、Kiro、GStack，我发现 SDD 选型最深的坑不是选错工具——是信了五条流行常识：Spec 是 Truth、流程越严越稳、工具能缝出闭环。"
tags:
  - "clippings"
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。

Dolphin7 *2026年6月16日 19:30*

半年踩完坑，我发现 SDD 圈子里有五条「常识」，全是错的：

1. 1\. **Spec 是 Truth** —— Spec 连编译器都没有，凭什么叫 Truth？
2. 2\. **No Spec, No Code** —— 这是瀑布思维的复辟，人写 Spec 是上一代的做法
3. 3\. **Spec 越精确效果越好** —— 精确度和代码质量是倒 U 曲线，过了拐点是负收益
4. 4\. **Spec 必须完整、同步、归档沉淀** —— 和代码重叠的部分没有沉淀价值，维护成本远大于收益
5. 5\. **工具强强联合，流程越严格越好** —— 哲学不自洽的东西缝不出自洽，模型在变强流程应该变轻

带着这五条认知去选工具，你一定选到最重的那个，然后效率不升反降。

---

## ❶ Spec 是 Truth？——Spec 连编译器都没有

SDD 理论说：Spec 是真相源，代码是 Spec 的投影。先改 Spec 再改代码，活基线永远保持最新。

但工程上有个致命问题： **Spec 是一份没有编译器的源代码。** 没有 type check，没有 pass/fail，没有 CI 强制执行。代码和测试不一致，CI 会红；Spec 和代码不一致，没人报错——直到有人翻出 spec.md 说「当初不是这么定的」。

能当 Truth 的东西必须有 **裁判机制** 。测试有 runtime 当裁判，代码有编译器当裁判。Spec 的裁判是谁？是人读一遍然后说「好像对」。

**这不是 Truth，这是 opinion。**

---

## ❷ No Spec, No Code？——瀑布思维的复辟

SDD 的纪律要求：代码必须由 Spec 驱动生成，没有 Spec 就不写代码。

但「先写完整 Spec → 再生成代码」= 在不确定性最高的时候做最完整的承诺。 **这就是 waterfall 换了个马甲。**

**流向反了。** 「人写 Spec → AI 执行」把最贵的人力放在信息密度最低的环节——从零起草。正确流向是 **AI 出方案 → 人审关键决策 → AI 执行** 。「人写 Spec」是 2024 年模型弱时的产物，2026 年还坚持从零手写，是用最贵的资源做最便宜的事。

**大部分需求不需要预先 Spec。** 50% 的需求被过度 Spec。改配置项走完整流程 40 分钟，直接改 5 分钟。分级比纪律重要—— **硬要 No Spec No Code，是用流程感代替判断力。**

---

## ❸ Spec 越精确效果越好？——你在模型最强的地方加锁

直觉上，Spec 越详细、约束越多，AI 产出越可控。实际相反。 **精确度和代码质量是倒 U 曲线——过了拐点，每多写一行 Spec，产出质量反而下降。**

```
代码质量
  ▲
  │        ╭──╮
  │      ╭╯    ╰╮
  │    ╭╯        ╰╮
  │  ╭╯    最优区    ╰──── 过度约束区
  │╭╯
  ├╯
  │ 信息不足区
  └──────────────────────► Spec 精确度
       边界/不变量/AC    技术选型/实现路径/代码结构
       （该锁的）         （不该锁的）
```

**该锁的（What 层）：** 边界（不做什么）、不变量（扣费后不退款）、验收标准（余额不足返回 40003）。  
**不该锁的（How 层）：** 技术选型、实现路径、代码结构、数据结构设计。

How 层是模型最强的决策空间。你插一根桩子，模型会忠实执行一个次优方案，而且不会告诉你有更好的选择。

Spec 写死 `Redis SET NX, TTL 5s` ，AI 照做。只写「同一用户同一房间的请求必须串行」，模型会根据架构上下文自选方案——大概率比你指定的更合理。

**锁行为，不锁实现。More context, less control——给信息，不给指令。** 你越信任模型的决策能力，产出上限越高；你越用约束替代信任，产出越被压在你自己的认知天花板上。

造模型的人最清楚这一点。Anthropic 选了 CLAUDE.md + Plan Mode，OpenAI 选了 AGENTS.md + delegation。 **两家顶尖模型公司，都投了「轻」。** 如果模型需要重型 Spec 才能写好代码，他们会第一个做。他们没做。

---

## ❹ Spec 必须完整、同步、归档沉淀？——维护成本远大于价值

很多团队把 Spec 当长期资产经营：写完后和代码保持同步，归档后作为知识沉淀和审计凭据。

算一笔账就知道不划算。 **Spec 和代码重叠的部分没有沉淀价值——代码本身就是最好的文档。代码外的知识有价值，但应该提取到知识库，不是维护在 Spec 文档里。**

![mermaid diagram](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

mermaid diagram

**重叠部分——无需沉淀。** 代码可执行、可测试、100% 精确；Spec 是自然语言近似描述。一致则冗余，不一致则危险。保留精确的那份就够了。

**代码外知识——提取到知识库。** 业务规则、决策原因、领域边界有长期价值，但正确归宿是 CLAUDE.md 和知识库——系统级知识，放在 Spec 里下个需求的 AI 看不到；放在知识库里所有后续开发都受益。

**同步维护——成本 3-4 倍，换来一份没人看的文档。** 两个用不同语言描述同一事物的产物，没有编译器强制一致性，漂移不是例外——是必然。

---

## ❺ 工具强强联合，流程越严格效果越好？——退潮沙滩上的城堡

社区常见思路：OpenSpec 管 What，Superpowers 管 How，Kiro 管形式化——三个叠起来全覆盖。 **哲学不自洽的东西缝不出自洽。**

**世界观冲突。** OpenSpec 信 Spec 是 truth，Superpowers 信测试是 truth。Spec 和测试冲突时听谁的？没有融合方案回答过这个问题——它们只是用自动化跳过了这个判断。跳过不等于解决。

**方向反了。** 模型在变强，流程应该变轻。每一次融合都在加重——多一层同步、多一笔 token 税、多一套胶水。这些协调机制在模型下一次能力跳跃后就是要拆掉的负债。 **你在加固一座建在退潮沙滩上的城堡。**

**1 + 1 < 1。** 社区为融合方案构建了 15+ 字段状态机和 SHA256 追踪——融合的协调成本高到需要再造一个工具来管理。 **你能清楚说出融合后失去了什么吗？说不出——你不是在集成，是在堆叠。**

---

## 选型：五个工具，五种赌注

带着这五条认知看工具。先上结论：

| 工具 | 设计哲学 | 一句话判断 |
| --- | --- | --- |
| **Plan Mode** | AI 出方案，人审一次，用完即弃 | **够用就是最优解，大部分人不信** |
| **Superpowers** | 没有测试就没有代码，纪律即产品 | **用 token 换纪律，220K+ Star 的工程信仰** |
| **OpenSpec** | Spec 是 Truth，代码是投影 | **理想很丰满，工程很骨感** |
| **Kiro** | Spec 即 IDE，需求到代码一站式 | **体验最丝滑，代价是把 IDE 交给 Amazon** |
| **GStack** | 一个人 = 一个团队，角色即约束 | **YC 掌门人的个人武器，不是团队方案** |
| **缝合怪** | 多工具互补，全覆盖 | **退潮沙滩上的城堡，一律不碰** |

下面拆开看。

---

### Plan Mode — 够用就是最优解

**设计哲学：** Spec 是实时的、一次性的、AI 生成的。Claude Code Shift+Tab、Cursor Cmd+Shift+P、Copilot 等价操作——AI 分析代码库出计划，你审批后才动代码，用完即弃。几乎所有主流 AI 编辑器已内置。

**短板：** session 断就没、不可审计、多人无法对齐。

**判断：** SDD 的最小构件是「人审意图」这一个控制点——Plan Mode 恰好做了这件事，也只做了这件事。不多不少。80% 日常迭代，到这里就该停了。

---

### Superpowers — 用 token 换纪律

**设计哲学：** 纪律即产品。七阶段流水线（Brainstorm → Worktree → Plan → TDD → Subagent → Review → Finalize），核心铁律是「没有失败测试就没有代码」——写了代码没写测试？Superpowers 直接删掉你的代码，从测试重来。GitHub 220K+ Star，已进入 Anthropic 官方插件市场，支持 Claude Code、Cursor、Gemini CLI 等 8 个平台。

**真正的创新不在 TDD 本身——在于测试吃掉了 Spec 文档。** Brainstorm 阶段逼你把 AC 想清楚，直接翻译成测试。测试就是可执行的 Spec：pass/fail 无歧义，不腐化，不需要和代码同步。两个产物坍缩成一个——「Spec 没有裁判」和「维护成本」这两个问题从根上消失。

**短板：** 费 token，简单改动 overhead 明显。七阶段流水线对改配置这种事是杀鸡用牛刀。

**判断：** 你买的不是速度，是质量下限。如果你的核心痛点不是代码质量——不需要。

---

### OpenSpec — 理想很丰满，工程很骨感

![mermaid diagram](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

mermaid diagram

**设计哲学：** Spec 是真相源，代码是投影。Fission AI（YC W26）的核心概念是「活基线」——改动以 Delta 形式提案（ADDED / MODIFIED / REMOVED），实现后归档合入主 Spec，系统规格永远最新。专为存量系统（1→n）设计。

理念本质上在为 IDD（意图驱动开发）做预演——如果未来有了业务语义编译器，活基线就是它的输入。远见值得尊重。

**但 2026 年的工程现实：**

- • 自然语言没有裁判机制，「Spec 是 Truth」这个核心假设不成立
- • 活基线维护成本随需求线性增长，同步靠手工
- • **更大的风险是时间差：模型变强的速度，可能比你的 Spec 基建成熟更快。** 等活基线建完，模型可能已经不需要它了

**判断：** 适合受监管行业的审计需求、超大系统的规格漂移治理。大部分团队不在这两个条件里。

---

### Kiro — Amazon 的豪赌：Spec 即 IDE

**设计哲学：** 把 SDD 全流程焊进 IDE。2025.7 公测 → 2025.11 GA → 2026.5 全球，正式替代 Amazon Q Developer（IDE 插件版 2027.4 停服）。底层 Claude Sonnet + Nova（Bedrock），自然语言自动转 EARS 句式（ `WHEN [条件] THE SYSTEM SHALL [行为]` ）——Rolls-Royce 的需求工程格式，天然可测试。

三种工作流：Requirements-First（从需求推设计）、Design-First（从架构推需求）、Quick Plan（跳过审批门直出任务列表）。每个任务 spawn 独立 Subagent 并行执行，Hooks 机制在文件保存时触发自动化。 **从需求到代码的体验确实最流畅** ——代价是 IDE 锁定和 AWS 生态绑定。

**短板：** Code OSS 魔改版，你的编辑器、插件、快捷键全要迁移。Spec 产物锁在 Kiro 项目结构里，离开 Kiro 就带不走。模型只能用 Bedrock 上的，不能换。

**判断：** EARS 句式是真正有工程价值的创新——结构化需求天然可转测试。但把整个工作流焊进一个 IDE，意味着你的开发流程和 Amazon 的产品路线图绑定了。

---

### GStack — YC 掌门人的个人武器

**设计哲学：** 角色即约束。YC 掌门人 Garry Tan 开源，96K+ Star。23 个 slash command 覆盖 CEO、产品经理、架构师、QA、安全官等角色——不是模拟 23 个人，而是 23 个专项技能。Tan 本人声称用此方案周均 10K 行代码、100 个 PR。

**GStack 解决的不是 SDD 问题，是「一个人怎么当一个团队」的问题。** 它不关心 Spec 是不是 Truth——它关心的是一个人能不能同时扮演 CEO 和 QA，且不精神分裂。

**短板：** Prompt 驱动，没有持久化的 Spec 或测试约束——本质上是结构化的 Vibe Coding。角色模拟的质量完全取决于底层模型，换个弱一点的模型，23 人团队就变成 23 个实习生。

**判断：** 如果你是独立开发者或一人公司，GStack 提供的角色切换脚手架确实有价值。但它对团队协作几乎没用——团队不需要一个人模拟 23 个角色，团队本身就是角色。

---

### 缝合怪 — 退潮沙滩上的城堡

不只是 OpenSpec + Superpowers，社区里各种缝合方案都有同一个病： **每个工具有自己的真相源，缝到一起时没人回答「冲突听谁的」。** Spec 派信文档，TDD 派信测试，IDE 派信内置流程——三套世界观靠胶水粘在一起，协调成本高到需要再造一个工具来管理融合本身。模型每变强一次，这些胶水就多一层要拆的负债。一律不碰。

---

### 决策路径

![mermaid diagram](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

mermaid diagram

正确路径是 **渐进式加层** ，不是并联缝合：

![mermaid diagram](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

mermaid diagram

每次只加一层。每层解决一个你当前真正痛的问题。

---

### 三条选型原则

1. 1\. **可执行的 > 要人读的。** 测试可执行，Spec 要人读。这一条淘汰大部分重型方案。
2. 2\. **轻的 > 重的。** 今天加的每一层流程，模型下次能力跳跃后还有存在价值吗？
3. 3\. **一个 > 多个。** 两个工具之间的胶水，就是你不该付的成本。

**例外：** 金融合规、医疗审计、多团队大型系统——这些场景的审计追溯需求是真实的，Spec 持久化不是形式主义而是法律要求。如果你在这类行业，从 OpenSpec 或 Kiro 起步，不要从 Plan Mode 起步。上面的原则适用于绝大多数产品团队。

---

## 我们的选择

亮底牌： **Plan Mode 打底 + Superpowers 兜关键模块，Plan 产物持久化到文档。**

轻量需求（前端页面、配置变更、CRUD）走 Plan Mode——AI 出方案，人审批准后执行。区别是 **我们把计划持久化到文档** ，不依赖 session 存活。前端 TDD 收益有限（UI 状态多、视觉回归靠 snapshot 不靠单元测试），审批门够用。

后端复杂需求（资金链路、权限模型、核心业务规则）加 Superpowers——不是为了流程，是为了 **质量下限** 。这些模块出 bug 的代价是生产事故，测试锁住验收标准比任何文档都可靠。

没有用 OpenSpec——团队不需要审计追溯，维护活基线的成本我不愿意付。没有用 Kiro——不想被 IDE 绑定。GStack 我在个人项目里偶尔用来做产品思考，不算正式工具链。

**一个趋势：** 模型每强一代，基础的测试编写能力会逐步内化——简单场景不再需要外部工具强制「先写测试」。但这不代表 Superpowers 会过时。恰恰相反，模型越强，Superpowers 的价值越往上层迁移：从基础 TDD 纪律，到 Brainstorm 的对抗性需求澄清、Worktree 的隔离保障、Review 的多阶段门禁。 **模型内化的是能力，工具守住的是纪律——两件事。**

这不是标准答案——是「模型足够强、团队 10 人以内、ToB 产品」上下文下的选择。你的上下文不同，答案可能完全不同。

---

## 未来：Spec 会变成 AI 的中间表示

![mermaid diagram](data:image/svg+xml,%3C%3Fxml version='1.0' encoding='UTF-8'%3F%3E%3Csvg width='1px' height='1px' viewBox='0 0 1 1' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Ctitle%3E%3C/title%3E%3Cg stroke='none' stroke-width='1' fill='none' fill-rule='evenodd' fill-opacity='0'%3E%3Cg transform='translate(-249.000000, -126.000000)' fill='%23FFFFFF'%3E%3Crect x='249' y='126' width='1' height='1'%3E%3C/rect%3E%3C/g%3E%3C/g%3E%3C/svg%3E)

mermaid diagram

三个判断收束：

**❶ 真正值得投资的不是 Spec 工具，是 Context + Eval。** 知识库让 AI 知道你的系统一直相信什么，测试不让考生批改自己试卷。Spec 工具在中间——这一层正在变薄。

**❷ Spec 会变成 AI 的中间表示。** 像汇编语言：重要，但人不直接写。SDD 赢了 2025-2027 的战役，但「人写 Spec」不是终局。

**❸ 选最轻的工具 = 赌模型变强，选最重的 = 赌模型停滞。** 你赌哪边？

---

五条你中了几条？你们团队用的什么工具组合？或者——你见过真正跑通的融合方案吗？Spec 和测试冲突时，听谁的？评论区见。

**微信扫一扫赞赏作者**

SSD实战系列 · 目录

继续滑动看下一个

dolphin07

向上滑动看下一个
