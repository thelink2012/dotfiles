export EDITOR=vim
export VISUAL=vim
export PAGER=less
export PATH=~/bin:$PATH

# Use local virtualenv instead of global site packages
source ~/.pythonenv/bin/activate

# initialize bash if we're running bash
if [ -n "$BASH" ]; then
    [ -r "$HOME/.bashrc" ] && . ~/.bashrc
fi

