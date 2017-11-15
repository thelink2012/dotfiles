#!/bin/sh
SESSION=${1:-i3}

# Setup root window
[ -e $HOME/.fehbg ] && {
    $HOME/.fehbg &
}

# Start lemonbar
[ -e $HOME/bin/bar ] && {
    $HOME/bin/bar &
}

# Start screen locker
command -v xss-lock && [ -e $HOME/bin/lock ] && {
    xss-lock -- $HOME/bin/lock &
}

# Start xbindkeys
command -v xbindkeys && {
    xbindkeys &
}

# Start redshift
command -v redshift && {
    pgrep redshift &> /dev/null || redshift -l -12.90:-38.42 &> /dev/null &
}

# Configure Thinkpad keyboard layout 
[ "$HOST" = mos ] && {
    setxkbmap -model pc105 -layout us,us -variant altgr-intl,intl -option grp:caps_toggle,grp_led:caps,compose:menu
}

# Quickfix for dunst not seeing DISPLAY environment variable
command -v systemctl && {
    systemctl --user import-environment DISPLAY
}

# Execute the Window Manager
case $SESSION in
    openbox) exec openbox-session;;
    i3) exec i3;;
    *) exec $SESSION;;
esac

