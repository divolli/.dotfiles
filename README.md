# My `./dotfiles`

This repository contains my personal configuration files for my development environment.

---

## Installation

```bash
git clone https://github.com/divolli/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## Requirements

Make sure those are installed, I'll add more packages here.

```bash
nvim tmux tpm jetbrainsnerd-font-mono-semi-bold git stow
```

## Notes

- If you run into issues with tmux + tpm, try:

```bash
cd ~/.tmux/plugins/tpm/scripts && ./install_plugins.sh # helped for me
```
