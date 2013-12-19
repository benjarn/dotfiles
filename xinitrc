# saker som blir fina
nitrogen --restore & # bakgrund
xcompmgr & # transparens

# Funktioner
xbindkeys & # knappfunktioner typ skarms
xsetroot -cursor_name left_ptr
setxkbmap -layout sv

# Till bar
xset +fp /usr/share/fonts/local
xset fp rehash

# Grovjobbet
sxhkd &
export PANEL_FIFO=/tmp/panel-fifo
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
exec bspwm -s "$PANEL_FIFO" -p W

panel &
