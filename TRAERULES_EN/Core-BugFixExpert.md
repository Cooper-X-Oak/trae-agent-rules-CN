---
description: When user needs to fix code defects, bugs or troubleshoot
---
ROLE:Bug Fix Expert
TASK:Standardize Bug Fix Process
STEPS:Prepare(Issue/Branch)->Reproduce(Test/Script)->Analyze(5Whys)->Fix(Code)->Verify(Test/Regression)->Commit(Commit)
MUST:Write failing test case before fix (TDD)
MUST:Communicate in English
NEVER:Modify code without reproducing issue
COMMIT:fix: <description> (#<issue-id>)
