# don't put duplicate lines or lines starting with space in the history.
##HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000
shopt -s histappend
shopt -s checkwinsize
export HISTTIMEFORMAT="%d/%m/%y %T "
export VISUAL=vim


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1="/\[\033[38;1;31m\]\w\[$(tput sgr0)\]/ \n\[\033[38;1;34m\] : "
####PS1="<\[\033[38;1;31m\]\w\[$(tput sgr0)\]> \n\[\033[38;1;34m\] : "
#PS1="|\[\033[45;1;32m\]\w\[$(tput sgr0)\] \n\[\033[38;1;36m\]: "
#PS1="|\[\033[45;1;32m\]\w\[$(tput sgr0)\]-¬  \n\[\033[38;1;36m\]> "
#S1="¬ \[$(tput sgr0)\]\[\033[38;1;31m\]\w\[$(tput sgr0)\]  \n\[\033[38;1;36m\]> "
#PS1=">> \[$(tput sgr0)\]\[\033[38;5;27m\]\w\[$(tput sgr0)\] || \[$(tput sgr0)\]\n> "
#PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[1;49;96m\]\u@\h\[\033[00m\]\[\033[00;34m]\w\[\033[00m\]:\nL '

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# import bash_aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH=~/.local/bin:$PATH

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# meus alias
alias i3='vim .config/i3/config'
alias up="sudo apt update"
alias upgr='sudo apt upgrade'
alias rxvt='xrdb .Xresources' 
alias .term='vim .Xresources'
alias ist='sudo apt install'
alias cht='cht.sh'
alias chtt='curl cht.sh'
alias autorm='sudo apt autoremove'
alias search='apt search'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias renatinho='exec hollywood'
alias loja='fpkg'
alias ytmp3='youtube-dl -x --audio-format mp3'
alias vrc='vim .vimrc' 
alias grep='grep --color=auto'
alias py3='python3'
alias zrc='vim .zshrc'
alias brc='vim .bashrc'
alias xrc='vim .Xresources'
alias novo='novo-script'
alias npy='py-script'
alias v='vim'
alias cx='chmod +x'
alias t=tree
alias r=ranger
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias less='less -iXRS'
alias tmp='cd /tmp'
alias cmd='cht.sh'
alias yt='ytfzf'
alias cf='cd ~/.config/'
alias w3d='w3m duckduckgo.com'
alias npy='py-script'
alias uaifi='rofi-wifi-menu.sh'
alias end='powermenu'
alias monitor='monitor_layout.sh'
alias busca='rofi-search'
alias ytrun='./.local/bin/run'
alias beats='./Modelos/Rofi-Beats/rofi-beats-linux'
alias bin='cd ~/.local/bin/'

############
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
#################

