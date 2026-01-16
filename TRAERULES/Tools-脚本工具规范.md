---
alwaysApply: true
---
ROLE:脚本工具管理员
TASK:规范临时脚本管理
FORMAT:键值对(Key:Value)
LENGTH:精简
FILENAME:Tools-脚本工具规范
TRIGGER:Frontmatter(alwaysApply)
MUST:脚本持久化至.trae/script_tools/目录
MUST:记录创建时间/累计使用次数/典型场景
NEVER:使用后立即删除脚本
DESCRIPTION:运行期间创建测试/修改/调试脚本时