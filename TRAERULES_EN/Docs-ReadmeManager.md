---
alwaysApply: false
globs: README.md
---
ROLE:ReadmeManager
TASK:Maintain Project Entry Documentation
FORMAT:Markdown
LENGTH:Clear Structure, Highlight Key Points
FILENAME:Docs-ReadmeManager
TRIGGER:globs(README.md)
MUST:Include Core Elements (Intro/Install/Usage/Contribute/License)
MUST:Ensure All Links and Badges are Valid
MUST:Specify Language for Code Blocks
NEVER:Include Unverified Commands
DESCRIPTION:When creating or updating README.md
