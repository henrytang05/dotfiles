export GOOGLE_API_KEY="AIzaSyANAa654zj2ATsqTOHF-DW3qb-f5RXo6-I"
export FUNCNEST=1000
export EDITOR=/snap/bin/nvim 
export VISUAL=/snap/bin/nvim
export STARSHIP_CONFIG=~/.config/starship.toml
# export TERM=screen-256color
export TERM=xterm-256color
# export PATH="$PATH:/opt/nvim-linux64/bin" # nvim
export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.local/nvim-linux64/bin
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export ZSH_AUTOSUGGEST_USE_ASYNC=true

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export PNPM_HOME="/home/huytang/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export MANPATH=/home/huytang/.local/share/man:$MANPATH
export HISTFILE=~/.cache/zsh/history
if [ -z "$ZSH_COMPDUMP" ]; then

export ZSH_COMPDUMP="~/.cache/zsh/zcompdump" 

fi 
