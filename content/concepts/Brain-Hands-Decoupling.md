---
type: concept
created: 2026-06-28
sources: ["[[sources/11-Managed-Agents]]"]
tags: [wiki, concept, 架构, Agent]
---

# 大脑与手脚解耦（Brain-Hands Decoupling）

把 Agent 系统拆分成"**大脑**（Claude + harness）"和"**手脚**（sandbox + tools）"以及"**会话日志**"三层，让它们可以独立演化。

## 核心问题
> **Harness 编码的"模型能力假设"会随模型升级而过时**。

经典案例：Sonnet 4.5 的 "context anxiety" 让工程师加 reset，升级 Opus 4.5 后毛病自动消失 → 加的补丁变成多余代码。

## 解决方案：三层虚拟化（[[sources/11-Managed-Agents]]）

| 层 | 是什么 |
|---|---|
| **Session** | 仅追加的事件日志（context 的真实来源）|
| **Harness** | 调 Claude + 路由工具的循环（**变 stateless**）|
| **Sandbox** | 代码执行环境（**可替换的牲畜**而非宠物）|

## 接口
```
provision({resources})     // 启新容器
wake(sessionId)            // 恢复 harness
getSession(id)             // 恢复状态
emitEvent(id, event)       // 持久化事件
execute(name, input)→string // 工具统一接口
```

## 设计哲学
> "Designing systems for programs as yet unthought of."
> 为尚未想到的程序设计系统。

## 收益（Anthropic 实测）
- p50 TTFT **↓60%**
- p95 TTFT **↓90%+**
- 容器从"宠物"变"牲畜"，失败可优雅恢复
- 安全：MCP 工具凭证存独立 vault，不混入容器
- **多大脑 + 多手脚**：Claude 可同时操作多沙箱、多容器、多外部服务

## 历史类比
像几十年前**操作系统虚拟化硬件**——实现可变化，接口保持稳定。

## 与本 Wiki 的关系
- **下一代 Harness 架构**：[[Harness-Engineering]] 解决"如何约束 Agent"，本概念解决"**如何让约束不过时**"
- 与 [[Long-Running-Agents-Anthropic|Long-Running-Agents]]（如已建）互补：后者是模式、前者是架构
- 印证 [[Spec-Driven-Development]] 反共识 ⑤"哲学不自洽缝不出自洽"——Managed Agents 用统一接口而非缝合多套世界观

## 在本 Wiki 中的出现
- [[sources/11-Managed-Agents]]

## 相关
[[Harness-Engineering]] · [[Agentic-AI]] · [[MCP-Model-Context-Protocol]]
