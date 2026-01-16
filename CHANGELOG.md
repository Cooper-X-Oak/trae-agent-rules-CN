# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.0] - 2026-01-16

### Added
- **元规则体系**: 引入 `_Meta-规则架构标准.md` 和 `_Meta-规则索引专家.md`，构建自描述的规则系统。
- **脚本工具规范**: 新增 `Tools-脚本工具规范.md`，规范化临时脚本的管理。
- **结构化重构**: 所有核心规则全面采用 `Key:Value` 键值对格式，移除冗余描述，最大化 Token 利用率。

### Changed
- **核心架构升级**: 废弃 `RULEOFRULES.md`，由 `_Meta-规则架构标准.md` 接管宪法级规则定义。
- **文件命名规范**: 统一采用 `Category-功能名称.md` 格式。
- **触发机制优化**: 明确了 `TRIGGER` 字段，支持 `Frontmatter(alwaysApply)`, `globs`, `互斥属性` 等多种触发方式。

### Removed
- 移除旧版 `RULEOFRULES.md`。
- 移除 `Docs-Readme管理员.md` (职责合并或精简)。

### Fixed
- 修复了规则索引与实际文件不匹配的问题。
