---
type: entity
category: OCR / 文档解析
created: 2026-06-28
sources: ["[[sources/06-MinerU-Diffusion-OCR范式革新]]"]
tags: [wiki, entity, OCR, 开源]
---

# MinerU

上海 AI 实验室 OpenDataLab 出品，**开源文档解析事实标准**。

## 一句话定义
诞生于 InternLM 大模型预训练数据处理过程的开源 OCR / 文档解析工具，2026 用扩散解码重新定义 OCR 范式。

## 产品矩阵
| 版本 | 类型 | 关键能力 |
|---|---|---|
| **MinerU 3.0** | Pipeline | 全格式（PDF/图片/DOCX）、109 种语言、自动去页眉页脚、表格公式提取、OmniDocBench v1.5 得分 86.2 |
| **MinerU2.5** | VLM | 长期作为 OCR 模型 benchmark 基准 |
| **MinerU-Diffusion-V1** | 扩散解码（2026-03-24 发布）| 2.5B 参数，4 任务，吞吐 3.26× |

## 关键里程碑
- 论文：*Rethinking Document OCR as Inverse Rendering via Diffusion Decoding*
- 核心洞察：OCR 本质是视觉任务，不该用自回归的"语言先验"解码 → 详见 [[concepts/扩散解码]]
- 性能：精度持平 SOTA 的同时吞吐量提升至 **3.26×**
- 公式识别全面碾压 GPT-4o

## 三大技术
1. Block-wise 分块扩散解码器（Block 内并行、Block 间自回归）
2. 不确定性驱动的两阶段课程学习
3. 动态置信度调度（τ 旋钮：速度 vs 精度）

## 支持引擎
HuggingFace Transformers / Nano-DVLM（单 GPU）/ SGLang（高性能服务化）

## 模型地址
`opendatalab/MinerU-Diffusion-V1-0320-2.5B`

## 在本 Wiki 中的出现
- [[sources/06-MinerU-Diffusion-OCR范式革新]]

## 相关
[[concepts/扩散解码]]
