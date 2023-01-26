# Installation

*****
**Disclaimer**: Some of the operations enabled by this dotfiles configuration are potentially destructive. For example, some Git aliases rewrite commit histories. If you choose to use these tools, you do so at your own risk.
*****

Clone this repository to any location on your local filesystem:

```sh
git clone git@github.com:kieranpotts/dotfiles.git
```

Change to the root directory of the cloned repository and run the `bin/update.sh` script using `bash` (Bash is the only shell supported at this time). If using Git Bash for Windows, your terminal MUST be run with administrator privileges in order for the script to be able to create the necessary symlinks.

```sh
cd dotfiles
bash bin/update.sh
```

The update script will install and enable the dotfiles configuration. The first time you do this, you will need to exit your terminal program then restart it. Doing so will create a new login shell, which will load the newly-installed dotfiles configuration at startup.

The update script will add some symlinks in the `~/bin` directory. The location MUST be added to your system's PATH environment variable for you to use utilities such as `lazygit` and `oh-my-posh`, which are bundled with these dotfiles.

The installation script will attempt to replace the following files in your home directory. If you already have any of these files, they will be renamed with the "backup" prefix – for example, your existing `~/.bashrc` file will be renamed `~/backup.bashrc`.

- `~/.profile`
- `~/.bash_profile`
- `~/.bashrc`
- `~/.gitconfig`
