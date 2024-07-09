# disable caplock
# map caplock to escape
# other options are: none, super ...
# gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
setxkbmap -option caps:escape
#
# # p paste from clipboard
# vi-append-x-selection () { RBUFFER=$(xsel -o -p </dev/null)$RBUFFER; }
# zle -N vi-append-x-selection
# bindkey -a '^X' vi-append-x-selection
# vi-yank-x-selection () { print -rn -- $CUTBUFFER | xsel -i -p; }
# zle -N vi-yank-x-selection
# bindkey -a '^Y' vi-yank-x-selection
#

# # vi mode
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#
# autoload -U colors && colors
# fpath+=${ZDOTDIR:-~}/.zsh_functions
#
# Disable fn key
# echo 0 |sudo tee /sys/module/hid_apple/parameters/fnmode
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# <<< conda initialize <<<

