---
title: "OpenClaw + YOLO缺陷检测智能体，低代码实战全流程方案！"
source: "https://mp.weixin.qq.com/s?src=11&timestamp=1782645122&ver=6810&signature=vH08*UKM0-w7u0qZQlx05r1GfxrGHxZvNaVh6q1l1hW70qsZ5PJjjP0V8pa1yeYbelg6ABLSnQ*3hZWKsnHf61N7N5lD6fnHzT-fYacszUCJmwNPusW0onGV7XhFGaR-&new=1"
author:
  - "[[江大白]]"
published: 2026-03-21
created: 2026-06-28
description: "知识详解"
tags:
  - "clippings"
  - "weixin"
  - "智能体"
  - "低代码"
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 抓取自微信公众号「江大白」｜2026-06-28 由 agent-reach Playwright 终极补抓。
>
> 原文：https://mp.weixin.qq.com/s?src=11&timestamp=1782645122&ver=6810&signature=vH08*UKM0-w7u0qZQlx05r1GfxrGHxZvNaVh6q1l1hW70qsZ5PJjjP0V8pa1yeYbelg6ABLSnQ*3hZWKsnHf61N7N5lD6fnHzT-fYacszUCJmwNPusW0onGV7XhFGaR-&new=1

# OpenClaw + YOLO缺陷检测智能体，低代码实战全流程方案！

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZsS4QkvTTVtibw3sp7PYng5pkDIpibq6hziaspbKEKU98IHf0d0Tu5nlBbg/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=0)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZsxB8HvFnbn1hvmtHTdqRCZO0vqWCjNB1C0bXzyiaEvnB0yx5y2WCnhgA/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=1)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZsKah4dy3S5rtpX1fIU3l7DFTQuMGiaOesaWcbOs8f4WLlIX9FmlPWN4A/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=2)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZsgnAkD56tG0ogGSu7akf1ibTcNvlnK5WJajYKZyVOpurIsfUWbvgqUIg/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=3)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZscaxHYw0Az0buoadpNbWRicXeXpk25HmX5wCUGyjTZwGIKiazeztCticBg/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=4)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZsyJ82EOJZwq0ortaIQA3TsFEFpoB9pEWBrjZPPGxOiawlsvvqquhcNng/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=5)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZsoRib0IpCevGqH1BvrUng35y1TsU3qibhMdEak06lXVpFjPTvco1KGtTA/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=6)

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecw5fUARH2kzS0r1bepUxibZscnv5ppYQribUmGFJS7gyWIRLLQy18XZheYpia9S0002PDCmOmicIeydcA/640?wx_fmt=png&from=appmsg&tp=webp&wxfrom=5&wx_lazy=1#imgIndex=7)

以下文章来源于微信公众号：新机器视觉

作者：新机器视觉

链接：https://mp.weixin.qq.com/s/JE4jFdRm0NZDlNRIhPvpBA

本文仅用于学术分享，如有侵权，请联系后台作删文处理

![](https://mmbiz.qpic.cn/mmbiz_gif/Ljib4So7yuWhPmGHfBz7vlEFLwDwiaiaQoCQ1iaUGFFpV3z4Qq9uTTh0gibzDT52BKUwfAM5Kf2jsDpKRmuQuO2asXQ/640?wx_fmt=gif&wxfrom=5&wx_lazy=1#imgIndex=8)

**导读**

把OpenClaw与YOLO结合做产线监控听起来很理想，但现实延迟让实时方案难以落地。本文提供更务实路径：放弃实时，转向离线自动化，从模型训练到技能集成与任务配置，全程低代码，快速搭建可用方案。

让 OpenClaw 指挥 YOLO，7×24 小时盯着流水线，发现缺陷立即停机报警，顺便生成日报——这听起来很美。

但现实是：OpenClaw 调用大模型推理需要 1-3 秒，YOLO 检测需要 0.1-0.5 秒，总延迟 5 秒以上，对高速流水线来说是致命的。

**解决方案：不追求实时，先做离线自动化。**

本教程不讲复杂原理，只讲三件事：

- **训练一个能用的 YOLO 缺陷检测模型**
- **创建 OpenClaw 技能，集成 YOLO**
- **配置自动化任务：日报、预警、趋势分析**
**全程低代码，大部分配置只需对着 OpenClaw 说句话。

# 01 快速训练 YOLO 模型

如果你已经有训练好的 YOLO 模型，直接跳到第二步。

### 1. 环境配置（5 分钟）

### 2. 准备数据集

目录结构：**

![](https://mmbiz.qpic.cn/mmbiz_png/EumrvZQOicqxdXJ1Sib45lp9G2To6Hc0QHZly0HAH93H1LSzNiba7mdhE8ZsoLgiamCez3nFukbhtibliaDPbQ6edibug339JYEn2m4aVQYoZfcgl8/640?wx_fmt=png&from=appmsg#imgIndex=10)

**标注格式（每行一个缺陷）：**

**数据集配置文件（data.yaml）：**

**3.开始训练训练完成后，最佳模型保存在：**

**runs/detect/defect_v1/weights/best.pt快速验证模型效果：**

**# 02 创建 OpenClaw YOLO 技能

## OpenClaw安装参考下面这篇文章：

## OpenClaw实战教程：从零到一掌握本地AI智能体

OpenClaw 通过"技能"扩展功能。我们创建一个 YOLO 缺陷检测技能，让 OpenClaw 能够调用 YOLO 模型。

### 1. 创建技能目录

目录结构：**

**2. 编写技能配置文件skill.json：**

**3. 编写检测工具tools/detect_single.py：**

![](https://mmbiz.qpic.cn/mmbiz_png/EumrvZQOicqyibPS1o4ZeZEjkxqOHQ3iaRAXst18aKI6CktckxibUY967vqRQn9FTNtUUdVoakic5eoiabH8BCo4Bn3nu6sKiauXqClgDXibRfudib0w/640?wx_fmt=png&from=appmsg#imgIndex=18)

**tools/detect_batch.py：**

**### 

4. 安装技能到 OpenClaw

# 03 配置自动化任务（核心！）

这是最关键的一步。我们通过自然语言配置，让 OpenClaw 自动监测 YOLO 识别结果，并根据不同场景触发不同动作。

### 方案一：每日缺陷统计报表（定时任务）

场景**：每天凌晨 2 点检测所有产品图片，早上 8 点推送报表到企业微信

**配置方式（一句话搞定）：**

用户：每天凌晨 2 点，检测 /data/products/ 目录下所有图片，统计缺陷类型，早上 8 点把报表发我企业微信**OpenClaw：已创建定时任务，每天 02:00 执行检测，08:00 推送报表OpenClaw 自动生成的配置：**

**收到的报表示例：**

**### 方案二：实时缺陷预警（文件监听）

场景**：监听 /data/uav/ 目录，无人机上传新照片后自动检测，发现缺陷立即推送预警

**配置方式：**

**用户：监听 /data/uav/ 目录，有新文件就用 YOLO 检测，发现缺陷立即发企业微信预警OpenClaw：已创建文件监听任务，检测到缺陷将推送至企业微信自动生成的配置：**

**收到的预警示例：**

**### 方案三：月度质量趋势分析（数据挖掘）

场景**：统计过去 3 个月的缺陷数据，生成趋势图表，识别问题模式

**配置方式：**

**用户：帮我统计过去 3 个月的缺陷数据，生成趋势图表OpenClaw：已生成趋势报告，划痕问题在 2 号线持续上升，建议重点关注自动生成的配置：**

**### 方案四：设备健康度评分（自动化决策）

场景**：根据 YOLO 检测的缺陷数量，自动给每台设备打分，低于 60 分的推送维保建议

**配置方式：**

**用户：给每台设备打分，低于 60 分的推送维保建议OpenClaw：已创建评分任务，依据 YOLO 检测的表面缺陷自动评分自动生成的配置：**

**推送的评分报告示例：**

**### 方案五：自动化数据归档与检索（知识管理）

场景**：把所有缺陷图片按类型归档，以后用自然语言就能快速检索

**配置方式：**

**用户：把所有缺陷图片按类型归档，以后我说"找 3 月所有划痕"就能查到OpenClaw：已创建归档规则，支持自然语言检索自动生成的配置：**

**自然语言检索示例：**

**用户：找 3 月所有划痕图片OpenClaw：找到 1,237 张划痕图片，已打包发送到企业微信

# 04 企业微信集成配置

OpenClaw 支持多种消息推送渠道，这里以企业微信为例。

### 1. 创建企业微信应用

登录 企业微信管理后台进入「应用管理」→「应用」→「创建应用」获取以下信息：企业 ID（CorpId）应用 Secret（Secret）应用 ID（AgentId）2. 配置 OpenClaw 企业微信插件3. 测试消息推送# 发送测试消息openclaw wecom send "测试消息：YOLO 缺陷检测智能体已就绪"企业微信中应该能收到测试消息。

### 4. 效果测试

[多媒体]作者介绍**

****

江大白，安生智联（无锡）联合创始人。

深耕企业安全管理+AI领域，通过“技术+商业+内容”的融合视角，深度参与AI产业化落地。

全网20W+粉丝AI知识博主，人工智能技术文章超1000W+阅读，《30天入门人工智能》课程，全网2000+名学员。

主导构建的AI知识平台www.jiangdabai.com累计访问已超800万次；

**更新平台：**

****

思想阵地（深度洞察）：知乎、CSDN @江大白

内容阵地（视频解读）：抖音、快手、小红书 @江大白讲AI

实战阵地（产品纪实）：抖音、快手、小红书 @安生江大白 | 记录“1年10个AI产品100个项目应用”的极限挑战

**欢迎加入《AI未来星球》，一起成长**

**扫描下方二维码即可加入~**

![](https://mmbiz.qpic.cn/mmbiz_png/QWAZ7Ok6ecwViaZlmKE7iatrldqCz6ZeQHlC7EibQbyhxc8WJ8c6UCrWibtNiaicx6ThquOOAXq4Trc7XVPYsibrtm8pw/640?wx_fmt=png&from=appmsg#imgIndex=31)

**真诚分享AI落地过程（AI商机->项目签约->算法开发->产品开发->实施运维）中的各方面经验和踩过的坑。**
****

**你可以获得什么？ ****1、大白之前花费10W+购买，AI行业各场景私有数据集下载，星球内倾情分享；2、AI行业研发、产品、商业落地问题咨询（目前AI公司创业中），都可获高质量解答， 有效期一年****，无限次提问，有问必答。****3、定期邀请AI行业各类嘉宾分享，创业/商业等方面的经验！帮助你解决遇到的实际问题，升职加薪！大家一起加油！** 

![](https://mmbiz.qpic.cn/mmbiz_gif/3ib4H8Vxvm0gyI2LkjA7BbzJIuhb3q5ibcJtgOXoickO7y08RT4qnn5uzia3C6nxZhTCicO2LMw6mY94g29Rf07lOyg/640?wx_fmt=gif&wxfrom=5&wx_lazy=1&tp=webp#imgIndex=32)

[多媒体]
