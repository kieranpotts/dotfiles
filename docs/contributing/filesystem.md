# Filesystem

These are the main root-level directories in this repository:

```txt
.
├─ bin     (executables, this directory is expected to be added to the system PATH)
├─ dist    (dotfiles symlinked from user's home directory, not intended to be editable by the user)
├─ docs    (documentation)
├─ etc     (configuration files for various dev tools, symlinked from other locations on the user's filesystem)
├─ home    ("local" dotfiles copied into the user's home directory, directly editable by the user)
└─ vendor  (fonts and other assets for manual installation)
```

The `bin` directory contains binaries. This directory is intended to be added to the user's system PATH, thus making the binaries executable from the command line.

The `dist` directory contains "global" dotfiles which are intended to be symlinked from the user's home directory. These are not intended to be editable by the user. By comparison, the `home` directory contains "local" dotfiles that the `update!` script will copy directly into the user's home directory. They override the global configs and may be edited directly by the user. Subsequent executions of the `update!` script will not overwrite any changes the user makes to the copies of these files installed in their home directory.

The `etc` directory contains other configuration files for terminals, code editors and various other dev tools. Some of these are intended to be manually symlinked from other location's on the user's filesystem.

The `vendor` directory contains fonts and other digital assets for manual installation.

Finally, the `docs` directory contains documentation files written in Markdown.
