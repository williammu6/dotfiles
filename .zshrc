export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

alias tas="tmux attach-session -t"
alias tns="tmux new -s"
