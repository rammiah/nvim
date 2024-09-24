#!/usr/bin/env bash

set -e
set -x

if [ ! -f $HOME/.zshconf/pre/pyenv.zsh ]; then
    mkdir -p $HOME/.zshconf/pre/
    tee $HOME/.zshconf/pre/pyenv.zsh << EOF
#!/usr/bin/env zsh

export PYENV_ROOT="\$HOME/.pyenv"
[[ -d \$PYENV_ROOT/bin ]] && export PATH="\$PYENV_ROOT/bin:\$PATH"
eval "\$(pyenv init -)"
EOF
fi

if ! command -v pyenv version 2>&1> /dev/null; then
    echo "activating pyenv"
    source $HOME/.zshconf/pre/pyenv.zsh
    echo "pyenv activated"
else
    echo "pyenv has beed activated"
fi

function clone_or_pull() {
    test -e "$2" && cd "$2" && git pull || git clone "$1" "$2"
}

clone_or_pull https://github.com/pyenv/pyenv-update.git $(pyenv root)/plugins/pyenv-update
clone_or_pull https://github.com/pyenv/pyenv-doctor.git $(pyenv root)/plugins/pyenv-doctor
clone_or_pull https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv

