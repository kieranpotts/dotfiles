# ==============================================================================
# You MAY edit this file to extend the `~/.bashrc` startup script, the
# content of which is managed via the dotfiles repository.
#
# Commands in this script MAY be dependent upon Bash-specific syntax and APIs.
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

# Add ~/bin to PATH. Enable this if you want to install additional binaries,
# on a per-machine basis, directly in ~/bin.
if [ -d "$HOME/bin" ] ; then
  PATH="$PATH:$HOME/bin"
fi

# Change to `0` to apply `--no-verify` flag to aliased `git commit` operations.
export X_GIT_COMMIT_VERIFY=1

# Load nvm at startup.
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Loads NVM
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Loads Bash completion for NVM

# Change to a specific directory when starting a new terminal session.
#cd /c/dev
#cd ~/dev

# Start Oh My Posh and load your preferred prompt theme. Errors are redirected
# to standard error because `oh-my-posh` is an optional dependency, so we don't
# want to assume it is installed. Do this last because, even if oh-my-posh is
# installed, it is not always available in the PATH at startup of a new Bash session.
# https://ohmyposh.dev/
eval "$(oh-my-posh init bash --config ~/dotfiles/etc/oh-my-posh/themes/ocean.omp.json 2> /dev/null)"

# Alternatively, enable the `git-prompt.sh` file, which adds Git repo
# information to the prompt line. The `PROMPT_COMMAND` configuration will show
# username, as-sign, host, colon, cwd, then the Git status, followed by
# dollar and space, for the prompt text.
#source ~/dotfiles/lib/git-prompt.sh
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'
