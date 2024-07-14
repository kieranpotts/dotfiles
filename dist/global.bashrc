# ==============================================================================
# The `~/.bashrc` file is automatically loaded whenever a Bash shell is spawned
# in non-login mode (ie without the `-l` parameter).
#
# You SHOULD NOT edit this file, as your changes here will be lost next time you
# fetch updates from the dotfiles repository. Instead, you MAY extend this
# script via the `~/local.bashrc` file.
# ==============================================================================

# Load the user's `~/local.bashrc` file.
if [ -f ~/local.bashrc ]; then
  . ~/local.bashrc
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
