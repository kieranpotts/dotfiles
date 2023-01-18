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
  # this runtime environment will create copies of files, rather than symlinks.
  export MSYS=winsymlinks:nativestrict
fi

# Copy the contents of the `dist` directory into `~/dotfiles`, replacing
# the files if they already exist in the destination. Note, `cp` will not
# copy hidden dot files with this command, which is why files like `bashrc`
# are not dot-prefixed in the `dist` directory.
cp -Rf dist/* ~/dotfiles

# Copy the `.local.gitconfig` and `.local.gitignore` templates directly into the
# user's home directory, unless they already exist there.
cp -n ~/dotfiles/local.gitconfig ~/.local.gitconfig
cp -n ~/dotfiles/local.gitignore ~/.local.gitignore

# Create symlinks to the `.gitconfig` and various UNIX profile files. Existing
# files will not be overwritten. Error output is silenced because it is okay
# for the linking operation to fail if the files already exist.
ln -s ~/dotfiles/bash_profile ~/.bash_profile 2> /dev/null
ln -s ~/dotfiles/bashrc ~/.bashrc 2> /dev/null
ln -s ~/dotfiles/gitconfig ~/.gitconfig 2> /dev/null
ln -s ~/dotfiles/profile ~/.profile 2> /dev/null

# Print confirmation message.
echo 'Updated dotfiles'
