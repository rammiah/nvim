#!/usr/bin/env bash

function clone_repo() {
    test -e "$2" && rm -rf "$2"
    git clone --depth=1 "$1" "$2"
}

clone_repo https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
clone_repo https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
clone_repo https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
clone_repo https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
clone_repo https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autoupdate

mkdir -p ~/.zshconf/post
ln -sf ~/.config/nvim/config/zsh/clipcopy.zsh ~/.zshconf/post/clipcopy.zsh
