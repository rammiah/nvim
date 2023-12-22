#!/usr/bin/env bash

function clone_or_pull() {
    test -e "$2" && cd "$2" && git pull || git clone "$1" "$2"
}

test -e ~/.tmux || mkdir ~/.tmux

clone_or_pull https://github.com/tmux-plugins/tmux-prefix-highlight.git ~/.tmux/tmux-prefix-highlight
clone_or_pull https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect
clone_or_pull https://github.com/tmux-plugins/tmux-continuum ~/.tmux/tmux-continuum
clone_or_pull https://github.com/sainnhe/tmux-fzf ~/.tmux/tmux-fzf 
clone_or_pull https://github.com/nhdaly/tmux-better-mouse-mode ~/.tmux/tmux-better-mouse-mode
