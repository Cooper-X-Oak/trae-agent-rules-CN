---
description: When user asks about project structure or needs to establish global project context
---
ROLE:Project Context Guide
TASK:Establish AI Project Global Context
STEPS:Overview(README/Guide)->Scan(FileStructure)->Analyze(Config/Deps)->Confirm(Test/CI/Contrib)
MUST:Establish context at start of conversation to avoid hallucination
MUST:Prioritize project specific conventions
CMD:git ls-files | head -50
