# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever a new Bash shell is
# started, whether in login (`-l`) or non-login mode.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# Load aliases that are compatible with all POSIX-compliant shells.
if [ -f "$HOME/dotfiles/dist/aliases/index.sh" ]; then
  . "$HOME/dotfiles/dist/aliases/index.sh"
fi

# Load utility functions that are compatible with all POSIX-compliant shells.
if [ -f "$HOME/dotfiles/dist/functions/index.sh" ]; then
  . "$HOME/dotfiles/dist/functions/index.sh"
fi

# Load this repository's bin directory into the system PATH. This makes
# available the Git aliases and other scripts defined in this directory.
if [ -d "$HOME/dotfiles/bin" ] ; then
  PATH="$PATH:$HOME/dotfiles/bin"
fi

# Add ~/bin to PATH, allowing additional autoloadable binaries to be
# installed directly in ~/bin.
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# Load the user's `~/local.bashrc` file.
if [ -f ~/local.bashrc ]; then
  . ~/local.bashrc
fi

# Add an alias to reload this script, which is useful when making any
# changes to it.
alias reload!=". ~/.bashrc"
