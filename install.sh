#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# The image sources ~/.zshrc.d/*.zsh after its own aliases. Prefix 99 so
# personal aliases win on name clashes without replacing the image file.
mkdir -p "${HOME}/.zshrc.d"
ln -sfn "${DOTFILES_DIR}/.zshrc.d/personal-aliases.zsh" \
  "${HOME}/.zshrc.d/99-personal-aliases.zsh"
