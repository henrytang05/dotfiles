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

funvocab() {
    cd ~/Personal/Cpp/learn
    make run
}

