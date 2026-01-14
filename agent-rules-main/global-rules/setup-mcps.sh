#!/bin/bash
# MCP Setup Helper Script
# MCP 安装辅助脚本
# This script downloads all necessary files and prepares the MCP installation
# 该脚本用于下载所有必要文件并准备 MCP 安装环境

set -e
# [原理] set -e 表示如果任何命令执行失败（返回非零退出码），脚本立即终止
# [设计意图] 确保错误不会级联，避免在不完整的环境中继续执行后续步骤

echo "🚀 MCP Setup Helper for Claude Code"
echo "===================================="
echo "This script will download all necessary files for MCP server setup in Claude Code."
echo "Note: This is for Claude Code (the CLI tool), not Claude Desktop."
# 明确指出该脚本适用于 CLI 版 Claude Code，而非桌面版应用
echo ""

# Create directory structure
# 创建目录结构
echo "Creating directory structure..."
mkdir -p ~/Projects/agent-rules/global-rules
# [潜在问题] 路径 ~/Projects/agent-rules/global-rules 是硬编码的，用户可能不希望在 ~/Projects 下创建目录
# [建议] 考虑让用户自定义安装路径，或使用当前目录
cd ~/Projects/agent-rules/global-rules
# 切换到工作目录

# Download files
# 下载必要文件
echo "Downloading MCP documentation and scripts..."

# Main documentation
# 下载主文档 steipete-mcps.md
echo "  • Downloading steipete-mcps.md..."
curl -sO https://raw.githubusercontent.com/steipete/agent-rules/refs/heads/main/global-rules/steipete-mcps.md
# [原理] curl -sO: -s (silent) 静默模式，-O (remote-name) 使用远程文件名保存

# Sync script
# 下载同步脚本 mcp-sync.sh
echo "  • Downloading mcp-sync.sh..."
curl -sO https://raw.githubusercontent.com/steipete/agent-rules/refs/heads/main/global-rules/mcp-sync.sh
chmod +x mcp-sync.sh
# 赋予执行权限

# Sync rule documentation
# 下载同步规则文档
echo "  • Downloading mcp-sync-rule.md..."
curl -sO https://raw.githubusercontent.com/steipete/agent-rules/refs/heads/main/global-rules/mcp-sync-rule.md

echo ""
echo "✅ All files downloaded successfully!"
echo ""

# Extract installation scripts from the documentation
# 从 Markdown 文档中提取安装脚本
echo "Extracting installation scripts..."

# Extract the pre-installation check script
# 提取预安装检查脚本
# [原理] 使用 awk 解析 Markdown 文件
# /^```bash$/{p=1; next}: 遇到 ```bash 开始标记，设置 p=1 (打印标志)
# /^```$/{...}: 遇到 ``` 结束标记，检查之前收集的 script 内容是否包含特定字符串 "Checking for required API keys"
# 如果包含，则写入 check-api-keys.sh 文件
awk '/^```bash$/{p=1; next} /^```$/{if(p && script ~ /Checking for required API keys/) print script > "check-api-keys.sh"; p=0; script=""} p{script = script $0 "\n"}' steipete-mcps.md
chmod +x check-api-keys.sh 2>/dev/null || true
# [潜在问题] 这种提取方式依赖文档内容的精确匹配（如 "Checking for required API keys"），如果文档更新修改了这部分描述，提取就会失败

# Extract the quick installation script
# 提取快速安装脚本
# 原理同上，匹配 "Quick MCP Installation"
awk '/^```bash$/{p=1; next} /^```$/{if(p && script ~ /Quick MCP Installation/) print script > "quick-install-mcps.sh"; p=0; script=""} p{script = script $0 "\n"}' steipete-mcps.md
chmod +x quick-install-mcps.sh 2>/dev/null || true

echo ""
echo "📁 Files ready in: ~/Projects/agent-rules/global-rules/"
echo ""
echo "Next steps:"
echo "1. Check API keys:     ./check-api-keys.sh"
echo "2. Quick install:      ./quick-install-mcps.sh"
echo "3. Full install:       Follow instructions in steipete-mcps.md"
echo "4. Verify setup:       ./mcp-sync.sh"
echo ""

# Offer to install project rules
# 询问用户是否安装项目规则
echo "📋 Project Rules (Slash Commands)"
echo "================================="
echo "The repository includes 20 project rules that add slash commands to Claude Code:"
echo "  • /commit - Create well-formatted commits"
echo "  • /bug-fix - Complete bug fix workflow"
echo "  • /pr-review - Comprehensive PR reviews"
echo "  • ...and 17 more!"
echo ""
read -p "Would you like to install project rules? (y/N): " install_rules
if [[ "$install_rules" == "y" || "$install_rules" == "Y" ]]; then
    # Check if we have the full repository
    # 检查本地是否已有完整的仓库副本
    if [ -d "$HOME/Projects/agent-rules/project-rules" ]; then
        cd "$HOME/Projects/agent-rules"
        ./install-project-rules.sh
    else
        # 如果没有，则克隆完整仓库
        echo "Cloning full repository to get project rules..."
        git clone https://github.com/steipete/agent-rules.git ~/Projects/agent-rules-full
        cd ~/Projects/agent-rules-full
        ./install-project-rules.sh
    fi
    # 返回之前的目录
    cd ~/Projects/agent-rules/global-rules
fi

echo ""
echo "To view the documentation:"
echo "  cat steipete-mcps.md"
echo ""
echo "To add missing API keys:"
echo "  • OPENAI_API_KEY: https://platform.openai.com/api-keys"
echo "  • GITHUB_PERSONAL_ACCESS_TOKEN: https://github.com/settings/tokens"
echo "  • FIRECRAWL_API_KEY: https://www.firecrawl.dev"
