# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever the `bash` command is
# run in non-login mode (ie without the `-l` parameter).
#
# This file also sources `~/.bash_profile`, ensuring a consistent environment
# in all Bash sessions, ie when Bash is running in either of the interative
# login or interative non-login modes.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# Load the main `~/.bash_profile` file, to ensure a consistent environment
# between interactive login and interactive non-login terminal sessions.
if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

# Load the user's `~/local.bashrc` file.
if [ -f ~/local.bashrc ]; then
  source ~/local.bashrc
fi
