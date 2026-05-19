# Installation

To install these dotfiles, fork-and-clone the upstream repository to any location on your local machine, then follow the steps below.

This process needs to be repeated for each environment in which you want to use the dotfiles. On Windows, you will need to repeat these steps, once for MSysGit / Git Bash, and again for WSL.

## Run the `./run/install` script

Change to the root directory of the cloned repository and execute the `./run/install` shell script.

> **Important:** For Git Bash on Windows, run the terminal program as administrator.

```sh
cd /path/to/dotfiles
./run/install
```

The first time you run this, you will need to exit your terminal program then restart it. Doing so will create a new login shell, which will load the newly-installed dotfiles at startup.

The `run/install` script can be safely run multiple times, and it is RECOMMENDED to re-run it whenever you `git pull` the latest changes from the upstream dotfiles repository, so that any new required symlinks are created.

## GitHub Codespaces configuration

The `./run/install` script can be used to bootstrap your GitHub Codespaces environments, too. Only a subset of the dotfiles configuration are enabled in Codespaces – limited only to Bash aliases and functions.

Codespaces' dotfiles auto-discovery only matches a fixed set of filenames at the repo root. For this reason, an `install.sh` thin wrapper is kept at the root, which delegates to `./run/install`. You should not need to interact with this wrapper directly.

Go to your [GitHub Codespaces options](https://github.com/settings/codespaces) and enable the setting to "automatically install dotfiles".
