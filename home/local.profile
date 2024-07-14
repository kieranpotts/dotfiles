# ==============================================================================
# You MAY edit this file to extend the `~/.profile` startup script, the content
# of which is managed via the dotfiles repository. All commands in this script
# MUST be POSIX-compliant and shell-agnostic.
#
# All commands in this script MUST be POSIX-compliant and shell-agnostic.
# ==============================================================================

# Change to `0` to apply `--no-verify` flag to aliased `git commit` operations.
export X_GIT_COMMIT_VERIFY=1

# Load this repository's bin directory into the system PATH. This makes
# available the Git aliases and other scripts defined in this directory.
if [ -d "$HOME/dotfiles/bin" ] ; then
  PATH="$PATH:$HOME/dotfiles/bin"
fi

# Add ~/bin to PATH. Enable this if you want to install additional binaries,
# on a per-machine basis, directly in ~/bin.
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi
