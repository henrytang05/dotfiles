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

sconda () {
    __conda_setup="$('/home/huytang/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/huytang/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/huytang/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/huytang/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup

    plug "conda-incubator/conda-zsh-completion"

    fpath+=${HOME}/.local/share/zap/plugins/conda-zsh-completion
    compinit
}


linalg() {
    cd ~/Personal/jupyter; 
    sconda;
    conda activate LinAlg;
    # jupyter-lab;
}

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

show-wifi() {
    nmcli device wifi show-password
}
