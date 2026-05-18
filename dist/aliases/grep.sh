#!/bin/sh

#
# Aliases for `grep` utils.
#

# Always use colorized output. `fgrep` and `egrep` are deprecated in GNU grep
# >= 3.8, so we alias them to the modern equivalents (`grep -F` / `grep -E`).
alias grep="grep --color=auto"
alias fgrep="grep -F --color=auto"
alias egrep="grep -E --color=auto"
