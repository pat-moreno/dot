#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias qb='qutebrowser -s qt.force_software_rendering chromium'
PS1='[\u@\h \W]\$ '
