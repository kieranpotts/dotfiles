#
# Image for this repository's devcontainer. Referenced from `devcontainer.json`.
# Extends the base image with the extra tools needed to work on this project.
#

# Builds on my standard devcontainer base image, which provides the common
# toolchain for all of my personal projects.
FROM kieranpotts/devcontainer:latest

# Stops `apt` and `dpkg` from waiting on interactive prompts, which would
# otherwise hang the build.
ENV DEBIAN_FRONTEND=noninteractive

# Runs the rest of the build, and the container itself, as the base image's
# non-root `code` user.
USER code

# Installs the pre-commit program `~/.local/bin`, which is on the base image's
# `PATH`. Used by the `postStartCommand` in `devcontainer.json` to install
# Git hooks.
RUN pipx install pre-commit
