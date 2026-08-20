#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# The image sources ~/.zshrc.d/*.zsh after its own aliases. Prefix 99 so
# personal aliases win on name clashes without replacing the image file.
mkdir -p "${HOME}/.zshrc.d"
ln -sfn "${DOTFILES_DIR}/.zshrc.d/personal-aliases.zsh" \
  "${HOME}/.zshrc.d/99-personal-aliases.zsh"

# Cursor user tasks: Gitpod-style named tabs on folder open.
# First time: Command Palette -> "Tasks: Manage Automatic Tasks" -> Allow.
mkdir -p "${HOME}/.cursor-server/data/User" "${HOME}/.local/bin"
chmod +x "${DOTFILES_DIR}/scripts/keep-tab.sh"
ln -sfn "${DOTFILES_DIR}/scripts/keep-tab.sh" \
  "${HOME}/.local/bin/keep-devenv-tab"
ln -sfn "${DOTFILES_DIR}/cursor/User/tasks.json" \
  "${HOME}/.cursor-server/data/User/tasks.json"
