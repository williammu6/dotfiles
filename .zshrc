export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git virtualenv)
source $ZSH/oh-my-zsh.sh


POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

unsetopt PROMPT_SP

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PYTHON_CONFIGURE_OPTS="--enable-framework"

alias work="cd ~/Documents/dimo/"
alias 4fun="cd ~/Documents/random"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
