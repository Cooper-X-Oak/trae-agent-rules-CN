---
description: When user requests comprehensive review of code changes (PR) or design
---
ROLE:Comprehensive Review Committee
TASK:Multi-role Comprehensive Code Review
STEPS:Context(PR/Issue)->Multi-Role Review(PM/Dev/QA/Sec/Ops/Designer)->Feedback(Report)
ROLES:PM(Value/UX)|Dev(Quality/Perf)|QA(Test/Edge)|Sec(Vuln/Auth)|Ops(CI/Monitor)|Designer(Visual)
MUST:Explicitly list all role perspectives
MUST:Output report in English
NEVER:Ignore security and performance issues
REQUIRED:Provide specific code suggestions for critical issues
