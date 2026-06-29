---
type: entity
category: AI工作流平台
created: 2026-06-28
sources: ["[[sources/01-n8n-vs-Dify-vs-Coze]]"]
tags: [wiki, entity, AI工作流, RAG]
---

# Dify

开源 AI 应用开发平台，**RAG 能力是三者最强**。

## 一句话定义
帮你快速搭建带 RAG、Agent、工作流的 AI 应用（知识库问答、智能助手、客服等），支持私有部署。

## 核心特征
- 🎯 **定位**：AI 应用开发平台
- 🟢 **优势**：
  - RAG 能力最强（三者中）
  - 支持私有部署，数据可控
  - 开源社区活跃，扩展性好
  - 自定义工具、知识库
  - 主流模型 + 自定义模型接入
- 🔴 **限制**：
  - 工作流编排不如 [[n8n]] 灵活
  - 代码节点能力基础（不如 n8n 的 JavaScript）
  - 复杂多步骤自动化需补充代码

## 上手难度
⭐⭐ 中等。需理解 RAG、Prompt 模板、工具调用、知识库等概念，适合有技术基础的 PM 和开发者。

## 典型场景
- 企业内部知识库问答
- 智能客服 / 智能助手
- 需要私有部署的 AI 应用

## 在本 Wiki 中的出现
- [[sources/01-n8n-vs-Dify-vs-Coze]]
- [[sources/30-Dify-能做什么6-个-AI-应用场景讲清楚|Dify 能做什么？6 个 AI 应用场景]] —— 场景导览
- [[sources/29-Dify-凉了其实是行业回归理性|Dify 凉了？行业回归理性]] —— 行业判断
- [[sources/26-Dify-v1130-重磅发布人在回路HITL正式登场|Dify v1.13 HITL]] —— 版本演进
- [[sources/25-Dify-v1120-与-v1121重磅发布引入摘要索引让-RAG-检索告别断章取义|Dify v1.12 摘要索引]] —— RAG 强化
- [[sources/28-Dify-官方上架-Higress-插件轻松接入-AI-网关访问模型服务|Dify 上架 Higress 插件]] —— 生态扩展
- [[sources/27-Dify-vs-OpenClaw-AIOps领域的大脑与双手|Dify vs OpenClaw AIOps]] —— 跨工具对比

## 2026 Q2 演进重点

1. **HITL（Human In The Loop）** — v1.13 正式登场，让 Agent 在长流程中强制人工 checkpoint
2. **摘要索引** — v1.12 引入，解决 RAG 检索的"断章取义"
3. **AI 网关** — 上架 Higress 插件，可访问全栈模型服务
4. **行业定位重新校准** — "Dify 凉了？" 实际是 [[Workflow-vs-Agent|从 Agent 过热回到 Workflow 实用]] 的理性回归
5. **AIOps 实战**：与 [[OpenClaw]] 形成"大脑（Dify 设计） vs 双手（OpenClaw 执行）"对照

## 相关
[[Coze]] · [[n8n]] · [[OpenClaw]] · [[concepts/AI-工作流平台对比]] · [[Workflow-vs-Agent]] · [[金融智能体落地]]
