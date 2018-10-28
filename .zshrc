export PROMPT="%B%F{green}[%1~]%b%f$ "
export ABDUCO_CMD=zsh
source ~/.aliases
fpath=(~/.zsh/completion $fpath)

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=5000
setopt appendhistory
setopt sharehistory
setopt incappendhistory
bindkey -e
# End of lines configured by zsh-newuser-install
#
# The following lines were added by compinstall
zstyle :compinstall filename '/home/thelink2012/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Menu Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

# Up/Down From Cursor
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search


# added by travis gem
[ -f /home/thelink2012/.travis/travis.sh ] && source /home/thelink2012/.travis/travis.sh
