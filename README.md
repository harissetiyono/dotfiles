# 🛠️ Dotfiles — Minimalist Setup for Productive Developers

This repository contains my personal configuration for:

- ✨ [Aerospace](https://github.com/nikitabobko/AeroSpace) — AeroSpace is an i3-like tiling window manager for macOS
- 🐱 [Kitty](https://sw.kovidgoyal.net/kitty/) — Fast, GPU-powered terminal
- 🧠 [Neovim](https://neovim.io/) — Configured with LazyVim for modern development
- 🔧 [Tmux](https://github.com/tmux/tmux) — Terminal multiplexer with a custom statusline

> ⚠️ These configs are opinionated and optimized for speed, keyboard-centric workflows, and aesthetic minimalism.

---

## 🚀 Installation

Clone the repo and symlink what you need:

```bash
git clone https://github.com/harissetiyono/dotfiles.git ~/.dotfiles

# Example: Set up kitty
ln -s ~/.dotfiles/kitty ~/.config/kitty

# Set up Neovim (with LazyVim starter)
mv ~/.config/nvim ~/.config/nvim.bak
ln -s ~/.dotfiles/nvim ~/.config/nvim

# Set up tmux
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Aerospace (Wayland only)
ln -s ~/.dotfiles/aerospace ~/.config/aerospace


```
