# shellcheck shell=bash
# shellcheck disable=SC1090,SC1091

#
# You MAY edit this file to extend the `~/.bashrc` startup script, the
# content of which is managed via the dotfiles repository.
#
# Commands in this script MAY be dependent upon Bash-specific syntax and APIs.
#

# Set my default editor.
#EDITOR=nvim
#VISUAL=$EDITOR
#export EDITOR VISUAL

# Use more vivid colors in the terminal.
#COLORTERM=truecolor

# Don't put duplicate lines, or lines starting with space, in the history.
#HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
#shopt -s histappend

# History length.
#HISTSIZE=1000
#HISTFILESIZE=2000

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS to fit the contents.
#shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# Use lesspipe to make less more friendly for non-text input files.
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Fixes for dbus errors when launching Google Chrome from WSL.
#export XDG_RUNTIME_DIR=/run/user/$(id -u)
#export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus

# Set the TTY to use for GnuPG, required for inputting key passphrases. Test
# this works by running the following command to sign a test message. You should
# be prompted for your GPG key's passphrase.
# $ echo "test" | gpg --clearsign
#export GPG_TTY=$(tty)

# Launch the GPG agent at startup.
# gpgconf --launch gpg-agent

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

# Pin Docker to the native engine's context. Docker Desktop hijacks the
# active context: it flips `currentContext` to `desktop-linux` while it is
# running and resets it to `default` when it stops. Tools that follow the
# active context — notably VS Code's Dev Containers extension — then break
# when Desktop is not running, because they look for Desktop's socket instead
# of the native daemon at /var/run/docker.sock. Forcing DOCKER_CONTEXT=default
# makes the native engine the daemon every time, so devcontainers start
# whether or not Docker Desktop happens to be running.
# https://docs.docker.com/engine/manage-resources/contexts/
#export DOCKER_CONTEXT=default

# Docker Hub login credentials, required for publishing images.
#export DOCKER_USERNAME=<your-username>
#export DOCKER_TOKEN=<your-personal-access-token>

# Configure Claude Code to use Ollama as the default provider, and set
# default model selections.
#export ANTHROPIC_BASE_URL=http://localhost:11434
#export ANTHROPIC_AUTH_TOKEN=ollama
#export ANTHROPIC_MODEL=qwen3-coder:30b
#export ANTHROPIC_SMALL_FAST_MODEL=qwen2.5-coder:3b # For fast subtasks.

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
