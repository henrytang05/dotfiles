# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
# Default plugs
# plug "wintermi/zsh-starship"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

plug "zap-zsh/sudo"
plug "hlissner/zsh-autopair"
# plug "jeffreytse/zsh-vi-mode"
plug "zap-zsh/vim"
plug "Freed-Wu/fzf-tab-source"
plug "Aloxaf/fzf-tab"
plug "wintermi/zsh-brew"
# clipboard paste
export ZSH_SYSTEM_CLIPBOARD_METHOD=pb && plug "kutsan/zsh-system-clipboard"

plug "${ZDOTDIR}/aliases.zsh"
plug "${ZDOTDIR}/exports.zsh"
plug "${ZDOTDIR}/custom_command.zsh"
plug "${ZDOTDIR}/evals.zsh"

bindkey -v '^?' backward-delete-char

# Load and initialise completion system
autoload -Uz compinit
compinit -d "${ZHIDDEN}/.zcompdump"



fastfetch | lolcat
