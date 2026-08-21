#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="${GITPOD_REPO_ROOT:-/workspace/quizlet-web}"

# The image sources ~/.zshrc.d/*.zsh after its own aliases. Prefix 99 so
# personal aliases win on name clashes without replacing the image file.
mkdir -p "${HOME}/.zshrc.d"
ln -sfn "${DOTFILES_DIR}/.zshrc.d/personal-aliases.zsh" \
  "${HOME}/.zshrc.d/99-personal-aliases.zsh"

# Terminal Keeper reads .vscode/sessions.json in the workspace. Keep the
# real file in these dotfiles and hide the workspace path from git.
mkdir -p "${REPO_ROOT}/.vscode"
ln -sfn "${DOTFILES_DIR}/cursor/sessions.json" \
  "${REPO_ROOT}/.vscode/sessions.json"
EXCLUDE="${REPO_ROOT}/.git/info/exclude"
mkdir -p "$(dirname "${EXCLUDE}")"
if ! grep -qxF '.vscode/sessions.json' "${EXCLUDE}" 2>/dev/null; then
  echo '.vscode/sessions.json' >> "${EXCLUDE}"
fi

if command -v cursor >/dev/null 2>&1; then
  cursor --install-extension nguyenngoclong.terminal-keeper >/dev/null 2>&1 || true
fi

# Flags live in Cursor machine settings so the extension does not rewrite
# "active" into sessions.json. Merge; do not replace the file.
python3 - "${HOME}/.cursor-server/data/Machine/settings.json" << 'PY'
import json
import pathlib
import sys

path = pathlib.Path(sys.argv[1])
path.parent.mkdir(parents=True, exist_ok=True)
data = {}
if path.exists() and path.stat().st_size:
    data = json.loads(path.read_text())
data["terminal-keeper.activateOnStartup"] = True
data["terminal-keeper.active"] = "default"
data["terminal-keeper.keepExistingTerminals"] = True
path.write_text(json.dumps(data, indent=2) + "\n")
PY
