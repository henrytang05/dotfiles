# disable caplock
# map caplock to escape
# other options are: none, super ...
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
setxkbmap -option caps:escape

# auto start tmux
# [ -z "$TMUX"  ] && { tmux attach 2> /dev/null || exec tmux new-session && exit; }
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
# __conda_setup="$('/home/huytang/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/huytang/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/huytang/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/huytang/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

