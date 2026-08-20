#!/usr/bin/env bash
# Run a devenv tab command, then keep the VS Code task terminal alive.
# Gitpod leaves task tabs open after the command exits; Cursor closes them.
set -uo pipefail

if (($# > 0)); then
  "$@"
  echo
  echo "### exited $?; dropping into zsh"
fi
exec /usr/bin/zsh -l
