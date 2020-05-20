ROOT=~/Git/dotfiles

function setup_vim {
  mkdir ~/.vim
  
  ln -s $ROOT/config .config
  ln -s $ROOT/vim/.vimrc .vimrc
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

function setup {
  setup_vim
  setup_zsh
  setup_brew
}

setup


