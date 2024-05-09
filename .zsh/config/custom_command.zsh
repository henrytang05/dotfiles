
fcd() {
    local selected_dir
    selected_dir=$(find * -type d -name '.*' -o ! -name '.*' 2>/dev/null | fzf +m) # Use find to list directories
    if [ -n "$selected_dir" ]; then
        cd "$selected_dir" || return 1
    fi
}
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


