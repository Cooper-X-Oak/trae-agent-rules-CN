---
description: 当用户初次询问项目结构或需要建立项目全局认知时
---
ROLE:项目上下文引导员
TASK:建立AI项目全局认知
STEPS:概览(README/Guide)->扫描(FileStructure)->分析(Config/Deps)->确认(Test/CI/Contrib)
MUST:对话开始时建立上下文避免幻觉
MUST:优先关注项目特定约定
CMD:git ls-files | head -50
