<div id="chinese"></div>

# Trae Agent Rules (Learning Edition)

**中文** | [English](#english)

这是一个关于 Trae IDE 智能体规则配置的学习项目，旨在通过标准化、结构化的规则定义，提升 AI 辅助编程的效率与准确性。

## ⚠️ 声明 (Disclaimer)

本项目是我 ([@Cooper-X-Oak](https://github.com/Cooper-X-Oak/)) 的学习之作。内容深受开源社区 Agent Rules 相关项目的启发，在此基础上进行了重构、汉化和定制，以适应 Trae IDE 的工作流。

## ✨ 项目亮点 (Highlights)

本项目对 Agent Rules 进行了深度的标准化和结构化改造，主要特点如下：

1.  **自我指向的递归进化 (Self-Referential Evolution)**
    *   **核心哲学**：本项目构建了一个“自我指向”的文档系统，即利用规则系统本身来规范和完善规则的制定。
    *   **极致精简**：采用 `Key:Value` 键值对格式，摒弃冗长描述，实现 Token 的最大化利用。
    *   **强指令约束**：使用 `MUST`, `NEVER`, `REQUIRED` 等关键词，降低理解歧义。

2.  **智能生效模式 (Smart Triggering)**
    *   **`alwaysApply: true`**: 全局生效（如中文交互规范）。
    *   **`globs: "*.md"`**: 基于文件路径自动匹配生效。
    *   **`description: "..."`**: 基于语义场景智能触发。

3.  **标准化分类命名 (Standardized Categories)**
    *   所有规则文件采用 `Category-功能名称.md` 格式，分类清晰（Global/Core/Docs/Tech/Tools）。

## 📂 目录结构

所有规则文件均位于 `TRAERULES/` 目录下，扁平化管理：

*   **`RULEOFRULES.md`**: **[核心元规则]** 定义了所有规则必须遵循的宪法级标准。
*   **Core (核心类)**
    *   `Core-中文交互规范.md`: 全局语言约束，确保中文回复。
    *   `Core-Bug修复专家.md`: 标准化 Bug 修复流程。
    *   `Core-技术实现架构师.md`: 代码实现与架构设计。
    *   ... (全视角审查、根因分析等)
*   **Docs (文档类)**
    *   `Docs-Readme管理员.md`: 维护项目入口文档。
    *   `Docs-技术文档工程师.md`: 编写技术文档。
    *   ... (版本日志、上下文引导等)
*   **Tech (技术栈类)**
    *   `Tech-现代Swift专家.md`: Swift 开发规范。
    *   `Tech-浏览器自动化工程师.md`: 浏览器自动化开发。
*   **Tools (工具类)**
    *   `Tools-Github项目管家.md`: Github 项目管理。
    *   `Tools-GitCommit专家.md`: 规范化 Git 提交。
    *   ... (MCP配置、系统可视化等)

## 🚀 如何使用 (Usage)

本仓库只包含整理好的规则文件，**不包含** Trae 的项目配置或原始素材。

### 1. 获取规则
```bash
git clone https://github.com/Cooper-X-Oak/trae-agent-rules.git
```

### 2. 集成到项目
1.  在你的 Trae 项目根目录下，创建 `.trae/rules/` 文件夹。
2.  将 `TRAERULES` 文件夹中的所有 `.md` 文件复制到 `.trae/rules/` 目录下。
3.  **重要**：确保 `RULEOFRULES.md` 和 `Core-中文交互规范.md` 被包含在内，以保证基础体验。

### 3. 验证生效
在 Trae 中打开任意文件或进行对话，AI 将根据当前的上下文（文件类型或你的问题）自动加载相应的规则。

## 🤝 贡献 (Contributing)

欢迎提交 Issue 或 Pull Request 来改进规则库！

1.  Fork 本仓库。
2.  创建特性分支 (`git checkout -b feature/AmazingRule`)。
3.  按照 `RULEOFRULES.md` 的标准编写新规则。
4.  提交更改 (`git commit -m 'feat: Add AmazingRule'`).
5.  推送到分支 (`git push origin feature/AmazingRule`).
6.  提交 Pull Request。

## 📄 许可证 (License)

[MIT License](LICENSE)

---
*Created with ❤️ by Cooper-X-Oak using Trae IDE*

---

<div id="english"></div>

# Trae Agent Rules (Learning Edition)

[中文](#chinese) | **English**

This is a learning project about Trae IDE agent rule configuration, aiming to improve the efficiency and accuracy of AI-assisted programming through standardized and structured rule definitions.

## ⚠️ Disclaimer

This project is a learning work by me ([@Cooper-X-Oak](https://github.com/Cooper-X-Oak/)). The content is deeply inspired by Agent Rules related projects in the open-source community, and has been refactored, localized, and customized to fit the Trae IDE workflow.

## ✨ Highlights

This project has undergone deep standardization and structural transformation of Agent Rules. Key features include:

1.  **Self-Referential Evolution**
    *   **Core Philosophy**: This project builds a "self-referential" documentation system, meaning it uses the rule system itself to regulate and improve rule creation.
    *   **Extreme Minimalism**: Adopts `Key:Value` format, discarding verbose descriptions to maximize Token utilization.
    *   **Strong Constraint Directives**: Uses keywords like `MUST`, `NEVER`, `REQUIRED` to reduce ambiguity.

2.  **Smart Triggering**
    *   **`alwaysApply: true`**: Globally effective (e.g., Language Constraint).
    *   **`globs: "*.md"`**: Automatically triggered based on file paths.
    *   **`description: "..."`**: Intelligently triggered based on semantic context.

3.  **Standardized Categories**
    *   All rule files follow the `Category-FeatureName.md` format with clear classification (Global/Core/Docs/Tech/Tools).

## 📂 Directory Structure

All rule files are located in the `TRAERULES_EN/` directory (for English version), managed in a flat structure:

*   **`RULEOFRULES.md`**: **[Core Meta-Rule]** Defines the constitutional standards that all rules must follow.
*   **Core**
    *   `Core-LanguageConstraint.md`: Global language constraint (Enforces English).
    *   `Core-BugFixExpert.md`: Standardized Bug fix process.
    *   `Core-TechImplementationArchitect.md`: Code implementation and architecture design.
    *   ... (Comprehensive Review, Root Cause Analysis, etc.)
*   **Docs**
    *   `Docs-ReadmeMaintainer.md`: Maintains project entry documentation.
    *   `Docs-TechWriter.md`: Writes technical documentation.
    *   ... (Changelog, Context Guide, etc.)
*   **Tech**
    *   `Tech-ModernSwiftExpert.md`: Swift development standards.
    *   `Tech-BrowserAutomationEng.md`: Browser automation development.
*   **Tools**
    *   `Tools-GithubProjectManager.md`: Github project management.
    *   `Tools-GitCommitExpert.md`: Standardized Git commits.
    *   ... (MCP Config, System Visualization, etc.)

## 🚀 Usage

This repository only contains the organized rule files and **does not include** Trae's project configuration or raw materials.

### 1. Get Rules
```bash
git clone https://github.com/Cooper-X-Oak/trae-agent-rules.git
```

### 2. Integrate into Project
1.  In your Trae project root directory, create a `.trae/rules/` folder.
2.  Copy all `.md` files from the `TRAERULES_EN` folder to the `.trae/rules/` directory.
3.  **Important**: Ensure `RULEOFRULES.md` and `Core-LanguageConstraint.md` are included to guarantee the basic experience.

### 3. Verify
Open any file or start a conversation in Trae. The AI will automatically load the corresponding rules based on the current context (file type or your question).

## 🤝 Contributing

Issues and Pull Requests are welcome to improve the rule library!

1.  Fork this repository.
2.  Create a feature branch (`git checkout -b feature/AmazingRule`).
3.  Write a new rule following the standard in `RULEOFRULES.md`.
4.  Commit changes (`git commit -m 'feat: Add AmazingRule'`).
5.  Push to branch (`git push origin feature/AmazingRule`).
6.  Submit a Pull Request.

## 📄 License

[MIT License](LICENSE)

---
*Created with ❤️ by Cooper-X-Oak using Trae IDE*
