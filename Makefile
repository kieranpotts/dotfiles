#
# Task runners for this project's development lifecycle.
#

.PHONY: install version help

help:
	@echo "Available targets:"
	@echo "  install  - Symlink dotfiles into place"
	@echo "  version  - Tag a release point"
	@echo "  help     - Show this help message"

install:
	./run/install

version:
	./run/version
