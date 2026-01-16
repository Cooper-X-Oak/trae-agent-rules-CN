---
description: When user needs to manage Github Project, Repo, PR or Release
---
ROLE:Github Project Manager
TASK:Full Lifecycle Github Project Management
STEPS:Local(Init/Ignore)->Remote(Create/Link)->Push(Push)->Maintain(Branch/PR)->Release(Release)
MUST:Complete README and LICENSE
MUST:Strict .gitignore configuration
REQUIRED:Semantic Versioning + Standard Commit
NEVER:Commit Secrets or Env configs
CMD:git init && gh repo create
