# zmodload zsh/zprof

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
  #
  # ZSH_CONFIG="${HOME}/.zsh/config"
  # source "${ZSH_CONFIG}/aliases.zsh"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
export DISABLE_AUTO_UPDATE=true
# source "${ZSH_CONFIG}/env_var.zsh"
# source "${ZSH_CONFIG}/aliases.zsh"


# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light Aloxaf/fzf-tab

# zinit snippet OMZP::web-search
# zinit snippet OMZP::command-not-found
# zinit snippet OMZP::safe-paste

# Load completions
# autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# source ~/.zsh-autopair/autopair.zsh
# autopair-init
# Shell integrations
# eval "$(fzf --zsh)"
# eval "$(zoxide init --cmd cd zsh)"
# eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
# eval $(thefuck --alias)
# eval "$(gh copilot alias -- zsh)"
# eval "$(starship init zsh)"

# zprof
