# DEBUG MODE
# zmodload zsh/zprof

# If you come from bash you might have to change your $PAT
export PATH=$HOME/bin:/usr/local/bin:$PATH

export KUBECONFIG=/mnt/c/Users/$WINDOWSUSER/.kube/config

export JAVA_HOME=/usr/lib/jvm/java-17-temurin

# Path to your oh-my-zsh installation.
export ZSH="/home/lefrancoisc/.oh-my-zsh"

# export FZF_BASE=/usr/bin
export FZF_BASE=/usr/share/fzf
export DISABLE_FZF_KEY_BINDINGS=false

export HISTFILE=/home/lefrancoisc/.zsh_history

### ZSh-related aliases
alias zshUpdatePlugins="antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh"

DISABLE_AUTO_TITLE="true"

HIST_STAMPS="yyyy-mm-dd"

DISABLE_LS_COLORS="true"

# Loaded Plugins
plugins=(
  git
  kubectl
  systemd
  gradle
  safe-paste
  colored-man-pages
  python
  history
  docker
  archlinux
  npm
  sudo
  ng
  fzf
  # gradle-completion
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
 fi


export PATH=$PATH:~/bin


if [[ $ZSH_VERSION == 3.<->* ]]; then
  which zmodload >&/dev/null && zmodload zsh/compctl
  compctl -c sudo
  compctl -c which
  compctl -g '*(-/)' + -g '.*(-/)' -v cd pushd rmdir
  compctl -k hosts -x 'p[2,-1]' -l '' -- rsh ssh
  return 0
fi


setopt MENU_COMPLETE AUTO_CD AUTO_PARAM_KEYS
setopt always_to_end
setopt complete_in_word
setopt PROMPT_SUBST

HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history


zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'


# Aliases
source ~/.aliases.sh
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshUpdatePlugins="antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh"

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

#
# Azure cli autocomplete#
autoload -U +X bashcompinit && bashcompinit
[[ -s $HOME/lib/azure-cli/az.completion ]] && source $HOME/lib/azure-cli/az.completion

# source < (antibody init)
[[ -s $HOME/.zsh_plugins.sh ]] && source $HOME/.zsh_plugins.sh

#########
#  FZF  #
#########

export FZF_DEFAULT_OPTS="--exact"
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
# . /etc/profile.d/fzf.zsh

## yazi (File manager/browser)
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# bindkey -v
bindkey 'e[8~' end-of-line
bindkey 'e[7~' beginning-of-line

bindkey -s '^o' 'nvim $(fzf)\n'

#### Man pages
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


# [ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && source /usr/share/doc/pkgfile/command-not-found.zsh


# command_not_found_handler() {
#   local pkgs cmd="$1" files=()
#   printf 'zsh: command not found: %s\n' "$cmd" # print command not found asap, then search for packages
#   files=(${(f)"$(/usr/bin/yay -F --machinereadable "${cmd}")"})
#   if (( ${#files[@]} )); then
#     printf '\r%s may be found in the following packages:\n' "$cmd"
#     local res=() repo package version file
#     for file in "$files[@]"; do
#       res=("${(0)file}")
#       repo="$res[1]"
#       package="$res[2]"
#       version="$res[3]"
#       file="$res[4]"
#       printf '  %s/%s %s: /%s\n' "$repo" "$package" "$version" "$file"
#     done
#   else
#     printf '\n'
#   fi
#   return 127
# }

# wsl.exe -d wsl-vpnkit --cd /app service wsl-vpnkit start
eval "$(mcfly init zsh)"
eval "$(starship init zsh)"

[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

# Load Angular CLI autocompletion.
# source <(ng completion script)

# ZSH DEBUG MODE
# zprof
