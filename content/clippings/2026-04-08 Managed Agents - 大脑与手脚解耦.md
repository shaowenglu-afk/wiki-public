---
title: "Managed Agents：把大脑和手脚解耦"
original_title: "Scaling Managed Agents: Decoupling the Brain from the Hands"
source: "https://www.anthropic.com/engineering/managed-agents"
author:
  - "[[Lance Martin]]"
  - "[[Gabe Cemaj]]"
  - "[[Michael Cohen]]"
published: 2026-04-08
created: 2026-06-28
description: "Anthropic 推出托管 Agent 服务：通过把 Session / Harness / Sandbox 三层虚拟化解耦，让 harness 假设不再随模型迭代过时；p50 TTFT 下降 60%、p95 下降 90%+。"
tags:
  - "clippings"
  - "Anthropic"
  - "Agent"
  - "translated"
---

> ⚠️ **版权声明**：本页内容版权归原作者所有，本站仅作个人学习索引存档。如有侵权请联系删除。原文链接见页内 source 字段。


> 译自 https://www.anthropic.com/engineering/managed-agents
> 作者：Lance Martin、Gabe Cemaj、Michael Cohen｜发布：2026-04-08

## 概览

Anthropic 推出 **Managed Agents**——一项托管服务，专门应对 AI Agent 架构中的一个根本挑战：**harness（驾驭层）所编码的"模型能力假设"会随模型升级而过时**。解决方案是把 Agent 的"**大脑（Claude + harness）**"与"**手脚（sandbox + tools）**"以及"**会话日志**"分别解耦。

## 核心问题：陈旧的假设

文章举了一个真实例子：当 Claude Sonnet 4.5 在接近 token 上限时出现"**context anxiety**（上下文焦虑）"，工程师们加了 context reset 机制。但是——

> "当我们把同一个 harness 用在 Claude Opus 4.5 上，发现这个行为消失了。"

这意味着 harness 中针对旧模型缺陷打的补丁，到了新模型上就成了多余甚至有害的代码。

## 架构：组件解耦

不再把所有 Agent 组件耦合在单个容器里，Managed Agents **虚拟化了三个关键元素**：

- **Session（会话）**：所有事件的**仅追加日志**
- **Harness（驾驭层）**：调用 Claude 并路由工具调用的循环
- **Sandbox（沙箱）**：执行代码和编辑文件的环境

这模拟了几十年前操作系统**虚拟化硬件**的做法——实现可以变化，接口保持稳定。

## 基础设施改进

### 从 Pets 到 Cattle

最初所有组件共享一个容器——这是需要细心照顾的"**宠物（pet）**"。一旦容器挂掉，整个会话就丢了。解耦后容器变成可替换的"**牲畜（cattle）**"，失败可以优雅恢复。

### Harness 变为 Stateless

Harness 不再住在容器里，而是通过工具接口调用容器。这使得：

- 新容器通过 `provision({resources})` 初始化
- 失败的 harness 通过 `wake(sessionId)` 重启，通过 `getSession(id)` 恢复状态
- 事件通过 `emitEvent(id, event)` 持久化记录

## 安全架构

耦合设计带来一个漏洞：Claude 生成的不可信代码会和凭证一起跑在容器里。**结构性修复方案**是把认证从执行环境中分离：

- 仓库访问 token 在 sandbox 初始化时打包
- 自定义工具的 OAuth 凭证存储在**安全 vault** 中
- 一个专用代理在 Claude 调用 MCP 工具时去取凭证

## 上下文管理

不再针对"该保留什么"做不可逆决定，而是把会话作为 Claude 上下文窗口之外的**外部上下文对象**。`getEvents()` 接口允许选择性检索事件切片，让 Claude 可以：

- 从最后读取位置继续
- **倒带**回看更早的上下文
- 检索经过变换的事件以优化 prompt 缓存

## 可扩展性收益

### 多个大脑

解耦消除了那些不需要立即沙箱的会话的容器开销。**Time-to-First-Token (TTFT) 改善显著**：

> "我们的 p50 TTFT 下降约 60%，p95 下降超过 90%。"

### 多双手脚

每个执行环境都变成一个有简单接口的工具：`execute(name, input) → string`。这让 Claude 可以**同时操作多个 sandbox、多个容器、多个外部服务**，而不会出现耦合失败。

## 设计哲学

该架构体现了计算机科学史上的一条原则：为"**尚未想到的程序**"设计系统。Managed Agents 不去预测特定 harness 的需求，而是建立通用接口，既能容纳未来创新，又对实现细节保持不偏不倚。

## 关键引用

> "harness encode assumptions about model capabilities that become outdated as models improve."

> "Designing systems for programs as yet unthought of."

## 原文
https://www.anthropic.com/engineering/managed-agents
