#!/bin/sh

 # zmodload zsh/zprof

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"


# history
HISTFILE=~/.zsh_history

# source
plug "${ZDOTDIR}/aliases.zsh"
plug "${ZDOTDIR}/exports.zsh"
plug "${ZDOTDIR}/other.zsh"
plug "${ZDOTDIR}/custom_command.zsh"


# plugins
# plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/zap-prompt"
# plug "zap-zsh/atmachine" 
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
# plug "zdharma-continuum/fast-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
# plug "starship/starship"
plug "Aloxaf/fzf-tab"



plug "${ZDOTDIR}/evals.zsh"
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^f' autosuggest-accept
# zprof
