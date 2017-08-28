#!/bin/sh

SESSION=${1:-openbox}

pgrep redshift &> /dev/null || redshift -l -12.90:-38.42 &> /dev/null &
~/.fehbg &
~/bin/bar &
xss-lock -- ~/bin/lock &
xbindkeys &

# Configure Thinkpad keyboard layout 
setxkbmap -model pc105 -layout us,us -variant altgr-intl,intl -option grp:caps_toggle,grp_led:caps,compose:menu

# Quickfix for dunst not seeing DISPLAY environment variable
systemctl --user import-environment DISPLAY

case $SESSION in
    openbox) exec openbox-session;;
    i3) exec i3;;
    *) exec $SESSION;;
esac

