#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.bash_aliases

export CR_RENDER_FORCE_PRESENT_MAIN_THREAD="0 VirtualBox"

export PATH=$PATH:/home/lefrancoisc/bin

source '/home/lefrancoisc/lib/azure-cli/az.completion'
