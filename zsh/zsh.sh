export ZSH=/Users/jackdavis/.oh-my-zsh

export ZSH_THEME="jack"

export plugins=(git gpg-agent)

source $ZSH/oh-my-zsh.sh

init_fzf() {
  export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi --inline-info --layout=reverse"

  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  bindkey '^r' fzf-history-widget
  bindkey '^t' fzf-file-widget

}

path() {
  export PATH="$HOME/bin:$PATH"
  export PATH="$HOME/.cargo/bin:$PATH"
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  export PATH=~/Library/Python/3.7/bin/:$PATH

  export PATH="/usr/local/bin/go:$PATH"
  export PATH="$HOME/go/bin:$PATH"

  # Setting PATH for Python 3.6
  # The original version is saved in .zprofile.pysave
  PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
}

nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

export TERM='xterm-256color'
export CDPATH=.:~/Git
export KEYTIMEOUT=1
export GPG_TTY=$(tty)

export DOCKER_DEFAULT_PLATFORM=linux/amd64

# Update once a week
export HOMEBREW_AUTO_UPDATE_SECS="604800"

alias ag='ag -p ~/.ignore'
alias ls="ls -lrthaG"
alias ni="npm install"
alias nr="npm run "

alias cn="cargo new "
alias cr="cargo run "
alias ct="cargo test "

bindkey -v

path
init_fzf
nvm
