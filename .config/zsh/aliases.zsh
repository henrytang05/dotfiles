alias nvim="~/.local/bin/nvim"
alias du="du -h"
alias bat="batcat"
alias grep="grep --color"
alias cls="clear"
alias which="which -a"
alias rm="trash"
alias rmdir="trash -d"
alias cb="clipboard"
# alias cp="cp - r"
#
alias l="eza -lAF --icons=always --group-directories-first --git"
alias ls="eza -F --icons=always --group-directories-first"
alias la="eza -AF --icons=always --group-directories-first"
alias tree="eza -T -F --icons=always --group-directories-first --git"
alias czsh="nvim ${ZDOTDIR}/.zshrc"
alias tmuxconf="nvim ~/.tmux.conf"
alias stmux="tmux source-file ~/.tmux.conf"
alias src="source"
alias szsh="source ${ZDOTDIR}/.zshrc"


alias python="python3"
# alias pip="pip3"
#
#
alias dir="dir --color"
# alias icat="kitty +kitten icat"
# alias kt="kitty +kitten"
#
alias nvc="cd ~/.config/nvim"
alias nv="nvim"
#
alias nnn="nnn -e"
#
alias fzf="fzf --preview 'batcat --color=always {}'"
#
#
# export PERSONAL="~/Personal"
# alias per="cd $PERSONAL"
#
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias dvim="NVIM_APPNAME=DreamOfCode nvim"

# # bindkey "	" autosuggest-accept
# # bindkey '^I' complete-word
# # bindkey "^E" end-of-line
#
#
# bindkey -r '^v'
#
alias vf='fzf_output=$(fzf --height 40% --reverse --preview "batcat --style=numbers --color=always {}"); if [ -n "$fzf_output" ]; then nvim "$fzf_output"; fi'
# alias yolo="git commit -m "$(curl -s https://whatthecommit.com/index.txt)""
alias bye="exit"
alias cya="shutdown -h now"
alias huhu="echo -e \"It's okay bro! \nYou are doing great! \nKeep going! \nTrust the process!\""
alias alaconf="nvim ~/.config/alacritty/alacritty.toml"
alias addali="nvim ${ZDOTDIR}/aliases.zsh"
alias i3conf="nvim ~/.config/i3/config"
# alias copilot="gh copilot"
# bindkey '^ ' autosuggest-accept


# Wifi
alias wifi-connect="nmcli d wifi connect" #<tab>
alias wifi-disconnect="nmcli d disconnect" #<tab>
alias wifi="nmcli d wifi list"
alias zelconf="nvim ~/.config/zellij/config.kdl"

