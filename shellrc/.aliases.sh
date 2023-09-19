alias ap='apropos -s 1 . | fzf --preview='\''man {1}'\'' --preview-window=up | awk '\''{print $1}'\'' | xargs man'
alias ap.ex='apropos -s 1 . | fzf --preview='\''man {1}'\'' --preview-window=up | awk '\''{print $1}'\'' | xargs tldr'

alias cfg.aliases="nvim ~/.aliases"
alias cfg.zsh="$EDITOR ~/.zshrc"
alias cfg.ohmyzsh="$EDITOR ~/.oh-my-zsh"
alias cfg.nvim="fd --search-path ~/.config/nvim --type f | fzf  --preview 'bat -n --color=always {}' --multi --print0 | xargs -0 nvim"
alias cfg.glazewm="nvim /mnt/c/Users/$USER/.glaze-wm/config.yaml"
alias cfg.wezterm="nvim /mnt/c/Users/$USER/Desktop/Temp/Repositories/github/configs/wezterm/.wezterm.lua"

alias cd.wk="cd /mnt/c/Users/$USER/Desktop/Travail"
alias cd.temp="cd /mnt/c/Users/$USER/Desktop/Temp"
alias cd.iwls="cd /mnt/c/Users/$USER/Desktop/Travail/CodeSource/Intellij/iwls"

alias ll="eza --long --icons --group-directories-first --time-style=long-iso"
alias lla="eza -a --long --icons --group-directories-first --time-style=long-iso"
alias ls="eza --icons --time-style=long-iso --group-directories-first"
alias lt="eza --tree --icons -a -I '.git|__pycache__|.mypy_cache|.ipynb_checkpoints' --time-style=long-iso"

alias diff='diff --color=auto'
alias grep='grep --color=auto'

export GREP_COLORS="mt=1;32"
export LESS=-R

# Override vim 8
alias vim=/usr/bin/nvim
alias vi=/usr/bin/nvim
alias view="/usr/bin/nvim -R"

alias dmesg='dmesg --color=always'

alias aps.dev.log.range="curl https://intra-l01-dev.ent.dfo-mpo.ca/logs/tomcat/catalina.out -r "
alias aps.dev.log.size="curl -L -I https://intra-l01-dev.ent.dfo-mpo.ca/logs/tomcat/catalina.out"


alias kb.gp="kubectl -n iwls get pods"

alias kb="kubectl -n iwls"
alias kb.gp="kubectl -n iwls get pods"
alias kb.logs="kubectl -n iwls get pods | cut -d ' ' -f 1 | grep -v --no-ignore-case 'NAME' | sort | fzf --reverse | xargs kubectl -n iwls logs"
alias kb.sc="kubectl config get-contexts -o name | fzf --height 10% --reverse --inline-info --bind 'tab:down' --bind 'shift-tab:up' --delimiter=' ' --nth=2.. | cut -d ' ' -f 1 | xargs kubectl config use-context"
alias kb.sc.dev="kubectl config use-context aksdev"
alias kb.sc.test="kubectl config use-context akstest"
alias kb.sc.prod="kubectl config use-context aksprod-b"

alias docker="sudo docker"


# alias git.log="git log --graph --abbrev-commit --pretty=oneline | bat --file-name='Git log' --theme=Nord"
alias git.log="git log --graph --abbrev-commit --pretty=oneline | bat --file-name='Git log' --theme=OneHalfDark"

# AZ CLI stuffs
alias az.sub.show="az account show --output table"
alias az.sub.list="az account list --output table"
alias az.sub.switch="az account list | jq -r '.[].name' | fzf | xargs --replace=\"{}\" az account set --subscription  \"{}\" && az.sub.show"
# alias az.sub.switch="az account list | jq '.[].name' | fzf | xargs az account set --subscription"
# alias az.sub.switch="az account list | jq -r '.[].name' | sort  | gum filter --limit 1 | xargs --replace=\"{}\" az account set --subscription  \"{}\" && az.sub.show"
az.git.clone() {
  project="$(az devops project list --organization="$AZ_ORGANIZATION" | jp --unquoted 'join(`"\n"`, value[].name)' | sort | fzf --tac )"
  echo "Project : $project"
  selectedRepo=$(az repos list --organization="$AZ_ORGANIZATION" --project "$project" --query="[].{Name:name, ssh:sshUrl}" -o table | tail -n +3 | sort |  fzf --tac | awk '{$1=$1};1')
  currentRepoName=$(echo "$selectedRepo" | cut -d' ' -f 1 )
  currentRepoSsh=$(echo "$selectedRepo" | cut -d' ' -f 2 )

  echo $currentRepoSsh
  git clone $currentRepoSsh
  cd "$currentRepoName"
}
