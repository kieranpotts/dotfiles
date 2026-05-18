# The `home` directory

The `home` directory contains "local" dotfiles that the `./install.sh` script will copy directly into the user's home directory. These extend the "global" dotfiles installed from the `dist` directory.

The "local" dotfiles may be edited directly by the user. After the initial installation, subsequent executions of the `./install.sh` script will not overwrite any changes the user makes to the copies of the "local" files installed in their home directory.
