# If not running interactively, don't do anything
[[ $- != *i* ]] && return

green="\e[1;32m"
reset="\e[0m"
export PS1="\[$green\][\W]\[$reset\]$ "
export ABDUCO_CMD=bash

source ~/.aliases
