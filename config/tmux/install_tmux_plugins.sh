#!/usr/bin/env bash
test -e ~/.tmux || mkdir ~/.tmux
test -e ~/.tmux/tmux-prefix-highlight || git clone https://github.com/tmux-plugins/tmux-prefix-highlight.git ~/.tmux/tmux-prefix-highlight
test -e ~/.tmux/tmux-resurrect || git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect
test -e ~/.tmux/tmux-continuum || git clone https://github.com/tmux-plugins/tmux-continuum ~/.tmux/tmux-continuum
test -e ~/.tmux/tmux-fzf || git clone https://github.com/sainnhe/tmux-fzf ~/.tmux/tmux-fzf
test -e ~/.tmux/tmux-better-mouse-mode || git clone https://github.com/nhdaly/tmux-better-mouse-mode ~/.tmux/tmux-better-mouse-mode
