alias du="du -h"
alias bat="batcat"
alias cls="clear"
alias which="which -a"
alias grep="grep --color=auto"
alias rm="trash"
alias rmdir"trash -d"
alias cb="clipboard"

alias czsh="nvim ~/.zshrc"
alias src="source"
alias szsh="source ~/.zshrc"
alias bashrc="nvim ~/.bashrc"


alias python="python3"
alias pip="pip3"


alias dir="dir --color"
# if command -v colorls > /dev/null 2>&1; then
    alias ll="colorls -Alh"
    alias ls="colorls -Ah"
# else
# alias ll="ls -Alh"
# alias ls="ls -Ah"
# fi
alias icat="kitty +kitten icat"
alias kt="kitty +kitten"

alias nvc="cd ~/.config/nvim"
alias nv="/snap/bin/nvim"

alias nnn="nnn -e"

alias fzf="fzf --preview 'batcat --color=always {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias cdf="fcd"

export PERSONAL="~/Personal"
alias per="cd $PERSONAL"

alias nvim-chad="NVIM_APPNAME=NvChad nvim"

# bindkey "	" autosuggest-accept
# bindkey '^I' complete-word
# bindkey "^E" end-of-line


bindkey -r '^v'

alias v="find . -type f | fzf --height 40% --reverse --preview 'batcat --style=numbers --color=always {}' | xargs nvim"
alias killfzf="top -l 1 -o cpu | sed 1,/^top/d | awk '{print \$1, \$12}' | fzf --height 40% --reverse --multi | awk '{print \$1}' | xargs kill"
