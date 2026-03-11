# Default commands
alias du="du -h"
alias grep="grep --color"
alias cls="clear"
alias which="which -a"
alias rm="trash"
alias rmdir="trash -d"
alias cb="clipboard"
alias cp="cp -r"

# ls
alias l="eza -lAF --icons=always --group-directories-first --git"
alias ls="eza -F --icons=always --group-directories-first"
alias la="eza -AF --icons=always --group-directories-first"
alias tree="eza -T -F --icons=always --group-directories-first --git"
alias ptree="eza -T"

# config files
alias czsh="nvim ${ZDOTDIR}/.zshrc"
alias tmuxconf="nvim ~/.tmux.conf"
alias stmux="tmux source-file ~/.tmux.conf"
alias src="source"
alias szsh="source ${ZDOTDIR}/.zshrc"
alias alaconf="nvim ~/.config/alacritty/alacritty.toml"
alias ghostconf="nvim ~/.config/ghostty/config"
alias addali="nvim ${ZDOTDIR}/aliases.zsh"
alias i3conf="nvim ~/.config/i3/config"
alias zelconf="nvim ~/.config/zellij/config.kdl"
alias aeconf="nvim ~/.config/aerospace/aerospace.toml"

# python
alias python="python3"
alias pip="pip3"
alias dir="dir --color"

# nvim
alias nvc="cd ~/.config/nvim"
alias nvchad="NVIM_APPNAME='nvchad' nvim"
alias nv="nvim"
alias vf='fzf_output=$(fzf --height 40% --reverse --preview "batcat --style=numbers --color=always {}"); if [ -n "$fzf_output" ]; then nvim "$fzf_output"; fi'

# fun commands
alias bye="exit"
alias cya="shutdown -h now"
alias huhu="echo -e \"It's okay bro! \nYou are doing great! \nKeep going! \nTrust the process!\""


# Wifi
alias wifi-connect="nmcli d wifi connect" #<tab>
alias wifi-disconnect="nmcli d disconnect" #<tab>
alias wifi="nmcli d wifi list"

alias lg="lazygit"
