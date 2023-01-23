#!/bin/bash

# -----------------------------------------------------------------------------
# Script to update the dotfiles and to establish the necessary symlinks in
# the user's home directory.
#
# From this repository's root directory:
#
# ```
# git pull
# bash bin/update.sh
# ```
# -----------------------------------------------------------------------------

# Check if the host OS is Windows.
windows() { [[ -n "$WINDIR" ]]; }

if windows; then
  # This is required for the `ln` command to generate proper symlinks in
  # MSysGit / Git for Windows. Without this configuration the `ln` command in
  # this runtime environment will create copies of the dotfiles rather than
  # symlinks to them.
  export MSYS=winsymlinks:nativestrict
fi

# Make the `~/dotfiles` directory
mkdir ~/dotfiles

# Copy the contents of the `dist` directory into `~/dotfiles`, replacing
# the files if they already exist in the destination. Note, `cp` will not
# copy hidden dot-prefixed files with this command, which is why files like
# `bashrc` are not dot-prefixed in the `dist` directory.
cp --recursive --force dist/* ~/dotfiles

# Create backups of `~/.local.**` files, if they exist, before overwriting them.
# These files are not expected to be references (symlinks) but in case they are
# we make sure we backup the referenced file, not the symlink. Errors are
# hidden because it is okay for the source files to not exist.
cp --dereference ~/.local.gitconfig ~/.backup.gitconfig 2> /dev/null
cp --dereference ~/.local.gitignore ~/.backup.gitignore 2> /dev/null

# Copy the `.local.gitconfig` and `.local.gitignore` templates directly into the
# user's home directory, unless they already exist there.
cp --no-clobber ~/dotfiles/local.gitconfig ~/.local.gitconfig
cp --no-clobber ~/dotfiles/local.gitignore ~/.local.gitignore

# Create backups of home-directory files that will be overwritten. This is
# especially important on the first install, to make sure the user does not lose
# existing dotfile configurations. Symbolic links are followed to ensure the
# actual files are backed up, not just the symlinks to them. Errors are hidden
# because it is okay for the source files to not exist.
cp --dereference ~/.bash_profile ~/.backup.bash_profile 2> /dev/null
cp --dereference ~/.bashrc ~/.backup.bashrc 2> /dev/null
cp --dereference ~/.gitconfig ~/.backup.gitconfig 2> /dev/null
cp --dereference ~/.profile ~/.backup.profile 2> /dev/null

# Create symbolic links (not hard links) to `.gitconfig` and various UNIX files.
# Existing files will be overwritten (`--force`). Potential errors are NOT
# silenced because privileges may need to be elevated to do this operation.
ln --symbolic --force ~/dotfiles/bash_profile ~/.bash_profile
ln --symbolic --force ~/dotfiles/bashrc ~/.bashrc
ln --symbolic --force ~/dotfiles/gitconfig ~/.gitconfig
ln --symbolic --force ~/dotfiles/profile ~/.profile

# Print confirmation message.
echo '== UPDATED DOTFILES =='
