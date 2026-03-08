# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever a new interactive
# Bash shell is started, whether in login (`-l`) or non-login mode.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
    *) return;;
esac

# Determine the directory of the current script.
# DIST_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine the directory of the current script, accounting for symbolic links.
DIST_PATH="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

# Load aliases that are compatible with all POSIX-compliant shells.
if [ -d "$DIST_PATH/aliases" ]; then
  for file in "$DIST_PATH/aliases"/*; do
    [ -f "$file" ] && . "$file"
  done
fi

# Load utility functions that are compatible with all POSIX-compliant shells.
if [ -d "$DIST_PATH/functions" ]; then
  for file in "$DIST_PATH/functions"/*; do
    [ -f "$file" ] && . "$file"
  done
fi

# Load command line completions for Bash.
if [ -d "$DIST_PATH/completions" ]; then
  for file in "$DIST_PATH/completions"/*; do
    [ -f "$file" ] && . "$file"
  done
fi

# Add ~/bin to PATH, allowing additional autoloadable binaries to be
# installed directly in ~/bin. Takes priority over other paths. (This directory
# is optional, and it needs to be created by the user, if it does not already
# exist.)
if [ -d ~/bin ] ; then
  PATH="${HOME}/bin:$PATH"
fi

# Alternative path to the user's private binaries.
if [ -d "${HOME}/.local/bin" ] ; then
  PATH="${HOME}/.local/bin:$PATH"
fi

# Load the user's `~/local.bashrc` file. This file can be used to override
# and extend the configuration in this file.
if [ -f ~/local.bashrc ]; then
  . ~/local.bashrc
fi

# Add an alias to reload this script, which is useful when making any
# changes to either the symlinked `global.bashrc` (when making changes to this
# repository) or the `~/local.bashrc` file (when making changes to the user's
# local configuration).
alias reload!=". ~/.bashrc"
