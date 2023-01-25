# ------------------------------------------------------------------------------
# The `~/.bash_profile` file is a user-scoped startup script for interative
# logins to the Bash shell. In Bash, this overrides `~/.profile` and
# `~/.bash_login`.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/.local.bash_profile` file.
# -----------------------------------------------------------------------------

# Load the startup script for all shells, to capture our POSIX-compliant
# shell configurations which are intended to be shared by all shells.
#
if [ -f ~/.profile ]; then
  source ~/.profile
fi

# Load the user's `~/.local.bash_profile` file, which can be used to override
# anything set in this file.
#
if [ -f ~/.local.bash_profile ]; then
  source ~/.local.bash_profile
fi

# Load the main `~/.bashrc` file, to ensure a consistent environment between
# interactive login and interactive non-login Bash shells.
#
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

# Add an alias to reload this script. This will override the alias
# of the same name included in `~/.profile`.
#
alias reload!="source ~/.bash_profile"
