#!/bin/sh
#
# NethRaiden's bspwm panel
# 

#
# Config
#
VOLUP="amixer -q sset Master 1.50dB+ unmute"
VOLDOWN="amixer -q sset Master 1.50dB- unmute"
#PLAYER="urxvt --name floating -e ncmpcpp"
#NETWORK="urxvt --name floating -e 'sudo wifi-menu'"

FONT_FAMILY="monospace"
FONT_SIZE="8"
FONT_PIXEL="7"  # pixel width of characted - calculated using e.g. txtw-git
SCREEN_WIDTH=1280

BG="#010101"
FG="#fff"
RED="#f92672"
GREEN="#82b414"
ORANGE="#fd971f"
BLUE="#8c54fe"
#
# /Config
#

# Prepare some system info and send to bspwm fifo
while true
do
    # Date and time
    clock="$(date)"

    # Free RAM
    mem="$(free -h | grep 'buffers/cache' | awk '{print $3}')"

    # WLAN signal power
    iwconfig="$(iwconfig wlan0)"
    signal="$(echo $iwconfig | grep Signal | awk '{print $28 $29}' | sed 's/level=//g; s/ //g')"
    if [[ "$signal" == "" ]]; then
        wlan="down"
    else
        wlan="$(echo $iwconfig | grep ESSID | sed 's/.*ESSID\:"//g; s/".*//g') $signal"
    fi

    # Batteri
    bat="$(battery -p /sys/class/power_supply/BAT1/uevent)"

    # Master volume
    vol="$(amixer get Master | grep -F '[on]' | awk '{print $5}' | tr -d '[]')"
    [[ "$vol" == "" ]] && vol="mute"

    ## mpd
    #mpd="$(mpc current)"
    #[[ "$mpd" == "" ]] && mpd="stopped"

    ## mail count
    #mail="$(grep new ~/Mail/log | wc -l)"
    #if [[ "$mail" == "0" ]]; then
    #    mail=""
    #else
    #    mail="^ca(1,echo "" > ~/Mail/log).mail $mail^ca() "
    #fi

    echo "S"\
        "^ca(4,$VOLUP)^ca(5,$VOLDOWN)^fg($GREEN) .vol $vol ^fg()^ca()^ca()"\
        "^fg($BLUE) .mem $mem ^fg()"\
        "^fg($ORANGE) .wlan $wlan ^fg()"\
        "^fg($GREEN) .bat $bat ^fg()"\
        " |  $clock"
    sleep 2
done > $PANEL_FIFO &

pid=$!
trap "kill $pid; exit" SIGHUP SIGINT SIGTERM

# Format data from bspwm fifo and send it to dzen
oldifs="$IFS"
tags=""
info=""
while read -r input <$PANEL_FIFO
do
    case $input in
        WM*)	# Tags processing
            IFS=":"
            tags=""
            set -- ${input?#}
            while [ $# -gt 0 ];
            do
                item=$1
                case $item in
                    [OoFfUu]*)
                        name=${item#?}
                        disp_name=$name
                        color=""
                        case $item in
                            [OF]*) # Focused desktop
                                color="$GREEN"
                                disp_name="."$name"."
                                ;;
                            [uU]*) # urgent
                                color="$RED"
                                disp_name="*"$name"*"
                                ;;
                            o*) # occupied
                                color="$ORANGE"
                                disp_name=$name
                                ;;
                        esac
                        tags="$tags ^fg($color)^ca(1,bspc desktop -f $name)$disp_name^ca()"
                        ;;
                esac
                shift
            done
            IFS=$oldifs
            ;;
        S*)	# Info processing-not-so-much
            info=${input#?}
            ;;
    esac
    info_width=$(echo "$info." | sed "s/\^[a-z]\+([^)]*)//g")
    indent=$((SCREEN_WIDTH - (${#info_width} * FONT_PIXEL))) 
    echo "^pa(0)$tags^pa($indent)$info"
done | dzen2 -fn "$FONT_FAMILY-$FONT_SIZE" -bg "$BG" -fg "$FG" -dock -e

