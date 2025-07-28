# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\[\033[36m\]\u\[\033[m\]:\[\033[33;1m\]\W\[\033[m\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias exa='exa -la --group-directories-first'
alias qexa='/home/jsl19/.cargo/bin/exa --group-directories-first'
alias change-python3='sudo update-alternatives --config python3' 

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

alias itksnap='/home/jsl19/apps/itksnap-3.6.0/bin/itksnap'
alias cemrgapp='/home/jsl19/app/CemrgApp/CemrgApp/CemrgApp.sh'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# added by Anaconda3 2018.12 installer
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jsl19/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jsl19/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/jsl19/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/jsl19/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# If not a desktop login then find the gnome-keyring SSH_AUTH_SOCK and set
if [ -z "$SSH_AUTH_SOCK" ]; then 
    if [ -z "$DESKTOP_SESSION" ]; then
        eval $(gnome-keyring-daemon --start 2>/dev/null )
        export SSH_AUTH_SOCK
    fi
fi

# MY VARIABLES
export AFIB_DIR="/media/jsl19/sandisk/01_atrialfibres"
export AFIB_REPROD="$AFIB_DIR/06_Reproducibility/05_UserProjects"
export KCL="/home/jsl19/"
export CEMRG_BUILD_v18="$KCL/dev/sandbox/CEMRG_BUILD_v2018.04.2"
export DEVPY="$KCL/dev/python"
export DEVCPP="$KCL/dev/src"
export DEVBUILD="$KCL/dev/build"
export FOURCH_DATA="/media/jsolisle/SEAGATEBACK/data/05_fourch" 
export FDA_DATA="/media/jsolisle/SEAGATEBACK/data/14_fda" 

export SEGTOOLS_VENV="/home/jsolisle/installs/sr/segtools/build/scripts-3.8/segtools_venv/bin/activate"
export BIN_SEGTOOLS="/home/jsolisle/installs/sr/segtools/bin"
export CARP_FOLDER="/home/jsl19/installs/carp"
export MESHTOOL_STANDALONES="/home/jsl19/installs/carp/meshtool/standalones"
export CEMRGAPP_BUILD="$DEVBUILD/CEMRG_2022_10/MITK-build/bin"

# SET PATH
export PETSC_ARCH=arch-linux-c-opt
export PATH=/home/jsl19/anaconda3/condabin:/home/jsl19/bin:/home/jsl19/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/jsl19/installs/FEBio2.9.1/bin:/home/jsl19/installs/FEBio2.9.1/bin:/home/jsl19/.cargo/bin:/opt/petsc/bin
export PATH="$PATH:$HOME/installs/FEBio2.9.1/bin:$HOME/.cargo/bin:$HOME/.emacs.d/bin"

export PATH="/home/jsolisle/opt/poetry/bin:$PATH"

# START TERMINAL
# neofetch
colorscript random
eval "$(starship init bash)"

# docker groups
# newgrp docker
#

# CARP
source /home/jsl19/installs/carp/config.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Updating PYTHONPATH
export PYTHONPATH='$DEVPY/imatools:$PYTHONPATH'

itksnapview() {
  if [ -z "$2" ]; then
    itksnap -g "$1" -s "$1"
  else
    itksnap -g "$1" -s "$2"
  fi
}

seg4ch-snap() { 
    itksnap -g $1/segmentations/$2 -s $1/segmentations/$2 
}
