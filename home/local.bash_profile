# ==============================================================================
# You MAY edit this file to extend the `~/.bash_profile` startup script, the
# content of which is managed via the dotfiles repository.
#
# Commands in this script MAY be dependent upon Bash-specific syntax and APIs.
# ==============================================================================

# Start Oh My Posh and load your preferred prompt theme.
#
# Errors are redirected to standard error because `oh-my-posh` is an optional
# dependency, we we cannot assume it is installed on the user's system.
#
# Note: the Hacks theme, which is shipped with this dotfiles repository,
# is a custom fork of the popular Agnoster theme that is included with
# Oh My Posh.
#
# Documentation:
# https://ohmyposh.dev/
#
eval "$(oh-my-posh init bash --config ~/dotfiles/etc/poshthemes/hacks.omp.json 2> /dev/null)"
