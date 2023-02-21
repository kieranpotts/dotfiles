# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever the `bash` command is
# used to run a script from a terminal interface, so temporarily spawing an
# interative non-login shell.
#
# This file is also sourced from `~/.bash_profile`, ensuring a consistent
# environment in all Bash terminals (ie when Bash is running in either of the
# interative login and interative non-login modes).
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# Load the user's `~/local.bashrc` file.
#
if [ -f ~/local.bashrc ]; then
  source ~/local.bashrc
fi
