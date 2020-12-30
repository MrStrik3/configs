alias ll="ls -al"
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
export GREP_COLOR="1;32"
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Override vim 8
alias vim=/usr/bin/nvim
alias vi=/usr/bin/nvim
alias view="/usr/bin/nvim -R"
alias vimconfig="/usr/bin/nvim ~/.config/nvim/init.vim"

alias dmesg='dmesg --color=always'
