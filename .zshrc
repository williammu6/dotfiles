export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/opt/llvm/bin:$PATH"

eval "$(pyenv init -)"


zle_highlight=('paste:none')

