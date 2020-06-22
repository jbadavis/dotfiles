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
  
  brew install fd hub ripgrep
  brew install vim --HEAD
}

function setup_nvm {
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  nvm install node
}

function setup {
  setup_vim
  setup_zsh
  setup_brew
  setup_nvm
}

setup
