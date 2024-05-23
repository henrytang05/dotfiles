# disable caplock
# map caplock to escape
# other options are: none, super ...
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
setxkbmap -option caps:escape
# vi mode
bindkey -v
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# autoload -U colors && colors
# fpath+=${ZDOTDIR:-~}/.zsh_functions

# # Disable fn key
# echo 0 |sudo tee /sys/module/hid_apple/parameters/fnmode
