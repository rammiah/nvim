DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git common-aliases fzf zsh-syntax-highlighting)
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /etc/profile.d/bash_profile.sh
export PATH=$HOME/.bin:$PATH
export BAT_THEME="Solarized (light)"
# export PATH="$PATH:$HOME/.yarn/bin"
# export PATH="/opt/tiger/consul_deploy/bin:$PATH"
export RUNTIME_IDC_NAME="boe"
export VISUAL=vim
export EDITOR="$VISUAL"

alias gdtl="git difftool"
alias ipython=ipython3
# if [ -e /home/wangyaning.ovo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/wangyaning.ovo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
source $HOME/.iterm2_shell_integration.zsh
# Add default node to path

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" --no-use
# export PATH="$NVM_DIR/versions/node/v14.16.1//bin:$PATH:/opt/clangd_12.0.0/bin"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# c & c++ compilers
# export LD_LIBRARY_PATH=/usr/local/lib
# export CC=/usr/local/bin/gcc
# export CXX=/usr/local/bin/g++

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

alias cb="cd $HOME/code/gopath/src"
# rust toolchain
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git' --glob '!kitex_gen' --glob '!thrift_gen'"

# gopath & goroot settings
export GOROOT="$HOME/.gos/go"
export GOPATH="$HOME/code/gopath"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH" 
