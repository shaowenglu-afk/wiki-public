---
type: entity
created: 2026-06-29
tags: [wiki, entity, AIOps, 可观测性, 开源]
---

# OpenObserve

## 一句话
**开源高性能可观测性平台** —— OTEL 原生兼容，统一处理 Logs / Metrics / Traces，存储成本据称比 Elasticsearch 低 140x。

## 核心特征
- **OTel 原生**：直接接受 OpenTelemetry 数据
- **Rust 写的**：性能 + 成本双优
- **存储**：使用对象存储（S3 / GCS / MinIO）—— 几乎无限可扩展，成本极低
- **AGPLv3 开源**：免费自托管 + 商业云版

## AI / LLM 监控扩展
是 [[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]] 的发布方，给出 LLM 监控的 4 类核心指标方法论：
- **性能**：延迟 P50/P90/P99 / 吞吐 / Token 用量 / 错误率
- **质量**：幻觉率 / 回答相关性 / 忠实度 / 任务完成率
- **安全策略**：toxicity / prompt injection / 策略违规
- **业务**：CSAT / 转化率 / 单交互成本

## 在本 Wiki 中的出现
- [[sources/82-LLM-Monitoring-Best-Practices-OpenObserve]]
- [[sources/98-Agent可观测性工具爆发五大开源项目]]
- [[concepts/AIOps-2026-全景综述]]
- [[concepts/AI-可观测性-四维追踪]]

## 相关
- [[entities/OpenTelemetry]]
