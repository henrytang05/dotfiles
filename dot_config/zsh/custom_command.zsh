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

stfu () {
    eval "$(thefuck --alias)"
    alias fucku="fuck --yeah"
}

cdl () {
    cd $1 && eza -lAF --icons=always --group-directories-first --git
}

gimmeh (){
    mkdir $1 && cd $1
}

mf () {
    mv $(find . -maxdepth 1 -type f) $1
}

yolo () {
    git add .
    git commit -m "$(curl -s https://whatthecommit.com/index.txt)"
}

mfeh() {
    feh --auto-zoom --bg-fill $1
}

wifi-show() {
    nmcli device wifi show-password
}

take_git() {
  if [ -z "$1" ]; then
    echo "Usage: take_git <git_url>"
    return 1
  fi

  repo_name=$(basename "$1" .git)
  
  # Clone the repository
  git clone "$1" || return 1
  
  # Change directory into the repository
  cd "$repo_name" || return 1
  
  echo "Now in $(pwd)"
}

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

please() {
  if [[ $# -eq 0 ]]; then
    # No arguments -> run previous command with sudo
    eval "sudo $(fc -ln -1)"
  else
    # With arguments -> run normally with sudo
    command sudo "$@"
  fi
}
