# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever a new Bash shell is
# started, whether in login (`-l`) or non-login mode.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# Load the user's `~/local.bashrc` file.
if [ -f ~/local.bashrc ]; then
  . ~/local.bashrc
fi

# Add an alias to reload this script, which is useful when making any
# changes to it.
alias reload!=". ~/.bashrc"
