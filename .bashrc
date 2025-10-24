#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#bind '"\e[A": history-search-backward'
#bind '"\e[B": history-search-forward'

#export HISTCONTROL=ignoredups

