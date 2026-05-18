# Usage

## Shell environment variables

In Bash the `PATH` environment variable is extended to include `$HOME/bin` and `$HOME/.local/bin`, if those directories exist. `$HOME/bin` takes priority.

## Shell aliases

The following shell aliases are enabled. All are POSIX-compliant unless otherwise noted.

### Navigation

- `..` → `cd ..`
- `...` → `cd ../..`
- `....` → `cd ../../..`
- `.....` → `cd ../../../..`

### File listing

- `ls`  → `ls --color` — Always use colorized output.
- `l` → `ls -laF --color` — List all files (inc. hidden) in long-form.
- `ld` → `ls -laF --color \| grep --color=never '^d'` — List only directories.
- `lf` → `ls -laF --color \| grep --color=never '^-'` — List only files.

### File operations

- `mkdir` → `mkdir -p` — Make directories recursively by default.
- `rm` → `rm -i` — Always prompt for confirmation.
- `cleanup` → `find . -type f -name '*.DS_Store' -ls -delete` — Recursively delete macOS `.DS_Store` files.

### Search

- `grep` → `grep --color=auto`
- `fgrep` → `grep -F --color=auto`
- `egrep` → `grep -E --color=auto`

### Git

- `g` → `git`
- `gs` → `git status`
- `ga` → `git add`
- `gaa` → `git add -A`
- `gb` → `git branch`
- `gba` → `git branch -a`
- `gc` → `git commit`
- `gca` → `git commit -a`
- `gcm` → `git commit -m`
- `gcam` → `git commit -am`
- `gco` → `git checkout`
- `gsw` → `git switch`
- `gmain` → `git checkout main`
- `gmaster` → `git checkout master`
- `gpsh` → `git push`
- `gpll` → `git pull`
- `grh` → `git reset --hard HEAD`
- `lg` → `lazygit`
- `gk` → `gitk`

### Docker

- `d` → `docker`
- `dc` → `docker-compose`
- `dm`  → `docker-machine`
- `dsa` → `docker stop $(docker ps -a -q)` — Stop all containers.

### Go

- `gotest` → `go test $(go list ./... \| grep -v /vendor/)`
- `gocover` → `go test -coverprofile=coverage.out && go tool cover -html=coverage.out`
- `golint` → `golint $(go list ./... \| grep -v /vendor/)`

### Editors

- `vi` → `nvim` — Map `vi` to Neovim. The original `vi` is still available as `\vi`.
- `vim` → `nvim` — Map `vim` to Neovim. The original `vim` is still available as `\vim`.

### HTTP / network

- `sniff` → `sudo ngrep -d 'en1' -t '^(GET\|POST) ' 'tcp and port 80'` — Capture HTTP requests on the `en1` interface.
- `httpdump` → `sudo tcpdump -i en1 -n -s 0 -w - \| grep -a -o -E "Host: .*\|GET /.*"` — Dump HTTP traffic on the `en1` interface.
- `show80` → `sudo lsof -iTCP -sTCP:LISTEN -Pnl \| grep :80` — Show what is listening on port 80.

### Misc

- `s` → `sudo` — Shortcut for `sudo` ("superuser do").
- `reload!` → `. ~/.bashrc` — Reload the Bash shell startup scripts.

## Shell functions

The following shell functions are enabled.

- `buildDockerImage [image_name]` — Build a Docker image from the `Dockerfile` in the current directory. If `image_name` is omitted, the image is built without a tag.
- `runDockerContainer <image_name>` — Run a Docker container in the background from the named image.
- `runDockerFromFile [image_name]` — Build an image from the `Dockerfile` in the current directory and immediately run a container from it in the background.
- `listDockerImages` — List all locally available Docker images.
- `sshDockerContainer <container_id>` — Open an interactive Bash shell inside a running container.

## Git config

The `.gitconfig` file modifies Git's default behavior in the following ways:

- `git merge` always records explicit merge commits (ie. `--no-ff` is the default).
- `git fetch` automatically prunes refs to non-existent upstream branches and deletes non-existent tags.
- `git pull` rebases by default.
- `--autosquash` and `--autostash` rules are automatically applied on rebase operations.
- `--update-refs` is applied to rebases, making it easier to rebase stacked branches.
- `git push` pushes new tags as well as new commits, and tracks the upstream branch automatically.
- Upstream branches are tracked automatically, and tracked branches are constrained to have the same names.
- The `histogram` diff algorithm is used in place of the default `myers`.
- Merge conflicts are rendered in `zdiff3` style, which includes the original common-ancestor text.
- `rerere` ("reuse recorded resolution") is enabled — conflict resolutions are recorded and replayed automatically.
- The default branch name for new repositories is `dev`.
- Git LFS filters are pre-configured.
- Opts-out of security checks for Git repositories on external storage devices (`safe.directory`).

## Other configurations

- **Git Bash completion** is loaded from `dist/completions/git-completion.bash`.
- **Neovim** is configured via `etc/nvim/init.vim`.
- **LazyGit** is configured via `etc/lazygit/config.yml`.
- **tmux** is configured via `etc/tmux/tmux.conf`, with an additional `dev` layout in `etc/tmux/inc/dev` (load it with `Ctrl-b D`).
- **Oh-My-Posh** themes are available in `home/.prompt-themes/oh-my-posh/`; alternative `git-prompt.sh` and `git-prompt-simple.bash` prompts are also provided.
