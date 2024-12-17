# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#
# [ -z "$TMUX"  ] && { tmux attach 2> /dev/null || tmux new-session && exit;}

#!/bin/sh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then

  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

 # zmodload zsh/zprof

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"


# history
HISTFILE=~/.zsh_history



# plugins
# plug "esc/conda-zsh-completion"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/vim"
plug "romkatv/powerlevel10k"
# plug "zap-zsh/fzf"
plug "zap-zsh/sudo"
plug "zsh-users/zsh-syntax-highlighting"
# plug "zdharma-continuum/fast-syntax-highlighting"
plug "Aloxaf/fzf-tab"
# plug "MichaelAquilina/zsh-you-should-use"
# plug "Freed-Wu/fzf-tab-source"

export ZSH_SYSTEM_CLIPBOARD_METHOD=xcc && plug "kutsan/zsh-system-clipboard"
plug "GianniBYoung/omz-take"

# plug "zap-zsh/zap-prompt"
# plug "zap-zsh/completions"
# # plug "zsh-users/zsh-history-substring-search"
# # plug "starship/starship"
# plug "conda-incubator/conda-zsh-completion"


plug "${ZDOTDIR}/aliases.zsh"
plug "${ZDOTDIR}/exports.zsh"
plug "${ZDOTDIR}/other.zsh"
plug "${ZDOTDIR}/custom_command.zsh"
plug "${ZDOTDIR}/evals.zsh"

bindkey -r "^P"
bindkey -r "^N"
bindkey -r "^F"

bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^F" autosuggest-accept
bindkey -v '^?' backward-delete-char
# (wal -r &)
# zprof

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


