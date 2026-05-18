#!/bin/sh

#
# Aliases for common `find` operations.
#

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
