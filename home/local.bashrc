# ==============================================================================
# You MAY edit this file to extend the `~/.bashrc` startup script, the
# content of which is managed via the dotfiles repository.
#
# Commands in this script MAY be dependent upon Bash-specific syntax and APIs.
# ==============================================================================

# Use more vivid colors in the terminal.
#COLORTERM=truecolor

# Set the TTY to use for GnuPG, required for inputting key passphrases.
# Test this works by running the following command to sign a test message.
# You should be prompted for your GPG key's passphrase.
# -----------------------------
# echo "test" | gpg --clearsign
# -----------------------------
#export GPG_TTY=$(tty)

# Load nvm at startup.
#export NVM_DIR="$HOME/.nvm"
#[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh" # Loads NVM
#[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion" # Loads Bash completion for NVM

# Load Jabba at startup.
#export JABBA_VERSION=0.11.2
#[ -s /home/kieran/.jabba/jabba.sh ] && source /home/kieran/.jabba/jabba.sh

# Load phpenv at startup.
# See https://github.com/phpenv/phpenv?tab=readme-ov-file#neckbeard-configuration
#export PATH="$HOME/.phpenv/bin:$PATH"
#eval "$(phpenv init -)"

# Required for pipenv. ~/.local/bin is the location of the virtualenv executable.
#export PATH="$HOME/.local/bin:$PATH"

# Fixes for dbus errors when launching Google Chrome from WSL.
#export XDG_RUNTIME_DIR=/run/user/$(id -u)
#export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus

# Start Oh My Posh and load your preferred prompt theme. Errors are redirected
# to standard error because `oh-my-posh` is an optional dependency, so we don't
# want to assume it is installed. Do this last because, even if oh-my-posh is
# installed, it is not always available in the PATH at startup of a new Bash session.
# https://ohmyposh.dev/
#eval "$(oh-my-posh init bash --config ~/.prompt-themes/oh-my-posh/ocean.omp.json 2> /dev/null)"

# Alternatively, enable the `git-prompt.sh` file, which adds Git repo
# information to the prompt line. This is configurable.
#source ~/.prompt-themes/git-prompt.sh
#export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
#GIT_PS1_SHOWDIRTYSTATE=1        # * unstaged, + staged
#GIT_PS1_SHOWUNTRACKEDFILES=1    # % untracked files
#GIT_PS1_SHOWUPSTREAM="auto"     # < behind, > ahead, <> diverged, = same commit
#GIT_PS1_SHOWCONFLICTSTATE="yes" # show "|CONFLICT" if conflicts

# Or:
#source ~/.prompt-themes/git-prompt-simple.bash

# Enable auto-completion for Terraform commands.
#complete -C /usr/bin/terraform terraform

# Load `gitex` Git extensions, if installed.
#if [ -d "${HOME}/dev/kieranpotts/gitex/bin" ] ; then
#  PATH="${PATH}:${HOME}/dev/kieranpotts/gitex/bin"
#fi

# Change to a specific directory when starting a new terminal session.
#cd /c/dev
#cd ~/dev
