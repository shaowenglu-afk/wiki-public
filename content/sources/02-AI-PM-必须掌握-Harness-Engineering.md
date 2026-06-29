---
type: source
created: 2026-06-28
source_date: 2026-04-07
author: 林航旗
original: "[[Clippings/2026-04-07 26年AI产品经理为什么必须掌握Harness Engineering？.md]]"
tags: [wiki, source, Harness, AI-PM]
---

# 26 年 AI 产品经理为什么必须掌握 Harness Engineering？

> 公众号「人人都是产品经理」，作者林航旗，2026-03-30。

## TL;DR
**[[concepts/Vibe-Coding]]** 扛不住工业级环境，AI PM 必须升级为 **[[concepts/Harness-Engineering]]** 的系统架构师。OpenAI Codex 团队 3 人 5 个月、0 行人工代码交付 100 万行的关键不是模型而是 Harness。

## 关键论点
- **协作范式三阶段**（详见 [[concepts/协作范式演进]]）：
  1. Prompt Engineering = 单向指令
  2. Context Engineering = 静态信息供给（RAG / Skill 手册）
  3. Harness Engineering = 动态系统闭环（沙箱 + 验证脚本 + 反馈）
- **推理三明治**（基于 Token ROI）：高推理规划（顶层）+ 低推理执行（中层）+ 选择性高推理质检（底层）
- **Harness 五大核心模块**：
  1. 按需索引（`AGENTS.md` 等目录文件）
  2. 代码拦截（能用 Lint/脚本写死的规则绝不用 Prompt 建议）
  3. 三层自动质检（L1 硬规则 / L2 沙箱执行 / L3 高推理同行评审）
  4. 数据探针（UI 测试 / 日志 / 指标接口）
  5. 垃圾回收（后台治理 Agent + 影子系统验证 + 确定性回滚）

## 对 PM 的启示
- 从"流水线质检员"变为"流水线架构师"
- 核心产出从 PRD/Prompt → **环境的业务规则定义**
- 设计 Harness 越严谨 → Agent 可自主时间越长 → 生产力上限越高

## 涉及实体 / 概念
[[concepts/Harness-Engineering]] · [[concepts/Vibe-Coding]] · [[concepts/协作范式演进]] · [[entities/Codex]]
