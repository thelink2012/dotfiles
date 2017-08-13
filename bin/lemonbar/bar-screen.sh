#!/bin/sh

# TODO handle sleep time for each individual functionality

clock() {
    DATETIME=$(date "+%a %H:%M")
    echo -n "$DATETIME"
}

battery() {
    # TODO handle battery + AC power
    # TODO handle no battery
    FA_BATTERY_FULL="\uf240"
    FA_BATTERY_THREE_QUARTERS="\uf241"
    FA_BATTERY_HALF="\uf242"
    FA_BATTERY_QUARTER="\uf243"
    FA_BATTERY_EMPTY="\uf244"
    BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
    if [ "$BATTERY_LEVEL" -lt 7 ]; then
        BAT_ICON=$FA_BATTERY_EMPTY
    elif [ "$BATTERY_LEVEL" -lt 25 ]; then
        BAT_ICON=$FA_BATTERY_QUARTER
    elif [ "$BATTERY_LEVEL" -lt 50 ]; then
        BAT_ICON=$FA_BATTERY_HALF
    elif [ "$BATTERY_LEVEL" -lt 75 ]; then
        BAT_ICON=$FA_BATTERY_THREE_QUARTERS
    else
        BAT_ICON=$FA_BATTERY_FULL
    fi
    echo -n "$BAT_ICON $BATTERY_LEVEL%  "
}

wireless() {
    LINK_LEVEL=$(awk 'NR==3 {printf "%.0f",$3*10/7}' /proc/net/wireless)
    if [[ ! -z $LINK_LEVEL ]]; then
        echo -e "\uf1eb $LINK_LEVEL%  "
    else
        echo -e ""
    fi
}

volume() {
    # TODO volume level icons
    # TODO mute icon
    VOLUME=$(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]%')
    echo -e "\uf028 $VOLUME%  "
}

while true; do
    DATETIME=$(clock)
    BATTERY=$(battery)
    WLAN=$(wireless)
    VOLUME=$(volume)
    echo -e "%{c}$DATETIME%{r}$WLAN$VOLUME$BATTERY"
    sleep 5
done

