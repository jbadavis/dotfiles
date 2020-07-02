# Set these!
EMAIL=
GPG_KEY= 

ROOT=~/Git/dotfiles

function setup_vim {
  mkdir ~/.vim
  
  ln -s $ROOT/config ~/.config
  ln -s $ROOT/vim/.vimrc ~/.vimrc
  ln -s $ROOT/vim/UltiSnips ~/.vim/UltiSnips
}

function setup_zsh {
  echo "source ~/Git/dotfiles/zsh/zsh.sh" >> ~/.zshrc
}

function setup_brew {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  brew install fd hub ripgrep gnupg
  brew install vim --HEAD
}

function setup_nvm {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  nvm install node

  npm i -g prettier typescript
}

function setup_git {
  cp $ROOT/git/.gitignore ~/.gitignore

  git config --global user.email $EMAIL
  git config --global user.signingkey $GPG_KEY
}

function setup {
  setup_vim
  setup_zsh
  setup_brew
  setup_nvm
  setup_git
}

setup
