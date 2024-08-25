#!/bin/sh

# ==============================================================================
# Aliases for Docker CLI.
# ==============================================================================

alias d='docker'
alias dc='docker-compose'
alias dm='docker-machine'

# Stop all containers.
alias dsa='docker stop $(docker ps -a -q)'
