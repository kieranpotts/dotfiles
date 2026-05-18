#!/bin/sh

#
# Golang aliases.
#

alias gocover='go test -coverprofile=coverage.out && go tool cover -html=coverage.out'
alias gotest='go test $(go list ./... | grep -v /vendor/)'
alias golint='golint $(go list ./... | grep -v /vendor/)'
