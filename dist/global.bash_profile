# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091

#
# The `~/.bash_profile` file is a user-scoped startup script for interactive
# logins to the Bash shell. When starting an interactive login shell, Bash
# reads the first of `~/.bash_profile`, `~/.bash_login`, or `~/.profile` that
# it finds, in that order – so when `~/.bash_profile` exists, `~/.bash_login`
# and `~/.profile` are not sourced automatically.
#
# This file also sources `~/.bashrc`, ensuring a consistent environment in all
# Bash sessions, ie. whether Bash is running in interative login or interative
# non-login modes.
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bash_profile` file.
#

# Load the startup script for all shells, to capture our POSIX-compliant
# shell configurations, which are intended to be shared by all shells.
if [ -f ~/.profile ]; then
  . ~/.profile
fi

# Load the user's `~/local.bash_profile` file, which can be used to override
# and extend the configuration in this file.
if [ -f ~/local.bash_profile ]; then
  . ~/local.bash_profile
fi

# Load the user's `~/.bashrc` file, to ensure a consistent environment
# between interactive login and interactive non-login terminal sessions.
# For example, tmux loads `~/.bash_profile` but not `~/.bashrc`. This
# code ensures that the bash shell environments loaded within tmux are
# consistent with the bash shell environments loaded outside of tmux.
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
