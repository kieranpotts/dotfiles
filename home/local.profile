# ==============================================================================
# You MAY edit this file to extend the `~/.profile` startup script, the content
# of which is managed via the dotfiles repository. All commands in this script
# MUST be POSIX-compliant and shell-agnostic.
#
# All commands in this script MUST be POSIX-compliant and shell-agnostic.
# ==============================================================================

# Load aliases that are compatible with all POSIX-compliant shells.
if [ -f ~/aliases/posix/index.sh ]; then
  source ~/aliases/posix/index.sh
fi
