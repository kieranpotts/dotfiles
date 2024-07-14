# ==============================================================================
# You MAY edit this file to extend the `~/.bash_profile` startup script, the
# content of which is managed via the dotfiles repository.
#
# Commands in this script MAY be dependent upon Bash-specific syntax and APIs.
# ==============================================================================

# Start Oh My Posh and load your preferred prompt theme. Errors are redirected
# to standard error because `oh-my-posh` is an optional dependency, so we don't
# want to assume it is installed.
# https://ohmyposh.dev/
#eval "$(oh-my-posh init bash --config ~/dotfiles/etc/oh-my-posh/themes/kp.omp.json 2> /dev/null)"

# Alternatively, enable the `git-prompt.sh` file, which adds Git repo 
# information to the prompt line.
#source ~/dotfiles/lib/git-prompt.sh

# Git prompt configuration. This will show username, at-sign, host, colon, cwd, 
# then the Git status, followed by dollar and space, for the prompt text.
#PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# Load nvm at startup.
#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Change to a specific directory when starting a new terminal session.
#cd ~/dev
