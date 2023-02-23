# Filesystem

These are the main root-level directories in this repository:

```txt
.
├─ bin
├─ dist
├─ docs
├─ etc
├─ home
└─ vendor
```

The `dist` and `home` directories contain the main dotfiles. The `dist` directory contains "global" dotfiles that are intended to be symlinked from the user's home directory. These are not intended to be editable by the user. By comparison, the `home` directory contains "local" dotfiles that the `update!` script will copy directly into the user's home directory. They extend the global dotfiles and may be edited directly by the user. Subsequent executions of the `update!` script will not overwrite any changes the user makes to the copies of the "local" files installed in their home directory.

The `bin` directory contains binaries. This directory is intended to be added to the user's system PATH, thus making the binaries executable from the command line.

The `etc` directory contains other configuration files for terminals, code editors and various other dev tools. Some of these need to be installed manually.

The `vendor` directory contains fonts and other digital assets for manual installation.

Finally, the `docs` directory contains documentation files written in Markdown.
