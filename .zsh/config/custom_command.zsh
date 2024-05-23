
loading() {
 while true
do
   for FG in '1;31m' '1;32m' '1;33m' '1;34m' '1;35m' '1;36m'
   do
          printf "$(echo -en "\033[${FG}")[%60s] 0\045\r" " "
          for ((i=1;i<=10;i++)) {
         sleep 0.15
         printf "$(echo -en "\033[${FG}")[%60s] $((i*10))\045\r" " "
         printf "$(echo -en "\033[${FG}")[%$((i*6))s\r" " " | tr ' ' '#'
          }
          echo -e "\n"
   done
done;
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# The fuck
[[ ! -a $ZSH_CACHE_DIR/thefuck ]] && thefuck --alias > $ZSH_CACHE_DIR/thefuck
source $ZSH_CACHE_DIR/thefuck

fuck-command-line() {
    local FUCK="$(THEFUCK_REQUIRE_CONFIRMATION=0 thefuck $(fc -ln -1 | tail -n 1) 2> /dev/null)"
    [[ -z $FUCK ]] && echo -n -e "\a" && return
    BUFFER=$FUCK
    zle end-of-line
}
zle -N fuck-command-line
# Defined shortcut keys: [Esc] [Esc]
bindkey -M emacs '\e\e' fuck-command-line
bindkey -M vicmd '\e\e' fuck-command-line
bindkey -M viins '\e\e' fuck-command-line
