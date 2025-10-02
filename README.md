# My `./dotfiles`

This repository contains my personal configuration files for my development environment.

---

## Packages to install

Some must commonly use packages.

```bash
# Base packages I use
sudo pacman -S --needed --noconfirm \
  neovim \
  tmux \
  git \
  stow \
  clang \
  kitty \
  python-pip \
  python-debugpy \
  valgrind \
  cmake \
  zsh \
  yazi \
  ffmpeg \
  p7zip \
  jq \
  poppler \
  fd \
  ripgrep \
  fzf \
  zoxide \
  resvg \
  imagemagick \
  ttf-jetbrains-mono-nerd \
  curl \
  unzip \
  man-db \
  man-pages \
  lazygit \
  htop \
  tree \
  bat \
  gdb

# NVIDIA drivers
sudo pacman -S --needed --noconfirm \
  nvidia \
  nvidia-utils \
  nvidia-settings

```

## Notes

- If you run into issues with tmux + tpm, try:

```bash
cd ~/.tmux/plugins/tpm/scripts && ./install_plugins.sh # helped for me
```

---

## Installation

```bash
git clone https://github.com/divolli/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```
