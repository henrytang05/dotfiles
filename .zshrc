#!usr/bin/env bash

source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

for conf in "$HOME/.zsh/config/"*.zsh; do
  source "${conf}"
done
unset conf
# clear; neofetch | lolcat; 

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"







fpath=(~/.zsh.d/ $fpath)
fpath=(~/.zsh.d/ $fpath)
fpath=(~/.zsh.d/ $fpath)
