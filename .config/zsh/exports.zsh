export FUNCNEST=100000
export EDITOR=$HOME/.local/bin/nvim
export VISUAL=$HOME/.local/bin/nvim
export STARSHIP_CONFIG=~/.config/starship.toml
# export TERM=screen-256color
# export ZSH_TMUX_AUTOSTART=true
export TERM=xterm-256color
# export PATH="$PATH:/opt/nvim-linux64/bin" # nvim
export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin:$HOME/.local/nvim-linux64/bin:$HOME/node_modules/.bin/
export PATH="$PATH:/opt/nvim-linux64/bin"
# export PATH="$PATH:/home/huytang/anaconda3/bin"
# export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# export ZSH_AUTOSUGGEST_USE_ASYNC=true

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

export PNPM_HOME="/home/huytang/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

export MANPATH=/home/huytang/.local/share/man:$MANPATH
# export HISTFILE=~/.cache/zsh/history
# export ZDOTDIR=$HOME/.cache/zsh/dot/

#
# export VI_MODE_SET_CURSOR=true
# export ZOXIDE_CMD_OVERRIDE="cd"
# export VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
#
# export VI_MODE_CURSOR_NORMAL=2
# export VI_MODE_CURSOR_VISUAL=6
# export VI_MODE_CURSOR_INSERT=6
# export VI_MODE_CURSOR_OPPEND=4


export ZELLIJ_AUTO_ATTACH=true
export ZELLIJ_AUTO_EXIT=true
export PATH=$PATH:$HOME/.config/i3/i3-battery-popup
export BAT_THEME="Catppuccin Mocha"
