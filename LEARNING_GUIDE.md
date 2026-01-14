# Agent Rules 项目学习指南

## 1. 项目简介 (Project Overview)

**Agent Rules** 是一个专为 AI 编程助手（特别是 **Trae**, Cursor, Claude Desktop）设计的规则库和工具集。

它的核心目标是：
1.  **标准化 AI 行为**: 通过 `.mdc` / `.md` 规则文件，让 AI 遵循团队的最佳实践。
2.  **自动化繁琐流程**: 提供脚本自动化 MCP 配置和环境同步。
3.  **提升开发效率**: 将 Code Review、文档编写、Bug 修复等任务转化为标准化的 AI 工作流。

简单来说，这是给 AI 看的**“操作手册”**，也是给开发者用的**“自动化工具箱”**。

---

## 2. 学习路径 (Learning Path)

无论你是初学者还是专家，建议按照以下路径使用本项目：

### 🟢 阶段一：快速上手 (User)
*目标：学会使用现有的规则库来辅助开发。*

1.  **环境准备**: 确保安装了 `jq`, `curl`, `git` 和 Trae/Cursor。
2.  **安装规则**: 运行 `./install-project-rules.sh` 将规则部署到你的项目中。
3.  **尝试对话**:
    -   **修 Bug**: "请根据 `bug-fix` 规则帮我修复这个错误。"
    -   **代码审查**: "运行 `code-analysis` 对当前文件进行质量评估。"

### 🟡 阶段二：理解原理 (Learner)
*目标：理解这些规则是如何工作的，以及为什么要这样设计。*

-   **阅读**: **[源码剖析与启发](./RULE_ANALYSIS_AND_INSPIRATION.md)**
    -   *内容*: 深入分析 `bug-fix.mdc`, `pr-review.mdc` 等 20+ 个核心规则的设计思想。
    -   *收获*: 理解 "Context & Persona" (场景与角色) 和 "Process Explicitization" (流程显性化) 的重要性。

### 🔴 阶段三：高阶定制 (Creator)
*目标：为 Trae 编写你自己的、复杂的 Agent 规则。*

-   **阅读**: **[Trae 高阶 Prompt 技巧](./TRAE_ADVANCED_TECHNIQUES.md)**
    -   *内容*: 掌握角色沉浸、思维链强制、防御性提示等 5 大核心技巧。
    -   *收获*: 学会编写 "架构师级" 的规则文件，让 AI 处理复杂任务。

---

## 3. 核心架构 (Architecture)

项目主要由以下三部分组成：

### 3.1 规则库 (Rules)
规则文件通常以 `.mdc` (Cursor/Trae) 或 `.md` 结尾，作为 AI 的系统提示词。

-   **Global Rules (`global-rules/`)**: 通用规则，如 MCP 配置同步 (`mcp-sync-rule.md`)。
-   **Project Rules (`project-rules/`)**: 特定任务规则，如代码分析 (`code-analysis.mdc`)、Swift 开发规范 (`modern-swift.mdc`)。

### 3.2 自动化脚本 (Scripts)
-   **安装与配置**: `install-project-rules.sh`, `tweak-claude.sh`。
-   **MCP 管理**: `mcp-sync.sh` (核心同步脚本), `setup-mcps.sh` (自动下载配置)。

### 3.3 文档 (Docs)
-   `docs/`: 包含技术参考文档，供 AI 在运行时查阅以获取准确上下文。

---

## 4. 核心设计思想 (Core Philosophy)

1.  **上下文驱动 (Context-Driven)**
    -   不仅仅是 "Fix this bug"，而是 "基于 `bug-fix.mdc` 的流程，先复现，再分析，最后修复"。规则文件定义了 AI 的**思考路径**。

2.  **自动化优先 (Automation First)**
    -   能用脚本解决的（如 MCP 配置同步），绝不让人手动操作。

3.  **跨平台统一 (Cross-Platform Consistency)**
    -   解决 Trae, Cursor, VS Code 等工具间的配置分裂，提供一致的开发体验。

4.  **最佳实践固化 (Enforced Best Practices)**
    -   将 SOLID 原则、TDD、代码风格写入规则，强制 AI 遵守，而非依赖 AI 的随机发挥。

---

## 5. 常用操作速查 (Cheatsheet)

| 任务 | 命令/操作 | 说明 |
| :--- | :--- | :--- |
| **安装规则** | `./install-project-rules.sh` | 部署规则到当前项目 |
| **同步 MCP** | `./global-rules/mcp-sync.sh` | 查看状态并同步 MCP 配置 |
| **切换 MCP** | `./global-rules/mcp-sync.sh --to-global [name]` | 将某服务器设为全局共享 |
| **使用规则** | 在 Chat 中提及 `@规则名` | 例如 `@bug-fix`, `@code-analysis` |

---

## 6. 总结

这个代码库不仅仅是一堆文件，它是一套**“AI 协同工作流”**的标准实现。通过学习它，你将从单纯的 AI 使用者（User），进化为 AI 工作流的设计者（Architect）。
