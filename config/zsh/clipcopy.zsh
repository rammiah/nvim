#!/usr/bin/env zsh

# OSC 52 copy wrapper
# 使用方法: echo "hello" | clipcopy  或者 clipcopy file.txt
function clipcopy() {
    local data
    # 判断是否有管道输入
    if [[ -p /dev/stdin ]]; then
        data="$(cat -)"
    elif [[ -n "$1" && -f "$1" ]]; then
        data="$(cat "$1")"
    else
        echo "Usage: echo 'text' | clipcopy OR clipcopy file.txt" 
        return 1
    fi

    # 1. 计算长度
    local len=$(echo -n "$data" | wc -c)
    
    # 2. 限制最大长度 (OSC 52 通常限制在 100,000 字节左右，视终端而定)
    if [ "$len" -gt 100000 ]; then
        echo "Warning: Input too large for OSC 52 copy ($len bytes)" >&2
    fi

    # 3. 构建 OSC 52 序列
    # \033]52;c; -> 开始 OSC 52，c 代表系统剪切板(clipboard)
    # base64(data) -> 内容必须 base64 编码
    # \a -> 结束符
    local esc="\033]52;c;$(echo -n "$data" | base64 | tr -d '\n')\a"

    # 4. 发送给终端
    # 在 tmux 内部需要额外转义，但既然你现在是在 tmux 外部（直接 zsh），直接 printf 即可
    printf "$esc"
}

# 至于 clippaste：
# 注意：出于安全原因，绝大多数现代终端（如 iTerm2）默认禁止通过 ESC 序列“读取”剪贴板。
# 这防止了恶意服务器窃取你本地剪贴板里的密码。
# 如果你必须用，通常建议直接使用终端的快捷键 (Cmd+V / Ctrl+V) 粘贴。
function clippaste() {
    echo "Error: Modern terminals disable remote reading of clipboard for security."
    echo "Please use your terminal's paste shortcut (Cmd+V or Ctrl+V)."
}
