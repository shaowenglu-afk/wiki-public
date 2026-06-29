---
type: source
created: 2026-06-29
source_date: 2026-06-22
author: 微信公众号
original: "[2026-06-22 AI赋能网络：K8s网络策略智能分析与故障定位](https://shaowenglu.com/clippings/2026-06-22-AI%E8%B5%8B%E8%83%BD%E7%BD%91%E7%BB%9C%EF%BC%9AK8s%E7%BD%91%E7%BB%9C%E7%AD%96%E7%95%A5%E6%99%BA%E8%83%BD%E5%88%86%E6%9E%90%E4%B8%8E%E6%95%85%E9%9A%9C%E5%AE%9A%E4%BD%8D)"
tags: [wiki, source, AIOps, K8s, 网络, 中文]
---

# AI 赋能网络：K8s 网络策略智能分析与故障定位

## TL;DR
**K8s 网络策略（NetworkPolicy）的智能化分析与故障定位**：
- K8s 网络策略难调试（YAML 复杂、规则冲突、debug 工具弱）
- 用 LLM Agent 分析整集群的 policy 拓扑，给出可达性矩阵和潜在死锁

## 关键论点
- **垂直场景 AIOps**：K8s 网络是个明确细分领域，**通用 AIOps Agent 反而处理不好** —— 需要专业知识
- **[[entities/K8sGPT]] / [[entities/HolmesGPT]]** 在网络层都有支持

## 涉及的实体 / 概念
- [[entities/K8sGPT]] · [[entities/HolmesGPT]]
- [[concepts/AIOps-2026-全景综述]]

## 原文链接
- 内部：[2026-06-22 AI赋能网络：K8s网络策略智能分析与故障定位](https://shaowenglu.com/clippings/2026-06-22-AI%E8%B5%8B%E8%83%BD%E7%BD%91%E7%BB%9C%EF%BC%9AK8s%E7%BD%91%E7%BB%9C%E7%AD%96%E7%95%A5%E6%99%BA%E8%83%BD%E5%88%86%E6%9E%90%E4%B8%8E%E6%95%85%E9%9A%9C%E5%AE%9A%E4%BD%8D)
