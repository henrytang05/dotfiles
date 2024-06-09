alias nvim="~/.local/bin/nvim"
alias du="du -h"
alias bat="batcat"
alias cls="clear"
alias which="which -a"
# alias grep="grep --color=auto"
alias rm="trash"
alias rmdir="trash -d"
alias cb="clipboard"

alias l="eza -lAF --icons=always"
alias ls="eza -F --icons=always"
alias la="eza -AF --icons=always"
alias czsh="nvim ~/.zshrc"
alias tmuxconf="nvim ~/.tmux.conf"
alias stmux="tmux source-file ~/.tmux.conf"
alias src="source"
alias szsh="source ~/.zshrc"
alias bashrc="nvim ~/.bashrc"


alias python="python3"
alias pip="pip3"


alias dir="dir --color"
# if command -v colorls > /dev/null 2>&1; then
    # alias ll="colorls -Alh"
    # alias ls="colorls -Ah"
# else
# alias ll="ls -Alh"
# alias ls="ls -Ah"
# fi
alias icat="kitty +kitten icat"
alias kt="kitty +kitten"

alias nvc="cd ~/.config/nvim"
alias nv="nvim"

alias nnn="nnn -e"

alias fzf="fzf --preview 'batcat --color=always {}'"


export PERSONAL="~/Personal"
alias per="cd $PERSONAL"

alias nvim-chad="NVIM_APPNAME=NvChad nvim"

# bindkey "	" autosuggest-accept
# bindkey '^I' complete-word
# bindkey "^E" end-of-line


bindkey -r '^v'

alias vf='fzf_output=$(fzf --height 40% --reverse --preview "batcat --style=numbers --color=always {}"); if [ -n "$fzf_output" ]; then nvim "$fzf_output"; fi'
# alias vi='nvim $(fzf --height 40% --reverse --preview "batcat --style=numbers --color=always {}")'
alias killfzf="top -l 1 -o cpu | sed 1,/^top/d | awk '{print \$1, \$12}' | fzf --height 40% --reverse --multi | awk '{print \$1}' | xargs kill"
alias yolo="git commit -m "$(curl -s https://whatthecommit.com/index.txt)""
alias bye="exit"
alias cya="shutdown -h now"
alias gimmeh="touch"
alias huhu="echo -e \"It's okay bro! \nYou are doing great! \nKeep going! \nTrust the process!\""
alias fucku="fuck --yeah"
alias alaconf="nvim ~/.config/alacritty/alacritty.toml"
alias addali="nvim ~/.zsh/config/aliases.zsh"
alias copilot="gh copilot"
