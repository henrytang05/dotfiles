
autopair-init

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
# eval "$(zellij setup --generate-auto-start zsh)"

# eval "$(oh-my-posh init zsh)"
# eval "$(thefuck --alias)"
eval "$(starship init zsh)"

. "$HOME/.local/bin/env"


. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"
eval $(thefuck --alias)
source ~/.venv/base/bin/activate
