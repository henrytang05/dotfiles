# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

 ZSH_CONFIG="${HOME}/.config/zsh"
 source "${ZSH_CONFIG}/env_var.zsh"
source "${ZSH_CONFIG}/aliases.zsh" 
source "${ZSH_CONFIG}/other_conf.zsh"
source "${ZSH_CONFIG}/custom_command.zsh"
# Set the GPG_TTY to be the same as the TTY, either via the env var
# or via the tty command.

# SSH_AUTH_SOCK set to GPG to enable using gpgagent as the ssh agent.

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"
#
# # Load using the for-syntax
# # zinit lucid wait for \
# #   "some/plugin"
# #
# # zinit lucid wait for \
# #   "other/plugin"
#
# zinit wait lucid for \
#  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#     zdharma-continuum/fast-syntax-highlighting \
#  blockf \
#     zsh-users/zsh-completions \
#  atload"!_zsh_autosuggest_start" \
#     zsh-users/zsh-autosuggestions \

# zinit light jeffreytse/zsh-vi-mode
# atclone"local P=${${(M)OSTYPE:#*darwin*}:+g}
#         \${P}sed -i \
#         '/DIR/c\DIR 38;5;63;1' LS_COLORS; \
#         \${P}dircolors -b LS_COLORS > c.zsh" \
# atpull'%atclone' pick"c.zsh" nocompile'!' \
# atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”' \
#     trapd00r/LS_COLORS

zinit light Aloxaf/fzf-tab

# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#           atpull"%atclone" src"init.zsh"
zinit light starship/starship

#
#
# # Add in snippets

# # autoload -Uz _zinit
# # (( ${+_comps} )) && _comps[zinit]=_zinit
#
# # autoload -Uz compinit
# # for dump in ~/.zcompdump(N.mh+24); do
# #   compinit
# # done
# # compinit -C
#
export DISABLE_AUTO_UPDATE=true
#
# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#
# # Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
#
zle_highlight+=(paste:none)
#
# # History
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

#
# # Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
