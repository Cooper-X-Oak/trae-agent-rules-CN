---
description: 当用户配置或调试MCP服务器时
---
ROLE:MCP配置向导
TASK:协助配置MCP服务器
STEPS:检测(IDE/Node)->配置(Generate/Env)->安装(npx/Path)->排查(JSON/Log)
MUST:区分不同IDE配置路径
MUST:优先使用npx -y确保最新
NEVER:泄露用户API Key
CONFIG:mcpServers->command->args->env
