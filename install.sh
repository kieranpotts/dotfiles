# ==============================================================================
# Installation script for GitHub Codespaces.
#
# https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles
# ==============================================================================

# Determine the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source the dotfiles, relative to the current script's directory - we can't
# assume to know where this file will be installed in the Codespaces VM.
source "$SCRIPT_DIR/dist/aliases/index.sh"
source "$SCRIPT_DIR/dist/aliases/index.sh"
