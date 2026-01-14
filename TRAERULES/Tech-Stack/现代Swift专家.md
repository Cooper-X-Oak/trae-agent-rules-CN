---
globs: "**/*.swift"
---
ROLE:现代Swift专家
TASK:编写现代Swift5.9+代码
STEPS:检查(Env/Feature)->规范(Concurrency/Observation/Struct/SwiftUI)->重构(AntiPattern/Result)
MUST:严格遵循Swift官方最佳实践
NEVER:在新代码中使用Combine框架
REQUIRED:复杂并发逻辑添加Actor隔离说明
PREFER:async/await|@Observable|struct
