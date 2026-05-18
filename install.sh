#!/bin/sh

# ==============================================================================
# Thin wrapper that delegates to `run/install`.
#
# This file exists solely so that GitHub Codespaces' dotfiles auto-discovery
# (which only looks for a fixed set of filenames at the repo root, such as
# `install.sh`) can find and execute the installer. For manual invocation,
# prefer running `./run/install` directly.
# ==============================================================================

DIR_PATH=$(dirname "$(readlink -f "$0")")
exec sh "${DIR_PATH}/run/install" "$@"
