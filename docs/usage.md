# Usage

## Shell environment variables

In Bash the `PATH` environment variable is extended to include `$HOME/bin` and `$HOME/.local/bin`, if those directories exist. `$HOME/bin` takes priority.

## Shell aliases

The following shell aliases are enabled.

| Alias | Command | Description | Compatibility |
|-------|---------|-------------|---------------|
| `..` | `cd ..` | Change up one directory. | POSIX |
| `...` | `cd ../..` | Change up two directories. | POSIX |
| `....` | `ch ../../..` | Change up three directories. | POSIX |
| `.....` | `cd ../../../..` | Change up four directories. | POSIX |
| `egrep` | `egrep --color=auto` | Enable colorized output by default. | POSIX |
| `fgrep` | `fgrep --color=auto` | Enable colorized output by default. | POSIX |
| `g` | `git` | Shortcut for the oft-typed `git` command. | POSIX |
| `grep` | `grep --color=auto` | Enable colorized output by default. | POSIX |
| `l` | `ls -laF --color` | List all files (including hidden ones) in long-form. | POSIX |
| `ld` | `ls -laF --color \| grep --color=never '^d'` | List only directories. | POSIX |
| `lf` | `ls -laF --color \| grep --color=never '^-'` | List only files. | POSIX |
| `ls` | `ls --color` | Enable colorized output by default. | POSIX |
| `mkdir` | `mkdir -p` | Make directories recursively by default. | POSIX |
| `reload!` | `. ~/.bashrc` | Reload the Bash shell startup scripts. | Bash |
| `s` | `sudo` | Shortcut for `sudo` ("superuser do"). | POSIX |

## Shell functions

The following shell functions are enabled.

| Function | Description | Compatibility |
|----------|-------------|---------------|
| `buildDockerImage ([name_for_created_image])` | Build a Docker image from a Dockerfile in the current directory. | POSIX |
| `runDockerContainer [image_name]` | Run a Docker container from an image. | POSIX |
| `runDockerFromFile ([name_for_created_image])` | Build an image and immediately run a container in the background from it. | POSIX |
| `listDockerImages` | List all available docker images. | POSIX |
| `sshDockerContainer [container_id]` | SSH into a running container. | POSIX |

## Git config

The `.gitconfig` file modifies Git's default behavior in the following ways:

- `git merge` always records explicit merge commits (ie. `--no-ff` is the default).
- `git fetch` automatically prunes refs to non-existent upstream branches and deletes non-existent tags.
- `git pull` rebases by default.
- `--autosquash` rules are automatically applied on rebase operations.
- `git push` pushes new tags, as well as new commits.
- Upstream branches are tracked automatically, and tracked branches are constrained to have the same names.
- Opts-out of security checks for Git repositories on external storage devices (`safe.directory`).
