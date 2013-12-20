# My .zshrc file
#
# Written by Matthew Blissett.
#
# Latest version available from http://matt.blissett.me.uk/linux/zsh/zshrc
#
# Some functions taken from various web sites/mailing lists, others written
# myself.
#
# Last updated 2013-08-07
#
# Released into the public domain.
#

# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# Set prompt (white and purple, nothing too fancy)
#PS1=$'%{\e[0;37m%}%B%*%b %{\e[0;35m%}%m:%{\e[0;37m%}%~ %(!.#.>) %{\e[00m%}'
# Fancier prompt
# Exit status indicator in red (if not 0)
# Job count in yellow (if not 0)
# Date in white, host in magenta, directory in default, prompt character
# Example:   
#     1J 23:06:26 ig:~ >
PS1=$'%F{def}%(?..%B%K{red}[%?]%K{def}%b )%(1j.%b%K{yel}%F{bla}%jJ%F{def}%K{def} .)%F{white}%B%*%b %F{m}%m:%F{white}%~ %(!.#.>) %F{def}'

# Set less options
if [[ -x $(which less 2> /dev/null) ]]
then
    export PAGER="less"
    export LESS="--ignore-case --LONG-PROMPT --QUIET --chop-long-lines -Sm --RAW-CONTROL-CHARS --quit-if-one-screen --no-init"
    export LESSHISTFILE='-'
    if [[ -x $(which lesspipe 2> /dev/null) ]]
    then
	LESSOPEN="| lesspipe.sh %s"
	export LESSOPEN
    fi
fi

# Set default editor
# Some functions taken from various web sites/mailing lists, others written
# myself.
#
# Last updated 2013-08-07
#
# Released into the public domain.
#
if [[ -x $(which vim 2> /dev/null) ]]
then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

    export BROWSER="firefox"

# FAQ 3.10: Why does zsh not work in an Emacs shell mode any more?
# http://zsh.sourceforge.net/FAQ/zshfaq03.html#l26
#[[ $EMACS = t ]] && unsetopt zle
bindkey -v

# Zsh settings for history
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# Zsh spelling correction options
#setopt CORRECT
#setopt DVORAK

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# Background processes aren't killed on exit of shell
setopt AUTO_CONTINUE

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Don’t nice background processes
setopt NO_BG_NICE

# Watch other user login/out
watch=notme
export LOGCHECK=60

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors 2> /dev/null` ]]; then
	eval `dircolors -b`
	alias 'ls=ls --color=auto'
    fi
fi

# Why is the date American even when the locale is en_GB?  Fix with this
export TIME_STYLE="long-iso"


#egna kommandon
alias 'miljö=cd /home/marcus/Dropbox/private/skola/miljö.och.eltektik'
alias 'fixdhcp=sudo systemctl restart dhcocd@wlan0'
alias 'fixwifi= sudo systemctl restart netctl-auto@wlan0'
alias 'subl=sublime3'
alias 'itkraft=sudo mount -t cifs "//192.168.1.50/hdd share" /media/itkraft -o user=marcus'

alias 'sshxshell=ssh olltre@shell.xshellz.com'

# Short command aliases
alias 'l=ls'
alias 'la=ls -A'
alias 'll=ls -l'
alias 'lq=ls -Q'
alias 'lr=ls -R'
alias 'lrs=ls -lrS'
alias 'lrt=ls -lrt'
alias 'lrta=ls -lrtA'
alias 'lrth=ls -lrth'
alias 'lrtha=ls -lrthA'
alias 'j=jobs -l'
alias 'kw=kwrite'
alias 'tf=tail -F'
alias 'grep=grep --colour --devices=skip'
#alias 'e=emacs -nw'
alias 'vnice=nice -n 20 ionice -c 3'
alias 'get_iplayer=get_iplayer --nopurge'
alias 'get-iplayer=get-iplayer --nopurge'
alias "tree=tree -I 'CVS|*~'"
alias 'lo=libreoffice'
alias 'synchist=fc -RI'

# Useful KDE integration (see later for definition of z)
alias 'k=z kate -u' # -u is reuse existing session if possible

# These are useful with the Dvorak keyboard layout
#alias 'h=ls'
#alias 'ha=la'
#alias 'hh=ll'
#alias 'hq=lq'
#alias 'hr=lr'
#alias 'hrt=lrt'
#alias 'hrs=lrs'

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'

# For Git
alias 'gk=z gitk --all'
alias 'gs=git status' # (NB overriding GhostScript)
alias 'gd=git diff'
alias 'gg=z git gui'

# For convenience
alias 'mkdir=mkdir -p'
alias 'dmesg=dmesg --ctime'
alias 'dus=du -ms * .*(N) | sort -n'
alias 'dus.=du -ms .* | sort -n'
alias 'fcs=(for i in * .*(N); do echo $(find $i -type f | wc -l) "\t$i"; done) | sort -n'
alias 'fcs.=(for i in .*; do echo $(find $i -type f | wc -l) "\t$i"; done) | sort -n'
alias 'zap=clear; echo -en "\e[3J"'
alias 'rmedir=rmdir -v **/*(/^F)'

# Typing errors...
alias 'cd..=cd ..'

# Global aliases (expand whatever their position)
#  e.g. find . E L
alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
#alias -g N='> /dev/null'
#alias -g E='2> /dev/null'

# SSH aliases
alias 'sshit=ssh itkraft.se -p 44'

# SSH to shell[1234].doc.ic.ac.uk at random
#sshdoc() {
#    ssh mrb04@shell$(($RANDOM % 4 + 1)).doc.ic.ac.uk $*
#}

# Automatically background processes (no output to terminal etc)
alias 'z=echo $RANDOM > /dev/null; zz'
zz () {
    echo $*
    $* &> "/tmp/z-${1:gs/\//_}-$RANDOM" &!
}

# Aliases to use this
# Use e.g. 'command gv' to avoid
for i in acroread akregator amarok ario chromium-browser easytag eclipse firefox gimp gpdf gv \
    gwenview k3b kate konqueror kwrite libreoffice okular \
    opera; do
    alias "$i=z $i"
done
alias "lo=z libreoffice"

# Quick find
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

# Remap Dvorak-Qwerty quickly
#alias 'aoeu=setxkbmap gb' # (British keyboard layout)
#alias 'asdf=setxkbmap gb dvorak 2> /dev/null || setxkbmap dvorak gb 2> /dev/null || setxkbmap dvorak'

# Update config files (master copies stored on server)
#alias rsync-config='[[ -d ~/.matt-config/.git ]] && echo Managed by Git || rsync -av --delete --exclude .git blissett.me.uk:.matt-config/ ~/.matt-config/'
#alias pull-config='(cd ~/.matt-config; git --git-dir=$HOME/.matt-config/.git pull && . ~/.zshrc)'

# Named directories
#hash -d config=$HOME/.matt-config
#hash -d bin=$HOME/.matt-config/bin
#hash -d log=/var/log

# When directory is changed set xterm title to host:dir
chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
	sun-cmd) print -Pn "\e]l%~\e\\";;
        *xterm*|urxvt|(dt|k|E)term) print -Pn "\e]2;%m:%~\a";;
    esac
}

# For changing the umask automatically
chpwd () {
    case $PWD in
        $HOME/[Dd]ocuments*)
            if [[ $(umask) -ne 077 ]]; then
                umask 0077
                echo -e "\033[01;32mumask: private \033[m"
            fi;;
        /web*|$HOME/[Ww]eb*)
            if [[ $(umask) -ne 072 ]]; then
                umask 0072
                echo -e "\033[01;33mumask: other readable \033[m"
            fi;;
        /nothing)
            if [[ $(umask) -ne 002 ]]; then
                umask 0002
                echo -e "\033[01;35mumask: group writable \033[m"
            fi;;
        *)
            if [[ $(umask) -ne 022 ]]; then
                umask 0022
                echo -e "\033[01;31mumask: world readable \033[m"
            fi;;
    esac
}
cd . &> /dev/null

# For quickly plotting data with gnuplot.  Arguments are files for 'plot "" with lines'.
plot () {
    echo -n '(echo set term png; '
    echo -n 'echo -n plot \"'$1'\" with lines; '
    for i in $*[2,$#@]; echo -n 'echo -n , \"'$i'\" with lines; '
    echo 'echo ) | gnuplot | display png:-'

    (
	echo "set term png"
	echo -n plot \"$1\" with lines
	for i in $*[2,$#@]; echo -n "," \"$i\" "with lines"
	) | gnuplot | display png:-
}
# Persistant gnuplot (can be resized etc)
plotp () {
    echo -n '(echo -n plot \"'$1'\" with lines; '
    for i in $*[2,$#@]; echo -n 'echo -n , \"'$i'\" with lines; '
    echo 'echo ) | gnuplot -persist'

    (
	echo -n plot \"$1\" with lines
	for i in $*[2,$#@]; echo -n "," \"$i\" "with lines"
	echo
	) | gnuplot -persist
}

# CD into random directory in PWD
cdrand () {
	all=( *(/) )
	rand=$(( 1 + $RANDOM % $#all ))
	cd $all[$rand]
}

# Rotate a jpeg, losslessly
#jrotate-r () {
#    for i in $*; do
#	exiftran -9 -b -i $i
#    done
#}

# Calculate the difference in whole days between two dates, ignoring timezone changes
datediff () {
    echo $(( ($(date -u -d $1 +%s) - $(date -u -d $2 +%s)) / 86400)) 
}

# MySQL prompt
export MYSQL_PS1="\R:\m:\s \h.\d> "

if [[ -x $(which mvn 2> /dev/null) ]]
then
    export MAVEN_OPTS="-DdownloadSources=true -DdownloadJavadocs=true $MAVEN_OPTS"
fi

# Print some stuff
date +%c
if [[ -x `which fortune 2> /dev/null` ]]; then
    echo
    fortune -a 2> /dev/null
fi

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _match
zstyle ':completion:*' completions 0
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 0
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '+m:{a-z}={A-Z} r:|[._-]=** r:|=**' '' '' '+m:{a-z}={A-Z} r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' substitute 0
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Username completion.
# Delete old definitions
zstyle -d users
# Set explicitly:   zstyle ':completion:*' users mrb04 matt
# Uses /etc/passwd, minus these entries:
zstyle ':completion:*:*:*:users' ignored-patterns \
    adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
    named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
    rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs backup  bind  \
    dictd  gnats  identd  irc  man  messagebus  postfix  proxy  sys  www-data \
    avahi Debian-exim hplip list cupsys haldaemon ntpd proftpd statd

# Hostname completion
#zstyle ':completion:*' hosts $( cat $HOME/.hosts* )

# File/directory completion, for cd command
zstyle ':completion:*:cd:*' ignored-patterns '(*/)#lost+found' '(*/)#CVS'
#  and for all commands taking file arguments
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'

# Prevent offering a file (process, etc) that's already in the command line.
zstyle ':completion:*:(rm|cp|mv|kill|diff|scp):*' ignore-line yes
# (Use Alt-Comma to do something like "mv abcd.efg abcd.efg.old")

# Completion selection by menu for kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# Filename suffixes to ignore during completion (except after rm command)
# This doesn't seem to work
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(^rm):*' ignored-patterns '*?.o' '*?.c~' '*?.old' '*?.pro' '*~'
zstyle ':completion:*:(all-|)files' ignored-patterns '(|*/)CVS'
#zstyle ':completion:*:(all-|)files' file-patterns '(*~|\\#*\\#):backup-files' 'core(|.*):core\ files' '*:all-files'

zstyle ':completion:*:*:rmdir:*' file-sort time

#zstyle ':completion:*' local matt.blissett.me.uk /web/matt.blissett.me.uk

# CD to never select parent directory
zstyle ':completion:*:cd:*' ignore-parents parent pwd

## Use cache
# Some functions, like _apt and _dpkg, are very slow. You can use a cache in
# order to proxy the list of results (like the list of available debian
# packages)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Quick ../../..
rationalise-dot() {
    if [[ $LBUFFER = *.. ]]; then
	LBUFFER+=/..
    else
	LBUFFER+=.
    fi
}
zle -N rationalise-dot
bindkey . rationalise-dot

autoload zsh/sched

# Copys word from earlier in the current command line
# or previous line if it was chosen with ^[. etc
autoload copy-earlier-word
zle -N copy-earlier-word
bindkey '^[,' copy-earlier-word

# Cycle between positions for ambigous completions
autoload cycle-completion-positions
zle -N cycle-completion-positions
bindkey '^[z' cycle-completion-positions

# Increment integer argument
autoload incarg
zle -N incarg
bindkey '^X+' incarg

# Write globbed files into command line
autoload insert-files
zle -N insert-files
bindkey '^Xf' insert-files

# Play tetris
#autoload -U tetris
#zle -N tetris
#bindkey '^X^T' tetris

# xargs but zargs
autoload -U zargs

# Calculator
autoload zcalc

# Line editor
autoload zed

# Renaming with globbing
autoload zmv

# Add Git functions 
if [[ -d ~/.matt-config/zsh-git/functions ]]; then
    fpath=($fpath ~/.matt-config/zsh-git/functions)
    typeset -U fpath
    setopt promptsubst
    autoload -U promptinit
    promptinit
    prompt wunjo
fi

# Various reminders of things I forget...
# (Mostly useful features that I forget to use)
# vared
# =ls turns to /bin/ls
# =(ls) turns to filename (which contains output of ls)
# <(ls) turns to named pipe
# ^X* expand word
# ^[^_ copy prev word
# ^[A accept and hold
# echo $name:r not-extension
# echo $name:e extension
# echo $xx:l lowercase
# echo $name:s/foo/bar/

# Quote current line: M-'
# Quote region: M-"

# Up-case-word: M-u
# Down-case-word: M-l
# Capitilise word: M-c

# kill-region

# expand word: ^X*
# accept-and-hold: M-a
# accept-line-and-down-history: ^O
# execute-named-cmd: M-x
# push-line: ^Q
# run-help: M-h
# spelling correction: M-s

# echo ${^~path}/*mous*

# Add host/domain specific zshrc
#if [ -f $HOME/.zshrc-$HOST ]
#then
#    . $HOME/.zshrc-$HOST
#fi
#
#if [ -f $HOME/.zshrc-$(hostname -f) ]
#then
#    . $HOME/.zshrc-$(hostname -f)
#fi
#
#if [ -f $HOME/.zshrc-$(hostname -d) ]
#then
#    . $HOME/.zshrc-$(hostname -d)
#fi

# Get round annoyance in Gentoo
# (No idea if this is needed any more)
source $HOME/.zshenv
