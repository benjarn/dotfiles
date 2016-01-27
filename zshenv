
export XDG_CONFIG_HOME="$HOME/.config"

## Nya ssh alias
#


alias "sshnitro=ssh action@euw1-2.nitrousbox.com -p 21157"
alias 'smb-router=sudo mount -t cifs "//router/smb" /media/router -o user=marcus'
alias 'wake-desktop=wol 1C:6F:65:90:3A:AC'
case $TERM in
  (*xterm* | *rxvt* | screen)

    # Write some info to terminal title.
    # This is seen when the shell prompts for input.
    function precmd {
      print -Pn "\e]0;zsh%L %(1j,%j job%(2j|s|); ,)%~\a"
    }
    # Write command and args to terminal title.
    # This is seen while the shell waits for a command to complete.
    function preexec {
      printf "\033]0;%s\a" "$1"
    }

  ;;
esac

# Lägger till mina gems...
#PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

#ssh vpn alias
alias "sshproxy=ssh -Nn -D 1080 marcus@itkraft.se -p 44"
alias 'moshit=mosh --ssh="ssh -p 44" itkraft.se -p 60001'
alias 'kandidat=cd /home/marcus/Dropbox/private/skola/kandidat'
alias 'algo=cd /home/marcus/Dropbox/private/skola/AlgoritmerDatastrukturer'

#annat godis
alias ytmp3="youtube-dl \
    --default-search=ytsearch: \
    --ignore-errors \
    --extract-audio \
    --audio-format 'mp3' \
    --audio-quality 320K \
    --output '~/music/%(title)s.%(ext)s' \
    --add-metadata \
    --metadata-from-title '%(artist)s - %(title)s' \
    --embed-thumbnail"
function ytmp3_list {
    while read p; do
        ytmp3 $p
    done <$1
}
export GOPATH=$HOME/go
