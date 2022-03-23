export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-completions
)

source $ZSH/oh-my-zsh.sh

alias tas="tmux attach-session -t"
alias tns="tmux new -s"

alias vim="nvim"

export PATH=/home/$USER/.config/nvcode/utils/bin:$PATH
export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
