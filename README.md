# Dotfiles 👻

Use the steps below to bootstrap a new machine.

## Installation Steps

### 1. Configure the Terminal

To start, we need the Xcode command line tools, Homebrew and Oh My Zsh.

```bash
xcode-select --install

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Set up SSH Keys and Git

Create an SSH key and add it to your GitHub account.

```bash
ssh-keygen -t ed25519 -C "<your-name>@foobar.org"

eval "$(ssh-agent -s)"

ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
```

Paste the copied public key into GitHub under "SSH and GPG keys".

### 3. Clone the Repo

The repo assumes it lives in `~/Git/dotfiles`.

```bash
mkdir ~/Git

git clone git@github.com:jackdavis/dotfiles.git ~/Git/dotfiles

cd ~/Git/dotfiles
```

### 4. Link the Shared Config Files

Create symlinks for the shared config files.

```bash
ROOT=~/Git/dotfiles

mkdir -p ~/.config ~/.gnupg

# Config links
ln -s "$ROOT/config/.gitignore" ~/.config/.gitignore
ln -s "$ROOT/config/.ignore" ~/.config/.ignore
ln -s "$ROOT/config/bat" ~/.config/bat

ln -s "$ROOT/gnupg/gpg-agent.conf" ~/.gnupg/gpg-agent.conf

# Vim
mkdir -p ~/.vim
ln -s "$ROOT/vim/.vimrc" ~/.vimrc
ln -s "$ROOT/vim/UltiSnips" ~/.vim/UltiSnips

# Git
ln -s "$ROOT/git/.gitconfig" ~/.gitconfig

# Zsh 
echo 'source ~/Git/dotfiles/zsh/zsh.sh' >> ~/.zshrc
ln -s "$ROOT/zsh/jack.zsh-theme" ~/.oh-my-zsh/themes/jack.zsh-theme
```

### 5 Install Homebrew Packages

Use Homebrew to install all the packages listed in `./Brewfile`.

```sh
brew bundle install
```

### 6. Configure Git

We want our commits to be signed by a GPG key. Either import an existing key or create a new one.

The checked-in Git config is `git/.gitconfig`. Copy it into place, then set your identity and signing key.

```bash
git config --global user.name "Your Name"
git config --global user.email "<your-name>@foobar.com"
git config --global user.signingkey "YOUR_GPG_KEY_ID"
```

The Git config also includes a reference to a personal config file, `~/.personal.gitconfig`. This allows commits in personal projects stored in `~/Git/me/` to be signed with your personal details.

### 7. Complete GPG Setup

The repo includes `gnupg/gpg-agent.conf`, which points to Homebrew's `pinentry-mac`:

```conf
pinentry-program /opt/homebrew/bin/pinentry-mac

gpgconf --kill gpg-agent
```

### 8. Install TypeScript Tooling

Install `nvm`, then install Node.js and the global packages used by this setup.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

nvm install node

curl -fsSL https://bun.sh/install | bash

npm i -g prettier typescript yarn typescript-language-server
```

### 9. Install Docker

Install Docker Desktop from the [Docker website](https://docs.docker.com/desktop/setup/install/mac-install).

### 10. Vim

All of the above should mean that Vim is now ready to be set up (this almost certainly isn't the case but it's a good time to have a go). 

Open Vim and run `:PlugInstall`. Any and all required language servers _should_ have already been installed earlier and be available to Vim and the Ale client.
