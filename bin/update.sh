#!/bin/bash -x

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

# Make the necessary directories in the user's home space, ignoring warnings if
# the destinations already exist.
mkdir ~/dotfiles 2> /dev/null
mkdir ~/dotfiles/aliases 2> /dev/null
mkdir ~/dotfiles/bin 2> /dev/null
mkdir ~/dotfiles/poshthemes 2> /dev/null

# Copy the contents of `src/dotfiles` directory into `~/dotfiles`, replacing
# the files if they already exist in the destination. Note, `cp` will not
# copy hidden dot-prefixed files with this command, which is why files like
# `bashrc` are not dot-prefixed in the `src` directory.
cp --recursive --force src/dotfiles/* ~/dotfiles

# Copy the `local.*` templates directly into the user's home directory, unless
# they already exist there.
cp --no-clobber src/local.profile ~/local.profile
cp --no-clobber src/local.bash_profile ~/local.bash_profile
cp --no-clobber src/local.bashrc ~/local.bashrc
cp --no-clobber src/local.gitconfig ~/local.gitconfig
cp --no-clobber src/local.gitignore ~/local.gitignore

# Create backups of system files that will be overwritten. This is especially
# important on the first install, to make sure the user does not lose existing
# dotfile configurations. Symbolic links are followed to ensure the actual files
# are backed up, not just the symlinks to them (`--dereference`). Errors are
# hidden because it is okay for the source files to not exist.
cp --dereference ~/.profile ~/backup.profile 2> /dev/null
cp --dereference ~/.bash_profile ~/backup.bash_profile 2> /dev/null
cp --dereference ~/.bashrc ~/backup.bashrc 2> /dev/null
cp --dereference ~/.gitconfig ~/backup.gitconfig 2> /dev/null

# Create symbolic links (not hard links) in the user's home directory to
# `.gitconfig` and the various shell startup scripts. Existing files will be
# overwritten (`--force`). Errors in the linking operation are re-printed with
# more useful user feedback.
ln --symbolic --force ~/dotfiles/global.profile ~/.profile 2> /dev/null
ln --symbolic --force ~/dotfiles/global.bash_profile ~/.bash_profile 2> /dev/null
ln --symbolic --force ~/dotfiles/global.bashrc ~/.bashrc 2> /dev/null
ln --symbolic --force ~/dotfiles/global.gitconfig ~/.gitconfig 2> /dev/null

# Create symbolic links to the `dotfiles/bin` executables in the user's own
# `~/bin`, which is assumed to be in their PATH.
ln --symbolic --force ~/dotfiles/bin/git-attribute ~/bin/git-attribute 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-default ~/bin/git-default 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-experiment ~/bin/git-experiment 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-feature ~/bin/git-feature 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-fell ~/bin/git-fell 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-fix ~/bin/git-fix 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-maint ~/bin/git-maint 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-refactor ~/bin/git-refactor 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-sync ~/bin/git-sync 2> /dev/null
ln --symbolic --force ~/dotfiles/bin/git-wip ~/bin/git-wip 2> /dev/null

retval=$?
if [ ! $retval -eq 0 ]; then
  echo "Failed to create symbolic links in your home directory, try again with elevated privileges"
fi;

# Print confirmation message.
echo '== UPDATED DOTFILES =='
