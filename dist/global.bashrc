# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever a new interactive
# Bash shell is started, whether in login (`-l`) or non-login mode.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# Determine the directory of the current script.
# DIR_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Determine the directory of the current script, accounting for symbolic links.
DIR_PATH="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

# Load aliases that are compatible with all POSIX-compliant shells.
if [ -d "$DIR_PATH/aliases" ]; then
  . "$DIR_PATH/aliases/cd.sh"
  . "$DIR_PATH/aliases/git.sh"
  . "$DIR_PATH/aliases/grep.sh"
  . "$DIR_PATH/aliases/ls.sh"
  . "$DIR_PATH/aliases/mkdir.sh"
  . "$DIR_PATH/aliases/nvim.sh"
  . "$DIR_PATH/aliases/rm.sh"
  . "$DIR_PATH/aliases/sudo.sh"
fi

# Load utility functions that are compatible with all POSIX-compliant shells.
if [ -d "$DIR_PATH/functions" ]; then
  . "$DIR_PATH/functions/docker.sh"
fi

# Load this repository's bin directory into the system PATH. This makes
# available the Git aliases and other scripts defined in this directory.
if [ -d "$DIR_PATH/bin" ] ; then
  PATH="$PATH:$DIR_PATH/bin"
fi

# Add ~/bin to PATH, allowing additional autoloadable binaries to be
# installed directly in ~/bin. (This directory is optional, and it needs to be
# created by the user, if it does not already exist.)
if [ -d ~/bin ] ; then
  PATH="$PATH:~/bin"
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
