# Installation

*****
**Disclaimer**: Some of the operations enabled by this dotfiles configuration are potentially destructive. For example, some Git aliases rewrite commit histories. If you choose to use these tools, you do so at your own risk.
*****

Clone this repository to any location on your local filesystem:

```sh
git clone git@github.com:kieranpotts/dotfiles.git
```

Change to the root directory of the cloned repository and run the `bin/update.sh` script. Bash is the only shell supported at this time. If using Git Bash for Windows, the shell MUST be run with administrator privileges in order for the necessary symlinks to be created.

```sh
cd dotfiles
bash bin/update.sh
```

This will install and enable the dotfiles configuration. The first time you do this, you will need to exit the shell then login again. Doing so will create a new login shell, which will load the newly-installed dotfiles configuration at startup.

The installation script will attempt to replace the following files in your home directory. If you already have any of these files, they will be renamed with the ".backup" prefix – for example, your existing `~/.bashrc` file will be renamed `~/.backup.bashrc`.

- `~/.bash_profile`
- `~/.bashrc`
- `~/.gitconfig`
- `~/.profile`
