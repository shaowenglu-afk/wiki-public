---
type: entity
category: 协议 / 基础设施
created: 2026-06-28
sources: ["[[sources/14-MCP-Tools-Empirical-Study]]", "[[sources/08-企业级-Agentic-AI-架构设计]]", "[[sources/11-Managed-Agents]]", "[[sources/13-Harness-Design-Long-Running-Apps]]"]
tags: [wiki, entity, Anthropic, MCP, 协议]
---

# MCP（Model Context Protocol）

Anthropic 提出的开放协议，定义 AI Agent 与外部工具 / 数据源 / 服务的标准化交互方式。已成为**Agent 工具生态的事实标准基础设施**。

## 一句话定义
让 AI Agent 通过统一协议接入"工具世界"（数据库、API、文件系统、浏览器自动化等），无需为每个工具单独适配。

## 事实证据
- 截至 2026-02，公开仓库已有 **177,436 个 MCP 工具**（[[sources/14-MCP-Tools-Empirical-Study]]）
- 其中 **软件开发占 67% 工具数 + 90% 下载量**
- **行动类工具占比 16 个月内从 27% 升至 65%** — Agent 正从"读"向"做"快速演进

## 在本 Wiki 多源出现
| Source | 角色 |
|---|---|
| [[sources/14-MCP-Tools-Empirical-Study]] | 主角，17.7 万 MCP 工具实证 |
| [[sources/08-企业级-Agentic-AI-架构设计]] | 列为三大主流通信协议之一（vs A2A、ANP）|
| [[sources/11-Managed-Agents]] | Managed Agents 用专用代理为 MCP 工具调用获取凭证 |
| [[sources/13-Harness-Design-Long-Running-Apps]] | 用 **Playwright MCP** 让 Evaluator Agent 真测页面 |
| [[sources/12-Parallel-Claude-C-Compiler]] | 间接出现（Claude Code 工具基础）|

## 与同类协议对比（来自 [[sources/08-企业级-Agentic-AI-架构设计]]）

| 协议 | 发布者 | 适用场景 |
|---|---|---|
| **MCP** | Anthropic | IDE/聊天应用的插件、DB、API 集成（最广泛）|
| A2A | Google | 跨供应商企业级 Agent 编排 |
| ANP | 社区 | 跨组织/多域开放 Agent 网络 |

## 治理新视角
[[sources/14-MCP-Tools-Empirical-Study]] 的核心倡议：**监管关注"工具层"** —— 而非只看模型输出。MCP server 仓库公开可监测，提供前所未有的可观察性。

## 相关
[[concepts/Agentic-AI]] · [[concepts/Brain-Hands-Decoupling]] · [[Claude-Agent-SDK]]（如未来建）· [[Codex]]
