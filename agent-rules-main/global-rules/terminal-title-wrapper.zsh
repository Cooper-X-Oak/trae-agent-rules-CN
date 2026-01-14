#!/usr/bin/env zsh
# Terminal title management for Claude Code
# Claude Code 的终端标题管理脚本
# Place this file in ~/.config/zsh/claude-wrapper.zsh
# 建议将此文件放置在 ~/.config/zsh/claude-wrapper.zsh
# Source it in your ~/.zshrc
# 在你的 ~/.zshrc 文件中 source 此脚本

# Function to set terminal title
# 设置终端标题的通用函数
set_terminal_title() {
    # 使用 ANSI 转义序列设置窗口标题
    # \033]0; 是设置图标名称和窗口标题的 OSC (Operating System Command) 序列
    # \007 (BEL) 是结束符
    echo -ne "\033]0;$1\007"
}

# Wrapper function for Claude Code with terminal title management
# Claude Code 的包装函数，增加了终端标题管理功能
# 默认版本（适用于 macOS Terminal.app 或其他通用终端）
cly() {
    # 尝试获取当前终端窗口的原始标题，以便后续恢复
    # 注意：osascript 是 macOS 特有的命令，用于与系统应用交互
    # 如果在非 macOS 系统上运行，这里可能会报错或无效
    local original_title=$(echo -ne "\033]0;\007" && osascript -e 'tell application "Terminal" to get name of front window')
    
    local project_path=$(pwd)
    # 获取当前目录的基本名称（项目名）
    local project_name=$(basename "$project_path")
    
    # Set the terminal title with project info
    # 设置包含项目信息的终端标题
    # ${project_path#$HOME/} 将绝对路径中的 HOME 目录部分替换为 ~ 的相对路径形式（虽然这里只是去掉了前缀）
    # 显示格式：~/path/to/project — Claude
    set_terminal_title "~/${project_path#$HOME/} — Claude"
    
    # Start background process to maintain title
    # 启动一个后台进程来持续维护标题
    # 设计意图：某些程序或操作可能会重置标题，这个循环确保在 Claude 运行期间标题保持不变
    (
        # $$ 代表当前 Shell 的 PID。kill -0 $$ 用于检查父进程是否存活
        while kill -0 $$ 2>/dev/null; do
            set_terminal_title "~/${project_path#$HOME/} — Claude"
            sleep 5
        done
    ) &
    # 获取后台进程的 PID，以便后续结束它
    local title_pid=$!
    
    # Run Claude Code
    # 执行实际的 claude 命令，传递所有参数 "$@"
    claude "$@"
    
    # Kill the background process and restore title
    # Claude 退出后，杀死维护标题的后台进程
    kill $title_pid 2>/dev/null
    # 恢复原始标题
    set_terminal_title "$original_title"
}

# Alternative version for iTerm2 users
# 针对 iTerm2 用户的特定优化版本
# iTerm2 提供了更高级的集成功能，可以通过环境变量传递上下文
if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    cly() {
        local project_path=$(pwd)
        
        # iTerm2 proprietary escape sequences
        # iTerm2 专有的转义序列
        # \033]1337;SetUserVar=key=value\007 用于设置用户自定义变量
        # 值必须进行 base64 编码
        # 这里设置 claudeProject 变量，可能用于 iTerm2 的 Badge 或其他显示配置
        echo -ne "\033]1337;SetUserVar=claudeProject=$(echo -n "$project_path" | base64)\007"
        
        # 同时设置标准的窗口标题
        printf "\033]0;%s — Claude\007" "~/${project_path#$HOME/}"
        
        # Run Claude Code
        # 运行 Claude
        claude "$@"
        
        # Clear the user var
        # 清除之前设置的用户变量，以免影响后续操作
        echo -ne "\033]1337;SetUserVar=claudeProject=\007"
    }
fi
