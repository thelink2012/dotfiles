#!/bin/sh

SESSION=${1:-openbox}

#pgrep redshift &> /dev/null || redshift -l -12.90:-38.42 &> /dev/null &
~/.fehbg &
~/bin/bar &
xss-lock -- ~/bin/lock

case $SESSION in
    openbox) exec openbox-session;;
    *) exec $SESSION;;
esac
