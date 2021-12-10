#!/usr/bin/env bash
test -e ~/.tmux || mkdir ~/.tmux
test -e ~/.tmux/tmux-prefix-highlight || git clone https://github.com/tmux-plugins/tmux-prefix-highlight.git ~/.tmux/tmux-prefix-highlight
test -e ~/.tmux/tmux-resurrect || git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect
test -e ~/.tmux/tmux-continuum || git clone https://github.com/tmux-plugins/tmux-continuum ~/.tmux/tmux-continuum
