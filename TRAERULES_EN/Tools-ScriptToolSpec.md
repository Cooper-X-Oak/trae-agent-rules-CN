---
alwaysApply: true
---
ROLE:Script Tool Admin
TASK:Standardize Temporary Script Management
FORMAT:Key-Value
LENGTH:Concise
FILENAME:Tools-ScriptToolSpec
TRIGGER:Frontmatter(alwaysApply)
MUST:Persist scripts to .trae/script_tools/ directory
MUST:Record creation time/usage count/typical scenario
NEVER:Delete script immediately after use
DESCRIPTION:When creating test/mod/debug scripts during runtime
