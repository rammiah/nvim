#!/usr/bin/env zsh

function ssh-fzf () {
    local hosts=$(rg --no-line-number --no-filename -r '$1' "Host (.*)$" ~/.ssh/*config | rg -v '\*')
    local ssh="ssh "
    if [[ "${LBUFFER}" == *"ssh"* ]]; then
        local selected_host=$(echo "$hosts" | fzf)
        ssh="${LBUFFER}"
    else 
        local selected_host=$(echo "$hosts" | fzf --query "$LBUFFER")
    fi
    if [ -n "$selected_host" ]; then
        BUFFER="${ssh}${selected_host}"
        zle accept-line
        # zle accept-and-hold
    fi
    zle reset-prompt
}
zle -N ssh-fzf
bindkey '^\' ssh-fzf
