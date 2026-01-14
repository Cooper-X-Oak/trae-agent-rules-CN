# Trae Agent Rules (Learning Edition)

这是一个关于 Trae IDE 智能体规则配置的学习项目。

## ⚠️ 声明 (Disclaimer)

本项目是我 ([@Coope-X-Oak](https://github.com/Coope-X-Oak/)) 的学习之作，旨在深入理解和实践 AI 辅助编程中的规则定义与上下文管理。

**致谢原作者**：本项目的内容和结构深受开源社区 Agent Rules 相关项目的启发（源自 `agent-rules`）。我在此基础上进行了重构、汉化和定制，以更好地适应 Trae IDE 的工作流。本项目充分尊重原作者的创意与贡献，如有侵权请联系删除。

## ✨ 项目亮点 (Highlights)

本项目对 Agent Rules 进行了深度的标准化和结构化改造，主要亮点如下：

1.  **极致精简的规则格式**
    *   **Token 最大化利用**：摒弃冗长的自然语言描述，采用 `Key:Value` 键值对格式。
    *   **强指令约束**：移除 Markdown 装饰、表情和冗余标点，使用 `MUST`, `NEVER`, `REQUIRED` 等关键词，降低 AI 理解歧义。

2.  **智能生效模式 (Smart Triggering)**
    *   引入 YAML Frontmatter (`--- ... ---`) 头部定义。
    *   支持三种互斥的生效模式，实现精准的上下文控制：
        *   `alwaysApply: true`: 全局生效（如核心规则定义）。
        *   `globs: "*.swift"`: 基于文件路径自动匹配生效。
        *   `description: "..."`: 基于语义场景智能触发（如“当用户需要修复Bug时”）。

3.  **结构化工作流 (Structured Workflows)**
    *   将复杂的工程任务拆解为标准化的 `STEPS`（步骤链）。
    *   明确定义 `ROLE`（角色）和 `TASK`（任务边界），让 AI 扮演特定专家角色。

4.  **完全本地化 (Localization)**
    *   规则文件名与 `ROLE` 保持一致，且采用中文命名，直观易懂。
    *   内容针对中文语境进行了优化，符合中文开发者习惯。

## 📂 目录结构

*   **`.trae/rules/`**: 核心元规则（Rule of Rules）及 IDE 级配置。
    *   `RULEOFRULES.md`: 定义了所有规则必须遵循的元规则。
*   **`TRAERULES/`**: 具体的技术栈、工作流和工具类规则。
    *   `Core-Workflows/`: 核心工作流（如代码审查、Bug修复）。
    *   `Tech-Stack/`: 技术栈特定规则（如 Swift, 浏览器自动化）。
    *   `Tools-Automation/`: 工具与自动化规则（如 Git 提交、MCP 配置）。
    *   `Docs-Knowledge/`: 文档与知识管理规则。

## 🚀 如何使用

1.  将本项目克隆到本地。
2.  在 Trae IDE 中打开本项目。
3.  Trae 会自动加载 `.trae/rules` 中的全局规则。
4.  根据文件名或触发条件，Trae 会在特定场景下自动应用 `TRAERULES` 中的规则。

---
*Created with ❤️ by Coope-X-Oak using Trae IDE*
