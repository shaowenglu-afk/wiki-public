---
type: entity
category: SDD 工具
created: 2026-06-28
sources: ["[[sources/10-SDD五个常识全错了]]"]
tags: [wiki, entity, SDD]
---

# OpenSpec

Fission AI（YC W26）出品，专为存量系统（1→n）设计的 SDD 工具，核心概念是**活基线**（living baseline）。

## 设计哲学
**Spec 是真相源，代码是投影。** 改动以 Delta 形式提案（ADDED / MODIFIED / REMOVED），实现后归档合入主 Spec，系统规格永远最新。

## 远见
本质在为 **IDD（意图驱动开发）** 做预演——如果未来有了业务语义编译器，活基线就是它的输入。

## 2026 年的工程现实（[[sources/10-SDD五个常识全错了]] 作者批评）
- ❌ 自然语言没有裁判机制 → "Spec 是 Truth"假设不成立
- ❌ 活基线维护成本随需求线性增长，同步靠手工
- ⚠️ **时间差风险**：模型变强可能比 Spec 基建成熟更快；等活基线建完，模型可能不需要它了

## 适用判断
- ✅ 受监管行业的审计需求
- ✅ 超大系统的规格漂移治理
- ❌ 大部分团队不在这两个条件里

## 与其他工具
- 哲学与 [[Superpowers]] 冲突（Spec vs 测试）
- 缝合方案"OpenSpec 管 What + Superpowers 管 How"被 [[sources/10-SDD五个常识全错了]] 作者称为"退潮沙滩上的城堡"

## 在本 Wiki 中的出现
- [[sources/10-SDD五个常识全错了]]

## 相关
[[Superpowers]] · [[Kiro]] · [[Plan-Mode]] · [[concepts/Spec-Driven-Development]]
