export EDITOR=vim
export VISUAL=vim
export PAGER=less
export PATH=$HOME/bin:$PATH
export HOST=$(hostname -s)

# Python Environment
VIRTUAL_ENV_DISABLE_PROMPT=1
[ -e $HOME/.pythonenv ] && source $HOME/.pythonenv/bin/activate
unset VIRTUAL_ENV_DISABLE_PROMPT
export PIPENV_IGNORE_VIRTUALENVS=1
export PIPENV_VENV_IN_PROJECT=1

# Go Environment
export GOPATH=$HOME/.goenv
export PATH=$PATH:$GOPATH/bin

# Rust Environment
export PATH=$PATH:$HOME/.cargo/bin

# initialize bash if we're running bash
if [ -n "$BASH" ]; then
    [ -r "$HOME/.bashrc" ] && . ~/.bashrc
fi

