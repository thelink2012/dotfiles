export EDITOR=vim
export VISUAL=vim
export PAGER=less
export HOST=$(hostname -s)
export PATH="$HOME/bin:$PATH"

# Python Environment
VIRTUAL_ENV_DISABLE_PROMPT=1
#[ -e $HOME/.pythonenv ] && source $HOME/.pythonenv/bin/activate
unset VIRTUAL_ENV_DISABLE_PROMPT
export PIPENV_IGNORE_VIRTUALENVS=1
export PIPENV_VENV_IN_PROJECT=1

# Go Environment
export GOPATH=$HOME/.goenv
export PATH=$PATH:$GOPATH/bin

# Rust Environment
export PATH=$PATH:$HOME/.cargo/bin

# Ruby Enviroment
command -v ruby && {
    export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
    export GEM_HOME=$(ruby -e 'print Gem.user_dir')
}

# Android Environment
[ -d "/opt/android-sdk" ] && {
    export ANDROID_HOME="/opt/android-sdk"
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
}

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# initialize bash if we're running bash
if [ -n "$BASH" ]; then
    [ -r "$HOME/.bashrc" ] && . ~/.bashrc
fi
