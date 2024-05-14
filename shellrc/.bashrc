#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source ~/.aliases

export CR_RENDER_FORCE_PRESENT_MAIN_THREAD="0 VirtualBox"

export PATH=$PATH:~/bin

source '~/lib/azure-cli/az.completion'
. "$HOME/.cargo/env"
