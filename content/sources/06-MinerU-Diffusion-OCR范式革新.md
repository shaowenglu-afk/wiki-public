---
type: source
created: 2026-06-28
source_date: 2026-04-15
author: 老章很忙
original: "[2026-04-15 MinerU 再次改变 OCR，5 倍提升](https://shaowenglu.com/clippings/2026-04-15-MinerU-%E5%86%8D%E6%AC%A1%E6%94%B9%E5%8F%98-OCR%EF%BC%8C5-%E5%80%8D%E6%8F%90%E5%8D%87)"
tags: [wiki, source, OCR, 扩散模型]
---

# MinerU 再次改变 OCR，5 倍提升

> 公众号「Ai 学习的老章」，2026-03-30 发表。

## TL;DR
[[entities/MinerU]] 团队（上海 AI 实验室 OpenDataLab）于 2026-03-24 发布 **MinerU-Diffusion**，把传统自回归 OCR 解码换成 **[[concepts/扩散解码]]**，论文标题：*Rethinking Document OCR as Inverse Rendering via Diffusion Decoding*。精度持平 SOTA 同时吞吐量提升至 **3.26×**。

## 关键事实
- 模型规模：2.5B 参数
- 论文核心洞察：自回归解码依赖"语言先验"而非"视觉证据"，Semantic Shuffle 测试中自回归准确率随打乱直线下跌，扩散纹丝不动
- 三大技术：
  1. **Block-wise 分块扩散解码器**（Block 内并行、Block 间自回归）
  2. **两阶段课程学习**（750 万样本基础训练 → 不确定性硬骨头精训）
  3. **动态置信度调度**（τ 可调节速度 vs 精度）
- Benchmark（OmniDocBench v1.5）：
  - MinerU2.5（AR）：Overall 93.44, TPS 51.46
  - MinerU-Diffusion（τ=0.97）：Overall 93.34, TPS 98.32（≈2×）
  - τ=0.6：TPS 164.8（3.26×），精度仍超 90%
- 公式识别（UniMER-Test）：CPE 91.6 / HWE 91.6 / SCE 92.0 / SPE 96.8，全面碾压 GPT-4o

## 产品矩阵
- MinerU 3.0：支持 PDF/图片/DOCX，输出 Markdown/JSON，109 种语言
- MinerU2.5：VLM 版本，OmniDocBench 长期基准
- MinerU-Diffusion-V1：4 种任务（Layout / Text / Formula / Table），三种引擎（HF Transformers / Nano-DVLM / SGLang）

## 涉及实体 / 概念
[[entities/MinerU]] · [[concepts/扩散解码]]

## 原文链接
- 内部：[2026-04-15 MinerU 再次改变 OCR，5 倍提升](https://shaowenglu.com/clippings/2026-04-15-MinerU-%E5%86%8D%E6%AC%A1%E6%94%B9%E5%8F%98-OCR%EF%BC%8C5-%E5%80%8D%E6%8F%90%E5%8D%87)
