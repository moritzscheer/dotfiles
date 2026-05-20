#!/bin/bash
iatest=$(expr index "$-" i)

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me
#######################################################

if [ -f /etc/bashrc ]; then
	 . /etc/bashrc
fi

if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $- == *i* ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
stty -ixon

# Ignore case on auto-completion
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=vim
export VISUAL=vim

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESSHISTFILE=-

# Change Cache dir of npm
export npm_config_cache="~/.cache/npm/"

#######################################################
# GENERAL ALIAS'S
#######################################################

# Date and modified commands
alias date='date "+%Y-%m-%d %A %T %Z"'   # formatted date
alias cp='cp -i'                         # interactive copy
alias mv='mv -i'                         # interactive move
alias rm='rm -iv'                        # interactive, verbose remove
alias mkdir='mkdir -p'                   # make dirs, parents if needed
alias ps='ps auxf'                       # detailed process tree
alias ping='ping -c 10'                  # ping with 10 packets
alias less='less -R'                     # raw control chars in less
alias grep="/usr/bin/grep --color=auto"  # grep with colors
alias systemctl="sudo systemctl"
alias firewall-cmd="sudo firewall-cmd"
alias headscale="sudo headscale"
alias tailscale="sudo tailscale"

# Package manager and editors
alias dnf='sudo dnf'                     # run dnf with sudo
alias reboot="sudo reboot now"
alias shutdown="sudo shutdown"

# Directory navigation shortcuts
alias home='cd ~'                       # go to home directory
alias cd..='cd ..'                      # parent directory
alias ..='cd ..'
alias ...='cd ../..'                    # two levels up
alias ....='cd ../../..'                # three levels up
alias .....='cd ../../../..'            # four levels up

# Directory aliases
alias l="ls -AFoqv --color --group-directories-first -h"  # detailed color ls, dirs first
alias lsr='ls -lRh'                     # recursive ls
alias lst='ls -ltrh'                    # ls sorted by modification date
alias lsf="ls -l | egrep -v '^d'"       # list files only
alias lsd="ls -l | egrep '^d'"          # list directories only
alias rmd='rm --recursive --force --verbose'

# Recursive chmod shortcuts
alias 000='chmod -R 000'                # no permissions
alias 644='chmod -R 644'                # rw-r--r--
alias 666='chmod -R 666'                # rw-rw-rw-
alias 755='chmod -R 755'                # rwxr-xr-x
alias 777='chmod -R 777'                # rwxrwxrwx

# Search and utility aliases
alias h="history | grep "               # search command history
alias c="clear"                         # clear terminal screen
alias p="ps aux | grep "                # search running processes
alias f="find . | grep "                # search files in cwd
alias e="cd ~/projects/cpp_networking/ && nvim"
alias ee="cd ~/projects/thesis/ && nvim"

# Utility aliases
alias cpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"  # top 10 CPU processes
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null" # File count in current directory (recursive)
alias ports='ss -tulnpe'                # show listening ports with process info
alias openports='ss -tanpue4'           # show all IPv4 ports with process info

# Disk and folder usage
alias diskspace="du -S | sort -n -r | more"          # sort folders by space used
alias folders='du -h --max-depth=1'                  # folder sizes in current dir
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'  # sort folders by size
alias tree='tree -CAhF --dirsfirst'                   # tree view files and folders
alias treed='tree -CAFd'                              # tree view directories only
alias mountedinfo='df -hT'                            # mounted disks with types

# Archive commands
alias mktar='tar -cvf'         # create .tar archive (uncompressed)
alias untar='tar -xvf'         # extract .tar archive
alias mkbz2='tar -cvjf'        # create .tar.bz2 archive (bzip2 compressed)
alias unbz2='tar -xvjf'        # extract .tar.bz2 archive
alias mkgz='tar -cvzf'         # create .tar.gz archive (gzip compressed)
alias ungz='tar -xvzf'         # extract .tar.gz archive

alias cdp="cd ~/projects/dtdmsbackend && source .venv/bin/activate"
alias cdpe="cdp  && nvim"

. "$HOME/.local/bin/env"
