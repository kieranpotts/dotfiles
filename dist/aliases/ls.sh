#!/bin/sh

# ==============================================================================
# Aliases for `ls`.
# ==============================================================================

# List all files – including dot files – and directories in long-form
# format with colorized output.
alias l="ls -laF --color"

# List only files.
alias lf="ls -laF --color | grep --color=never '^-'"

# List only directories.
alias ld="ls -laF --color | grep --color=never '^d'"

# Always use colorized output for ls.
alias ls="ls --color"
