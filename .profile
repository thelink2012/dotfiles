export EDITOR=vim
export VISUAL=vim
export PAGER=less
export PATH=~/bin:$PATH

# Use local virtualenv instead of global site packages
VIRTUAL_ENV_DISABLE_PROMPT=1
source ~/.pythonenv/bin/activate
unset VIRTUAL_ENV_DISABLE_PROMPT

# initialize bash if we're running bash
if [ -n "$BASH" ]; then
    [ -r "$HOME/.bashrc" ] && . ~/.bashrc
fi

