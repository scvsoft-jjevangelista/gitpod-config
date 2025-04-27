#!/usr/bin/env bash
set -e
VSIX_PATH="$(dirname "$0")/../extensions/phpmigration-file-switcher-*.vsix"
code --install-extension "$VSIX_PATH"
