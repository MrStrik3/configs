alias cd.wk="cd /mnt/c/Users/LefrancoisC/Desktop/Travail"
alias cd.temp="cd /mnt/c/Users/LefrancoisC/Desktop/Temp"
alias cd.iwls="cd /mnt/c/Users/LefrancoisC/Desktop/Travail/CodeSource/Intellij/iwls"
# alias ll="ls -al"
# alias ls='ls --color=auto'
alias ll="exa -l -g --icons"
alias ls="exa --icons"
alias lt="exa --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints'"
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

alias ssh.lauimlshcv22="ssh -o \"KexAlgorithms diffie-hellman-group-exchange-sha1,diffie-hellman-group1-sha1\" mone@lauimlshcv22.lau.dfo-mpo.ca"
alias ssh.vsonkenxp163="ssh -o \"KexAlgorithms diffie-hellman-group-exchange-sha1,diffie-hellman-group1-sha1\" mone@vsonkenxp163.ent.dfo-mpo.ca"

alias aps.dev.log.range="curl https://intra-l01-dev.ent.dfo-mpo.ca/logs/tomcat/catalina.out -r "
alias aps.dev.log.size="curl -L -I https://intra-l01-dev.ent.dfo-mpo.ca/logs/tomcat/catalina.out"

alias nvim.cfg="nvim ~/.config/nvim"

alias kb.gp="kubectl -n dmp get pods"
alias kb.dev.geo.console="kubectl -n dmp exec -it geoserver-dev-geoserver-chart-0  -- bash"


alias kb="kubectl -n dmp"
alias kb.gp="kubectl -n dmp get pods"
alias kb.sc.dev="kubectl config set-context aksdev"
alias kb.sc.test="kubectl config set-context akstest"
alias kb.sc.prod="kubectl config set-context aksprod-b"

alias docker.start="sudo -b dockerd > /dev/null 2>&1 &"
alias docker="sudo docker"


# Git cmds
alias git.s="git status"
alias git.a="git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add"
alias git.p="git push"
# alias git.log="git log --graph --abbrev-commit --pretty=oneline | bat --file-name='Git log' --theme=Nord"
alias git.log="git log --graph --abbrev-commit --pretty=oneline | bat --file-name='Git log' --theme=OneHalfDark"
function git.c () {
  git commit -m "$@"
}

alias nvim.cfg.copy2win="cp -Rf ~/.config/nvim/{init.lua,lua} /mnt/c/Users/LefrancoisC/AppData/Local/nvim/"
alias notes="nvim /mnt/c/Users/LefrancoisC/Desktop/Travail/2022-23/notes"
