#
# Please set these!
#

NAME="your name"
EMAIL="your email"
GPG_KEY="your key id"

ROOT=~/Git/dotfiles

setup_vim() {
  mkdir ~/.vim
  
  ln -s $ROOT/config ~/.config
  ln -s $ROOT/gnugpg ~/.gnugpg
  ln -s $ROOT/vim/.vimrc ~/.vimrc
  ln -s $ROOT/vim/UltiSnips ~/.vim/UltiSnips
}

setup_zsh() {
  echo "source ~/Git/dotfiles/zsh/zsh.sh" >> ~/.zshrc
}

setup_brew() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
  brew install fd hub ripgrep gnupg pinentry-mac
  brew install vim --HEAD
}

setup_node() {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  nvm install node

  npm i -g prettier typescript yarn
}

setup_git() {
  cp $ROOT/git/.gitignore ~/.gitignore

  git config --global user.name "$NAME"
  git config --global user.email "$EMAIL"
  git config --global user.signingkey "$GPG_KEY"
}

setup() {
  setup_vim
  setup_zsh
  setup_brew
  setup_git
  setup_node
}

setup
