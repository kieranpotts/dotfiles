#!/bin/sh

# ==============================================================================
# Dotfiles installation script.
# ==============================================================================

# This is required for the `ln` command to generate proper symlinks in
# MSysGit / Git for Windows. Without this configuration the `ln` command in
# this runtime environment will create copies of the dotfiles, rather than
# symlinks to them.
windows() { [ -n "$WINDIR" ]; }
if windows; then
  export MSYS=winsymlinks:nativestrict
fi

# Absolute path to this script, eg `/path/to/dotfiles/install.sh`.
FILE_PATH=$(readlink -f "$0")

# Absolute path to this directory, eg `/path/to/dotfiles`.
DIR_PATH=$(dirname "$FILE_PATH")

if [ -z "${CODESPACES}" ]; then

  # Installation for all environments *except* GitHub Codespaces.

  # Copy the `local.*` templates directly into the user's home directory, unless
  # they already exist there (`--no-clobber`).
  cp --no-clobber "${DIR_PATH}/home/local.profile" ~/local.profile
  cp --no-clobber "${DIR_PATH}/home/local.bash_profile" ~/local.bash_profile
  cp --no-clobber "${DIR_PATH}/home/local.bashrc" ~/local.bashrc
  cp --no-clobber "${DIR_PATH}/home/local.gitconfig" ~/local.gitconfig
  cp --no-clobber "${DIR_PATH}/home/local.gitignore" ~/local.gitignore
  cp --no-clobber "${DIR_PATH}/home/local.gitmessage" ~/local.gitmessage

  # Copy the prompt themes, too.
  mkdir -p ~/.prompt-themes
  mkdir -p ~/.prompt-themes/oh-my-posh
  cp --no-clobber "${DIR_PATH}/home/.prompt-themes/oh-my-posh/ocean.omp.json" ~/.prompt-themes/oh-my-posh/ocean.omp.json
  cp --no-clobber "${DIR_PATH}/home/.prompt-themes/git-prompt.sh" ~/.prompt-themes/git-prompt.sh

  # Create backups of system files that will be overwritten. This is especially
  # important on the first install, to make sure the user does not lose existing
  # dotfile configurations. For this reason, we use the `--no-clobber` option so
  # we don't overwrite existing backups. Symbolic links are followed to ensure the
  # actual files – not their symlinks – are backed up (`--dereference`). Errors
  # are hidden because it is okay for the source files to not exist.
  cp --no-clobber --dereference ~/.profile ~/backup.profile 2> /dev/null
  cp --no-clobber --dereference ~/.bash_profile ~/backup.bash_profile 2> /dev/null
  cp --no-clobber --dereference ~/.bashrc ~/backup.bashrc 2> /dev/null
  cp --no-clobber --dereference ~/.gitconfig ~/backup.gitconfig 2> /dev/null

  # Create symbolic links (not hard links) in the user's home directory to this
  # repository's various "global" dotfiles such as `.gitconfig` and `.profile`.
  # Existing files will be overwritten (`--force`).
  #
  # Note: `cp` will not, by default, copy hidden dot-prefixed files. This is why
  # none of the source files are dot-prefixed, eg `global.bashrc` instead of
  # `.bashrc`.
  ln --symbolic --force "${DIR_PATH}/dist/global.profile" ~/.profile 2> /dev/null
  ln --symbolic --force "${DIR_PATH}/dist/global.bash_profile" ~/.bash_profile 2> /dev/null
  ln --symbolic --force "${DIR_PATH}/dist/global.bashrc" ~/.bashrc 2> /dev/null
  ln --symbolic --force "${DIR_PATH}/dist/global.gitconfig" ~/.gitconfig 2> /dev/null

  # Create symbolic links to the configuration files for LazyGit and Neovim. On
  # Windows, to use these programs in the Git Bash emulator, equivalent symbolic
  # links must be created on the host system using PowerShell - see the README for
  # instructions, this has not been automated.
  if ! windows; then
    mkdir -p ~/.config/lazygit
    ln --symbolic --force "${DIR_PATH}/etc/lazygit/config.yml" ~/.config/lazygit/config.yml

    mkdir -p ~/.config/nvim
    ln --symbolic --force "${DIR_PATH}/etc/nvim/init.vim" ~/.config/nvim/init.vim
  fi

  # If there were errors with the above linking operations, provide useful
  # feedback to the user to help them resolve the issue.
  retval=$?

  # Add excecute privilegs to all the contents of this repository's `bin`
  # directory.
  chmod -R u+x "${DIR_PATH}/bin"

  if [ ! $retval -eq 0 ]; then
    echo "Failed to create symbolic links in your home directory, try again with elevated privileges"
  else

    # Try reloading the shell startup scripts. This won't work the first time
    # because the terminal will first need to be restarted to create a new shell
    # session, which will source the startup scripts that define `reload!`.
    reload! 2> /dev/null

    # Done.
    echo "== Installed dotfiles =="
    echo "Restart your terminal for all changes to take effect."

  fi

else

  # Minimal installation for GitHub Codespaces.
  #
  # This installation script is designed to be compatible with GitHub Codespaces,
  # allowing for automatic installation in that environment. Only a subset of
  # my dotfiles are installed in Codespaces, and the configuration is designed
  # to extend, not override, the default Codespaces environment.
  #
  # https://github.com/codespaces-contrib/dotfiles
  # https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles
  # https://docs.github.com/en/codespaces/troubleshooting/troubleshooting-personalization-for-codespaces#troubleshooting-dotfiles

  mkdir -p ~/.aliases
  mkdir -p ~/.functions

  # Copy the aliases and functions directly into the user's home directory. The
  # Neovim aliases are excluded because Neovim isn't available in Codespaces.
  cp --no-clobber "${DIR_PATH}/dist/aliases/cd.sh" ~/.aliases/cd.sh
  cp --no-clobber "${DIR_PATH}/dist/aliases/git.sh" ~/.aliases/git.sh
  cp --no-clobber "${DIR_PATH}/dist/aliases/grep.sh" ~/.aliases/grep.sh
  cp --no-clobber "${DIR_PATH}/dist/aliases/ls.sh" ~/.aliases/ls.sh
  cp --no-clobber "${DIR_PATH}/dist/aliases/mkdir.sh" ~/.aliases/mkdir.sh
  cp --no-clobber "${DIR_PATH}/dist/aliases/rm.sh" ~/.aliases/rm.sh
  cp --no-clobber "${DIR_PATH}/dist/aliases/sudo.sh" ~/.aliases/sudo.sh
  cp --no-clobber "${DIR_PATH}/dist/functions/docker.sh" ~/.functions/docker.sh

  # Create a file at ~/.bash_aliases and edit the contents to include
  # sourcing of ~/aliases/cd.sh etc. GitHub Codespaces will automatically
  # source this file, if it exists, when a new terminal session is started.
  touch ~/.bash_aliases

  echo "source ~/.aliases/cd.sh" >> ~/.bash_aliases
  echo "source ~/.aliases/git.sh" >> ~/.bash_aliases
  echo "source ~/.aliases/grep.sh" >> ~/.bash_aliases
  echo "source ~/.aliases/ls.sh" >> ~/.bash_aliases
  echo "source ~/.aliases/mkdir.sh" >> ~/.bash_aliases
  echo "source ~/.aliases/rm.sh" >> ~/.bash_aliases
  echo "source ~/.aliases/sudo.sh" >> ~/.bash_aliases
  echo "source ~/.functions/docker.sh" >> ~/.bash_aliases

  # Done.
  echo "== Installed dotfiles for Codespaces =="

fi
