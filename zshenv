
export XDG_CONFIG_HOME="$HOME/.config"

## Bspwm
export BSPWM_PATH="$XDG_CONFIG_HOME/bspwm"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export BSPWM_TREE=/tmp/bspwm.tree
export BSPWM_HISTORY=/tmp/bspwm.history
export BSPWM_STACK=/tmp/bspwm.stack
export PANEL_FIFO=/tmp/panel-fifo
export PANEL_HEIGHT=14

export PATH=$PATH:$XDG_CONFIG_HOME/bspwm/panels


## Nya ssh alias
#

alias "sshnitro=ssh action@euw1-2.nitrousbox.com -p 21157"
alias 'smb-router=sudo mount -t cifs "//router/smb" /media/router -o user=marcus'

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
PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

