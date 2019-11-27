export ZSH=/Users/jackdavis/.oh-my-zsh

ZSH_THEME="jack"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

function init_fzf {
  export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi --inline-info --layout=reverse"

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  bindkey '^r' fzf-history-widget
  bindkey '^t' fzf-file-widget
}

function path {
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  export PATH=~/Library/Python/3.7/bin/:$PATH

  # Setting PATH for Python 3.6
  # The original version is saved in .zprofile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
}

function nvm {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

export TERM='xterm-256color'
export CDPATH=.:~/Git
export KEYTIMEOUT=1

alias ag='ag -p ~/.ignore'
alias ls="ls -lrthaG"
alias ni="npm install"
alias nr="npm run "

alias cn="cargo new "
alias cr="cargo run "
alias ct="cargo test "

path
init_fzf
nvm
