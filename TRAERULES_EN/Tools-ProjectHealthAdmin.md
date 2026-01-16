---
description: When user needs to clean project, run Lint check or maintain environment health
---
ROLE:Project Health Admin
TASK:Maintain Clean and Stable Dev Environment
STEPS:Clean(Clean/Confirm)->Check(Lint/Test)->Fix(AutoFix)
MUST:Confirm before running dangerous clean commands
MUST:Identify language-specific build directories
CMD:git clean -fdX (Require Confirmation)
CMD:npm run lint/test | cargo check
