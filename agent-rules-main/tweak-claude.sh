#!/bin/bash
# MCP and Project Rules Tweaker
# MCP 和项目规则调整工具

echo "🔧 MCP & Project Rules Customization"
# 打印工具标题，使用 emoji 增强可读性
echo "===================================="
echo ""
echo "What would you like to do?"
# 提示用户选择操作
echo "1. Add/Remove MCP servers"
echo "2. Add/Remove project rules" 
echo "3. Update API keys"
echo "4. Show current configuration"
echo "5. Exit"
echo ""
read -p "Choose an option (1-5): " choice
# 读取用户输入的选择

case $choice in
    1)
        # 用户选择 1：管理 MCP 服务器
        echo ""
        echo "MCP Server Management:"
        echo "a. Add Peekaboo (screenshot tool)"
        echo "b. Add GitHub (API access)"
        echo "c. Add Firecrawl (web scraping)"
        echo "d. Remove a server"
        echo "e. List all servers"
        read -p "Choose: " mcp_choice
        
        case $mcp_choice in
            a) 
                # 添加 Peekaboo (截图工具) MCP
                # Extract OpenAI key
                # 从 .zshrc 文件中提取 OpenAI API Key
                OPENAI_KEY=$(grep "export OPENAI_API_KEY=" ~/.zshrc | sed 's/export OPENAI_API_KEY="//' | sed 's/"$//')
                # [原理] grep 查找包含 export 的行，sed 删除前缀和后缀引号，提取纯 Key
                # [潜在问题] 这种提取方式依赖 .zshrc 格式严格匹配，如果用户格式不同（如单引号或无引号）可能提取失败
                if [ -n "$OPENAI_KEY" ]; then
                    # 如果找到了 Key，将其作为环境变量传给 MCP
                    claude mcp add-json -s user peekaboo "{\"command\": \"npx\", \"args\": [\"-y\", \"@steipete/peekaboo-mcp@beta\"], \"env\": {\"PEEKABOO_AI_PROVIDERS\": \"openai/gpt-4o,ollama/llava:latest\", \"OPENAI_API_KEY\": \"$OPENAI_KEY\"}}"
                else
                    # 如果没找到 Key，仅配置 Ollama，并提示用户
                    claude mcp add-json -s user peekaboo '{"command": "npx", "args": ["-y", "@steipete/peekaboo-mcp@beta"], "env": {"PEEKABOO_AI_PROVIDERS": "ollama/llava:latest"}}'
                    echo "Note: No OpenAI key found, using Ollama only"
                fi
                ;;
            b) 
                # 添加 GitHub MCP
                # 尝试从 .zshrc 提取 GitHub Token
                GITHUB_TOKEN=$(grep "export GITHUB_PERSONAL_ACCESS_TOKEN=" ~/.zshrc | sed 's/export GITHUB_PERSONAL_ACCESS_TOKEN="//' | sed 's/"$//')
                if [ -n "$GITHUB_TOKEN" ]; then
                    # 找到 Token，直接配置 MCP
                    claude mcp add-json -s user github "{\"command\": \"npx\", \"args\": [\"-y\", \"@modelcontextprotocol/server-github\"], \"env\": {\"GITHUB_PERSONAL_ACCESS_TOKEN\": \"$GITHUB_TOKEN\"}}"
                else
                    # 未找到 Token，提示用户先添加环境变量
                    echo "Error: Add GITHUB_PERSONAL_ACCESS_TOKEN to ~/.zshrc first!"
                    echo "Get token at: https://github.com/settings/tokens"
                fi
                ;;
            c) 
                # 添加 Firecrawl (网页爬虫) MCP
                # 尝试从 .zshrc 提取 Firecrawl API Key
                FIRECRAWL_KEY=$(grep "export FIRECRAWL_API_KEY=" ~/.zshrc | sed 's/export FIRECRAWL_API_KEY="//' | sed 's/"$//')
                if [ -n "$FIRECRAWL_KEY" ]; then
                    claude mcp add-json -s user firecrawl-mcp "{\"command\": \"npx\", \"args\": [\"-y\", \"firecrawl-mcp\"], \"env\": {\"FIRECRAWL_API_KEY\": \"$FIRECRAWL_KEY\"}}"
                else
                    echo "Error: Add FIRECRAWL_API_KEY to ~/.zshrc first!"
                    echo "Get key at: https://www.firecrawl.dev"
                fi
                ;;
            d) 
                # 移除指定的 MCP 服务器
                read -p "Server name to remove: " name 
                claude mcp remove -s user "$name" 
                ;;
            e) 
                # 列出当前安装的所有 MCP 服务器
                claude mcp list 
                ;;
        esac
        ;;
    2)
        # 用户选择 2：管理项目规则
        echo ""
        echo "Project Rules Management:"
        echo "a. Install all project rules"
        echo "b. Remove all project rules"
        echo "c. Show installed rules"
        read -p "Choose: " rules_choice
        
        case $rules_choice in
            a) 
                # 安装所有项目规则
                if ! grep -q "@.*project-rules" ~/.claude/CLAUDE.md 2>/dev/null; then
                    # 如果尚未导入规则
                    mkdir -p ~/.claude
                    echo "" >> ~/.claude/CLAUDE.md
                    echo "# Project Rules" >> ~/.claude/CLAUDE.md
                    # [潜在问题] 这里使用了硬编码的绝对路径 /Users/steipete/...，这会导致其他用户无法正确加载规则
                    # [建议] 应该改为使用 $(pwd) 动态获取当前路径，类似 install-project-rules.sh 中的做法
                    echo "@/Users/steipete/Projects/agent-rules/project-rules" >> ~/.claude/CLAUDE.md
                    echo "✓ Added all project rules"
                    echo ""
                    echo "Available commands:"
                    echo "  Git: /commit, /commit-fast, /bug-fix, /pr-review"
                    echo "  Code: /check, /clean, /code-analysis"
                    echo "  Docs: /create-docs, /mermaid, /add-to-changelog"
                    echo "  ...and more!"
                else
                    echo "Project rules already installed"
                fi
                ;;
            b)
                # 移除项目规则
                if [ -f ~/.claude/CLAUDE.md ]; then
                    # 使用 sed 删除相关配置行
                    # [注意] sed -i '' 是 macOS/BSD 版本的 sed 语法，在 Linux 上可能会报错（Linux 下通常是 sed -i）
                    sed -i '' '/@.*project-rules/d' ~/.claude/CLAUDE.md
                    sed -i '' '/# Project Rules/d' ~/.claude/CLAUDE.md
                    echo "✓ Removed project rules"
                else
                    echo "No CLAUDE.md file found"
                fi
                ;;
            c)
                # 显示已安装的规则
                if grep -q "@.*project-rules" ~/.claude/CLAUDE.md 2>/dev/null; then
                    echo "✓ Project rules are installed:"
                    grep "@.*project-rules" ~/.claude/CLAUDE.md
                    echo ""
                    echo "Location: /Users/steipete/Projects/agent-rules/project-rules/"
                    # [潜在问题] 同样是硬编码路径，只能正确统计 steipete 用户的规则文件
                    echo "Files: $(ls /Users/steipete/Projects/agent-rules/project-rules/*.mdc 2>/dev/null | wc -l) rules"
                else
                    echo "✗ Project rules not installed"
                fi
                ;;
        esac
        ;;
    3)
        # 用户选择 3：显示更新 API Key 的帮助信息
        echo ""
        echo "Update API Keys in ~/.zshrc:"
        echo ""
        echo "1. OPENAI_API_KEY (for Peekaboo AI vision)"
        echo "   Get from: https://platform.openai.com/api-keys"
        echo ""
        echo "2. GITHUB_PERSONAL_ACCESS_TOKEN (for GitHub MCP)"
        echo "   Get from: https://github.com/settings/tokens"
        echo "   Required scope: repo"
        echo ""
        echo "3. FIRECRAWL_API_KEY (for web scraping)"
        echo "   Get from: https://www.firecrawl.dev"
        echo ""
        echo "Add to ~/.zshrc:"
        echo '  export OPENAI_API_KEY="sk-..."'
        echo '  export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_..."'
        echo '  export FIRECRAWL_API_KEY="fc-..."'
        echo ""
        echo "Then run: source ~/.zshrc"
        ;;
    4)
        # 用户选择 4：显示当前配置
        echo ""
        echo "Current Configuration:"
        echo "====================="
        echo ""
        echo "MCP Servers:"
        claude mcp list
        # 列出 MCP 服务器
        echo ""
        echo "Project Rules:"
        if grep -q "@.*project-rules" ~/.claude/CLAUDE.md 2>/dev/null; then
            echo "✓ Project rules installed"
            grep "@.*project-rules" ~/.claude/CLAUDE.md
        else
            echo "✗ Project rules not installed"
        fi
        echo ""
        echo "Claude Settings:"
        if [ -f ~/.claude/settings.json ]; then
            echo "✓ Settings configured"
            # 使用 jq 格式化输出 JSON 配置，如果 jq 失败则直接 cat
            jq '{model, includeCoAuthoredBy, DISABLE_COST_WARNINGS, DISABLE_AUTOUPDATER}' ~/.claude/settings.json 2>/dev/null || cat ~/.claude/settings.json
        else
            echo "✗ No settings file"
        fi
        ;;
    5)
        # 退出程序
        exit 0
        ;;
esac
