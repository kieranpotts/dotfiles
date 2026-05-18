#!/bin/sh

#
# Thin wrapper that delegates to `run/install`.
#
# This file exists solely so that GitHub Codespaces will auto-discover
# this repository's dotfiles. Codespaces looks for a fixed set of filenames
# at the repository root, such as `install.sh`.
#
# For manual invocation, prefer running `./run/install` directly.
#

DIR_PATH=$(dirname "$(readlink -f "$0")")

exec sh "${DIR_PATH}/run/install" "$@"
