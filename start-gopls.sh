#!/usr/bin/env zsh
rm -rf /tmp/gopls-daemon-socket
# source /data00/home/wangyaning.ovo/.zshrc
gopls -listen="unix;/tmp/gopls-daemon-socket" -logfile=auto -debug=:0
rm -rf /tmp/gopls-daemon-socket
