# Dotfiles 👻

These dotfiles are easier to set up manually than through `setup.sh`. Use the steps below to bootstrap a new machine.

## Installation Steps

### 1. Install Xcode Command Line Tools

To begin, we need the Xcode command line tools for Git etc.

```bash
xcode-select --install
```

### 2. Configure the Shell

We use [Oh My Zsh](https://ohmyz.sh/#install) to manage our shell configuration.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

We need to create a new `.zshrc`, source the shell configuration in the repo and link to the custom, spooky theme.

```bash
ROOT=~/Git/dotfiles
echo 'source ~/Git/dotfiles/zsh/zsh.sh' >> ~/.zshrc

ln -s "~/Git/dotfiles/zsh/jack.zsh-theme" ~/.oh-my-zsh/themes/jack.zsh-theme
```

### 3. Set up SSH Keys and Git

Create an SSH key and add it to your GitHub account.

```bash
ssh-keygen -t ed25519 -C "<your-name>@foobar.org"

eval "$(ssh-agent -s)"

ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
```

Paste the copied public key into GitHub under "SSH and GPG keys".

### 4. Clone the Repo

The repo assumes it lives in `~/Git/dotfiles`.

```bash
mkdir ~/Git

git clone git@github.com:jackdavis/dotfiles.git ~/Git/dotfiles

cd ~/Git/dotfiles
```

### 5. Link the Shared Config Files

Create symlinks for the shared config files.

```bash
ROOT=~/Git/dotfiles
mkdir ~/.vim

ln -s $ROOT/config ~/.config
ln -s $ROOT/gnupg ~/.gnupg
ln -s $ROOT/vim/.vimrc ~/.vimrc
ln -s $ROOT/vim/UltiSnips ~/.vim/UltiSnips
```

### 6. Install Homebrew

Install Homebrew and all the applications listed in `./Brewfile`.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle install
```

This gives Git access to `~/.config/.gitignore`, adds the checked-in GPG agent config, and wires up the Vim config and snippets.

### 7. Configure Git

We want our commits to be signed by a GPG key. Either import an existing key or create a new one.

The checked-in Git config is `git/.gitconfig`. Copy it into place, then set your identity and signing key.

```bash
cp "$ROOT/git/.gitconfig" ~/.gitconfig

git config --global user.name "Your Name"
git config --global user.email "<your-name>@foobar.com"
git config --global user.signingkey "YOUR_GPG_KEY_ID"
```

The Git config also includes a reference to a personal config file, `~/.personal.gitconfig`. This allows commits in personal projects stored in `~/Git/me/` to be signed with your personal details.

### 8. Complete GPG Setup

The repo includes `gnupg/gpg-agent.conf`, which points to Homebrew's `pinentry-mac`:

```conf
pinentry-program /opt/homebrew/bin/pinentry-mac
```

After linking the directory, reload the agent if needed:

```bash
gpgconf --kill gpg-agent
```

### 9. Install TypeScript Tooling

Install `nvm`, then install Node.js and the global packages used by this setup.

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

nvm install node

npm i -g prettier typescript yarn
```

We also use Bun.

```bash
curl -fsSL https://bun.sh/install | bash
```

### 10. Install Docker

Install Docker Desktop from the [Docker website](https://docs.docker.com/desktop/setup/install/mac-install).

### 11. Vim

All of the above should mean that Vim is now ready to be set up (this almost certainly isn't the case but it's a good time to have a go). 

Open Vim and run `:PlugInstall`. Any and all required language servers _should_ have already been installed earlier and be available to Vim and the Ale client.
