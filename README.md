# Dotfiles

**My personal Unix dotfiles.**

## 📝 Overview

The following is included in this project.

- A better default configuration for Git, including aliases, diff/merge
  algorithms, and LFS support.

- A collection of Bash shell aliases and functions for everyday navigation,
  file operations, Git, Docker, and Go.

- Bash startup scripts (`~/.profile`, `~/.bash_profile`, `~/.bashrc`) designed
  to work consistently across login and non-login shells.

- Prompt themes for [Oh-My-Posh](https://ohmyposh.dev/) and Bash, with Git
  status indicators.

- GitHub Codespaces integration via an auto-discovered installer.

### Structure

The repository's contents are organized into the following directories:

- `dist/` \
  "Global" dotfiles that are symlinked into the user's home directory. Not
  intended to be edited.

- `home/` \
  "Local" templates that are copied into the user's home directory on first
  install. Safe to edit thereafter.

- `run/` \
  The installer script. A thin `install.sh` wrapper at the repo root exists
  for GitHub Codespaces auto-discovery.

## ☑️ Requirements

These dotfiles are intended for use in Bash on Debian-based systems, but I've
made some effort to make them as cross-platform compatible as possible. Most
of the shell scripts are POSIX-compliant and will therefore run in all Unix
shells. They can be used on Windows too, via a Linux emulator like
[MSysGit / Git Bash for Windows](https://gitforwindows.org/), or a
virtual machine like WSL.

On Debian systems, my [bootstrap](https://github.com/kieranpotts/bootstrap)
scripts can be used to install all dependencies, so automating the following
steps. For Git Bash on Windows, my [devtools](https://github.com/kieranpotts/devtools)
bundles most of the required programs, but some of the below steps still need
to be done manually.

### REQUIRED programs

The only REQUIRED program is **Git**. The Git configuration has been tested
with [Git](https://git-scm.com/) v2.39.1 and is expected to be compatible with
versions after 2.35. For Debian distros, run the following command to check
which is the current version of Git available via the APT package manager.

```sh
apt-cache policy git
```

If the available version is ≥ v2.35, go ahead and install from the default
package registry.

```sh
sudo apt-get update
sudo apt-get install git -y
```

If you want to install a newer version of Git than is available via the
package registry, you will need to install from source. Use `wget` to
download the source of the desired version. For example, to download
the source for Git v2.35.0, run the following command.

```sh
wget https://github.com/git/git/archive/refs/tags/v2.35.0.tar.gz
```

Before extracting the files from the archive, install the following packages.

```sh
sudo apt-get update
sudo apt-get install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc
```

Extract the source files for the Git package, then navigate to the extracted directory.

```sh
tar -zxf v2.35.0.tar.gz
cd git-2.35.0
```

Run the following command to build and install the Git package. This is a
slow operation.

```sh
make prefix=/usr/local all
sudo make prefix=/usr/local install
```

Restart your terminal, then check the installed Git version with the command
`git --version`. Use `rm` to clean-up the temporary files and directories
created in this process.

### OPTIONAL programs

It is RECOMMENDED to install Git Large File Storage (LFS). This is a Git
extension that removes large files from Git repositories, storing them
elsewhere and cross-referencing the files from the Git repositories
using pointers.

Git LFS is included in the distribution of [Git for Windows](https://gitforwindows.org/),
while [packages are available](https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md)
 for popular Linux distributions.

Once installed, run the following command to set up Git LFS globally in your
local Git instance:

```sh
git lfs install
```

In each Git repository where you want to use Git LFS, run the following command
to configure the file types that you'd like Git LFS to manage. Alternatively,
you can edit the `.gitattributes` file directly. (Changes to the
`.gitattributes` file MUST be committed).

```sh
git lfs track "*.pdf"
```

Then commit and push as normal. Git LFS will automatically manage the large
files for you.

To convert existing large files, previously committed to the repository, use
the `git lfs migrate` command. See the
[Git LFS documentation](https://github.com/git-lfs/git-lfs/blob/main/docs/man/git-lfs-migrate.adoc)
for further instructions, and more
[about large files on GitHub](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github).

----

Besides Git LFS, the following programs are also OPTIONAL:

- [Delta](https://github.com/dandavison/delta)
- [GPG4Win](https://www.gpg4win.org/)
- [Oh-My-Posh](https://ohmyposh.dev/docs/installation/linux)

GPG4Win is required for signing Git commits with a passphrase-protected private
key. Delta is used for rendering diffs in Git output. Oh-My-Posh is a
cross-platform framework for customizing the terminal prompt line.

## 📦 Installation

To install these dotfiles, fork-and-clone the upstream repository to any
location on your local machine, then follow the steps below.

This process needs to be repeated for each environment in which you want to use
the dotfiles. On Windows, you will need to repeat these steps, once for
MSysGit / Git Bash, and again for WSL.

### Run the `./run/install` script

Change to the root directory of the cloned repository and execute the
`./run/install` shell script.

> [!IMPORTANT]
> For Git Bash on Windows, run the terminal program as administrator.

```sh
cd /path/to/dotfiles
./run/install
```

The first time you run this, you will need to exit your terminal program then
restart it. Doing so will create a new login shell, which will load the
newly-installed dotfiles at startup.

The `run/install` script can be safely run multiple times, and it is
RECOMMENDED to re-run it whenever you `git pull` the latest changes
from the upstream dotfiles repository, so that any new required symlinks
are created.

### GitHub Codespaces configuration

The `./run/install` script can be used to bootstrap your GitHub Codespaces
 environments, too. Only a subset of the dotfiles configuration are enabled
 in Codespaces – limited only to Bash aliases and functions.

Codespaces' dotfiles auto-discovery only matches a fixed set of filenames
at the repo root. For this reason, an `install.sh` thin wrapper is kept at
the root, which delegates to `./run/install`. You should not need to interact
with this wrapper directly.

Go to your [GitHub Codespaces options](https://github.com/settings/codespaces)
and enable the setting to "automatically install dotfiles".

## ⚙️ Configuration

The `./run/install` script will have established various symlinks in your home
directory for the Unix dotfiles. For example, `~/.gitconfig` will be symlinked
to `/path/to/dotfiles/dist/global.gitconfig`.

You SHOULD NOT change the dotfiles symlinks (eg. `~/.gitconfig`) or edit the
contents of their target files in this repository's `dist` directory. Instead,
you can make changes to your dotfiles configuration via the "local" files that
have been added to your home directory – as explained below.

The following files will be added to your home directory.

- `~/local.profile`
- `~/local.bash_profile`
- `~/local.bashrc`
- `~/local.gitconfig`
- `~/local.gitignore`
- `~/local.gitmessage`

These are _not_ symlinked and they are not kept under version control, either.
Therefore, you can safely edit these files to make configuration changes in
each environment. It's via these "local" files that you extend the "global"
dotfiles configurations shared via this repository.

### Secrets

Tokens, passwords, and other credentials MUST NOT be written inline in
`~/local.bashrc`. That file is world-readable by default, and it shares its
name with a template tracked in this repository, so an inline secret is one
stray `cp` away from being committed.

Instead, put them in `~/local.secrets`, which `~/local.bashrc` sources if it
is present.

The installer creates this file for you, empty apart from a header comment,
and sets its mode to `0600`. It re-asserts that mode on every run, so if the
permissions drift, re-running the installer repairs them:

```sh
./run/install
```

Unlike the other `local.*` files, `~/local.secrets` has no template under
`home/` in this repository. That is deliberate — a tracked file by that name
invites editing it in place and committing a real credential, which is the
failure this file exists to prevent.

Reference secrets from `~/local.bashrc` by variable name only, never by value.

> [!TIP]
> Whenever you make changes to `~/local.bashrc`, you can call the `reload!`
> function to re-source `~/.bashrc` (which in turn re-sources `~/local.bashrc`),
> so your changes take effect immediately, without needing to restart the
> shell session.
>
> ```
> reload!
> ```
>
> Changes to `~/local.bash_profile` or `~/local.profile` require a fresh login
> shell – either restart your terminal or run `exec bash --login`.

If you already had files like `.profile` or `.gitconfig` in your user directory,
the `./run/install` script will have created backups of these files before
replacing them. The backup files will be named with the "backup" prefix. For
example, your existing `~/.bashrc` file will have been renamed `~/backup.bashrc`.
You may need to manually copy-and-paste existing configurations from the old
"backup" files to the new "local" files.

### Git configuration

You MUST edit the `~/local.gitconfig` file to configure your Git user profile
information. This data will be embedded in commit objects:

```ini
[user]
  email = you@example.com
  name = Your Name
```

> [!TIP]
> GitHub provides free aliases for your GitHub account's email address, to help
> keep your personal email address private. You can enable this via your GitHub
> account's email settings.

When you ran the `./run/install` script, your previous Git configuration would
have been backed up to `~/backup.gitconfig`. You SHOULD review the contents of
this file and copy any other configurations you wish to keep to the new
`~/local.gitconfig` file.

From now on you SHOULD NOT use the `git config --global` command to update your
Git configuration. If you do, this command will update the file symlinked from
`~/.gitconfig`. To avoid this, you SHOULD instead directly edit the
`~/local.gitconfig` file.

You MAY also edit the `~/local.gitignore` file to configure global
[ignore rules](https://git-scm.com/docs/gitignore). By default, this file
adds rules to ignore files or directories named `__TODO__`, `__NOTES__` or
`__SCRIPTS__` in any Git repository anywhere on your local filesystem. It
means the contents of these paths will be private to you and will not be
committed to source control.

### Git configuration: signing Git commits

Some manual configuration steps are required if you want to sign your Git
commits using a GnuPG (aka. GPG) key.

To set this up, first check if you already have a GPG key pair:

```sh
gpg --list-secret-keys --keyid-format=long
```

The key ID is the bit on the `sec` line after the first `/`:

```
sec   <key-type>/<key-id> <creation-date>
```

In the following example, the key ID is `3AA5C34371567BD2`:

```
sec   rsa4096/3AA5C34371567BD2 2025-09-15 [SC]
      C142F66F50AC8C832C8CF7553AA5C34371567BD2
```

If you already have a key you can reuse – one that matches the email address
associated with your GitHub/GitLab account – then use the following command
to export the public key, and copy the output into your GitHub/GitLab account
(in **Settings** → **SSH and GPG keys**).

```sh
gpg --armor --export <key-id>
```

If you don't already have a suitable GPG key, create one with the following
command.

```sh
gpg --full-generate-key
```

At the prompts, choose RSA, 4096 bits, and optionally set an expiration time.
For your uid, use the same email address you use to create Git commits that
will be pushed to GitHub/GitLab. If you use a private email alias provided
by GitHub, use that.

Optionally, you can set a passphrase to protect your private key. If you set
a passphrase, you'll need to enter it each time you use the key (though the
GPG agent will cache passphrases for a while).

If you set a passphrase for your key, add the following line to your
`~/local.bashrc`. This tells GPG to use the current terminal for passphrase
prompts. When committing to a Git repository, you will be prompted for your
GPG key's passphrase via a prompt within the CLI.

```
export GPG_TTY=$(tty)
```

Re-source your `~/local.bashrc` for the change to take effect.

Before adding the GPG key to your Git config, check that you've configured
your key correctly. You can do this by using it to sign an arbitrary piece
of text:

```sh
echo "test" | gpg --clearsign
```

You should be prompted for your GPG key's passphrase (if set) and you will
see the signed text output.

Now add the following to your `~/local.gitconfig` file, replacing `<key-id>`
with your actual key ID.

```ini
[user]
  signingkey = <key-id>
```

You can now sign commits and tags on a case-by-case basis:

```sh
git commit -S -m "Your commit message"
git tag -s v1.0 -m "Version 1.0"
```

Once you've verified this works as expected, you can make this the default
behavior for all commits and tags. In `~/local.gitconfig`:

```ini
[commit]
  gpgsign = true

[tag]
  gpgsign = true
```

Finally, before you push any signed commits, you need to export your public
key, and copy the output into your GitHub/GitLab account (in Settings → SSH
and GPG keys). Once set up, a "verified" badge will be shown next to your
signed commits in the upstream repository's GUI.

```sh
gpg --armor --export <key-id>
```

### Windows configuration

The main configuration steps above work fine when using Git exclusively in
the WSL environment. But if you are committing from a Windows GUI client (eg.
VS Code's built-in Git client, or GitHub Desktop), you will need some
additional configuration so that you are prompted for your GPG key's passphrase
via the Windows GUI.

The following additional steps are required only if you use a
passphrase-protected GPG key to sign your Git commits, and if you are using
a Git client that's installed on your Windows host to interact with Git
repositories installed in the WSL guest system.

The solution is to download and install [GPG4Win](https://www.gpg4win.org), and
configure Git in WSL to use GPG4Win's `gpg.exe` Windows binary, rather than
the `gpg` binary installed in WSL.

In WSL, create a wrapper script for GPG4Win's `gpg.exe`:

```sh
sudo vim /usr/local/bin/gpgwin
```

Add the following contents:

```sh
#!/bin/bash

/mnt/c/Program\ Files\ \(x86\)/GnuPG/bin/gpg.exe "$@"
```

Make it executable:

```sh
sudo chmod +x /usr/local/bin/gpgwin
```

Configure Git to use the wrapper script instead of the default `gpg` binary.
In `~/local.gitconfig`:

```ini
[gpg]
  program = /usr/local/bin/gpgwin
```

This configuration means that only Git will use GPG4Win's `gpg.exe` binary,
and not the Linux `gpg` binary installed in WSL – typically found at
`/usr/bin/gpg`. If you saved the Windows wrapper as `/usr/local/bin/gpg`,
this would take precedence over the `/usr/bin/gpg` binary, and thus all
`gpg` executions in WSL would use the wrapper.

Export your GPG key pair from WSL, and import the keys into GPG4Win:

```sh
gpg --armor --export-secret-keys YOUR_EMAIL > private.key
gpg --armor --export YOUR_EMAIL > public.key
```

Copy the files to somewhere on the Windows filesystem.

Open Kleopatra (an OpenPGP certificate and key management utility that is
installed with GPG4Win). Go to **File -> Import Certificates**, and import
both the `public.key` and `private.key` files you exported from WSL. The
key should now be listed in Kleopatra, under **Certificates**.

Alternatively, you can import the keys via the command line:

```powershell
cd C:\path\to\your\keys

# Import private key first (this usually imports the public key too)
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --import private.key

# Import public key (if needed)
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --import public.key
```

Verify the import:

```powershell
# List secret keys
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --list-secret-keys

# List public keys
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --list-keys
```

> [!IMPORTANT]
> Delete the original `public.key` and `private.key` files after importing
> them to GPG.

To test the configuration, make a commit from a Windows GUI Git client, and
you should be prompted for your GPG key's passphrase via a Windows GUI
"pinentry" dialog. Also test via WSL, using either of the below commands.
Because this is expected to use the native `gpg` binary installed in WSL,
you will see the default terminal prompt for your passphrase.

```sh
# Sign an arbitrary piece of text.
echo "test" | gpg --clearsign

# Create a signed commit (may be empty).
git commit --allow-empty -m "test signed commit"
```

> [!TIP]
> Your passphrase is held in memory by the GPG agent. You need to restart
> the agent to clear the cached passphrase. For the native Linux agent you
> would use:
>
> ```sh
> gpgconf --kill gpg-agent
> ```
>
> But of course you're now using the Windows agent, so you need to issue the
> following command from Powershell or the regular Command Prompt:
>
> ```powershell
> taskkill /f /im gpg-agent.exe
> ```
>
> On the next GPG command, it will take a few seconds for the agent to startup,
> and then you will be prompted for your passphrase again.
>
> You can use Kleopatra to manage your GPG configuration. For example, to
> adjust the period of time that your key passphrases are "remembered" for,
> go to **Settings > Configure Kleopatra > GnuPG System > Private Keys**. Locate
> the **Expire cached PINS after N seconds** and **Set maximum PIN cache lifetime to N seconds**
> settings, and adjust their values to your desired duration (in seconds).
> For instance, 86400 seconds is equivalent to one day.

It is RECOMMENDED to start the GPG agent automatically when you log in to
Windows, otherwise the pinentry dialog may not appear when you first try to
sign a commit from a Git GUI running on the Windows host, like VS Code. To do
this, create a shortcut to `C:\Program Files (x86)\GnuPG\bin\gpg-agent.exe`
from your Windows startup folder (press `Win+R` then type `shell:startup` to
open the folder).

### Prompt themes

A couple of different solutions for customizing the command line prompt are
included with these dotfiles.

The first solution depends on [Oh-My-Posh](https://ohmyposh.dev/), a
cross-platform prompt theming framework. It means the prompt theme can be
used in Powershell, Git Bash, WSL, and other shells. The theme is enabled
via the following command in the `~/local.bashrc` file. You just need to
uncomment the line to enable it.

```sh
eval "$(oh-my-posh init bash --config ~/.prompt-themes/oh-my-posh/ocean.omp.json 2> /dev/null)"
```

Then either restart the terminal or call the `reload!` function to re-source
the shell startup scripts.

Alternatively, you can enable the `git-prompt.sh` or `git-prompt-simple.sh`
scripts, both of which add Git repo information to the standard prompt line.
Uncomment the following lines in the `~/local.bashrc` file, instead.

```sh
source ~/.prompt-themes/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_UPSTREAMEQUALS=""

# Or:
source ~/.prompt-themes/git-prompt-simple.bash
```

## 💻 Usage

### Shell environment variables

In Bash the `PATH` environment variable is extended to include `$HOME/bin`
and `$HOME/.local/bin`, if those directories exist. `$HOME/bin` takes priority.

### Shell aliases

The following shell aliases are enabled. All are POSIX-compliant unless
otherwise noted.

#### Navigation

- `..` → `cd ..`
- `...` → `cd ../..`
- `....` → `cd ../../..`
- `.....` → `cd ../../../..`

#### File listing

- `ls`  → `ls --color` — Always use colorized output.
- `l` → `ls -laF --color` — List all files (inc. hidden) in long-form.
- `ld` → `ls -laF --color \| grep --color=never '^d'` — List only directories.
- `lf` → `ls -laF --color \| grep --color=never '^-'` — List only files.

#### File operations

- `mkdir` → `mkdir -p` — Make directories recursively by default.
- `rm` → `rm -i` — Always prompt for confirmation.
- `cleanup` → `find . -type f -name '*.DS_Store' -ls -delete` — Recursively
  delete macOS `.DS_Store` files.

#### Search

- `grep` → `grep --color=auto`
- `fgrep` → `grep -F --color=auto`
- `egrep` → `grep -E --color=auto`

#### Git

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

#### Docker

- `d` → `docker`
- `dc` → `docker-compose`
- `dm`  → `docker-machine`
- `dsa` → `docker stop $(docker ps -a -q)` — Stop all containers.

#### Go

- `gotest` → `go test $(go list ./... \| grep -v /vendor/)`

- `gocover` → `go test -coverprofile=coverage.out && go tool cover -html=coverage.out`

- `golint` → `golint $(go list ./... \| grep -v /vendor/)`

#### Editors

- `vi` → `nvim` — Map `vi` to Neovim. The original `vi` is still available as `\vi`.

- `vim` → `nvim` — Map `vim` to Neovim. The original `vim` is still available as `\vim`.

#### HTTP / network

- `sniff` → `sudo ngrep -d 'en1' -t '^(GET\|POST) ' 'tcp and port 80'` —
  Capture HTTP requests on the `en1` interface.

- `httpdump` → `sudo tcpdump -i en1 -n -s 0 -w - \| grep -a -o -E "Host: .*\|GET /.*"` —
  Dump HTTP traffic on the `en1` interface.

- `show80` → `sudo lsof -iTCP -sTCP:LISTEN -Pnl \| grep :80` —
  Show what is listening on port 80.

#### Misc

- `s` → `sudo` — Shortcut for `sudo` ("superuser do").
- `reload!` → `. ~/.bashrc` — Reload the Bash shell startup scripts.

### Shell functions

The following shell functions are enabled.

- `buildDockerImage [image_name]` — Build a Docker image from the `Dockerfile`
  in the current directory. If `image_name` is omitted, the image is built
  without a tag.

- `runDockerContainer <image_name>` — Run a Docker container in the background,
  from the named image.

- `runDockerFromFile [image_name]` — Build an image from the `Dockerfile` in the
  current directory and immediately run a container from it in the background.

- `listDockerImages` — List all locally available Docker images.

- `sshDockerContainer <container_id>` — Open an interactive Bash shell inside
  a running container.

### Git config

The `.gitconfig` file modifies Git's default behavior in the following ways:

- `git merge` always records explicit merge commits (ie. `--no-ff` is the default).

- `git log` uses a custom one-line default format (`format.pretty`) showing
  the abbreviated hash, ref decorations, subject, ISO date, and author. Pass
  `--pretty=` explicitly to override this in scripts.

- `git fetch` automatically prunes refs to non-existent upstream branches and
  deletes non-existent tags.

- `git pull` rebases by default.

- `--autosquash` and `--autostash` rules are automatically applied on rebase
  operations.

- `--update-refs` is applied to rebases, making it easier to rebase stacked
  branches.

- `git push` pushes new tags as well as new commits, and tracks the upstream
  branch automatically.

- Upstream branches are tracked automatically, and tracked branches are
  constrained to have the same names.

- The `histogram` diff algorithm is used in place of the default `myers`.

- Merge conflicts are rendered in `zdiff3` style, which includes the original
  common-ancestor text.

- `rerere` ("reuse recorded resolution") is enabled — conflict resolutions are
  recorded and replayed automatically.

- The default branch name for new repositories is `dev`.

- Git LFS filters are pre-configured.

- Opts-out of security checks for Git repositories on external storage devices
  (`safe.directory`).

### Other configurations

- **Git Bash completion** is loaded from `dist/completions/git-completion.bash`.

- **Oh-My-Posh** themes are available in `home/.prompt-themes/oh-my-posh/`;
  alternative `git-prompt.sh` and `git-prompt-simple.bash` prompts are also
  provided. These must be explicitly enabled via `local.bashrc`.

## 🙏 Acknowledgments

These dotfiles integrate the following third-party components:

- [Git Bash completion script](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash)
- [Nicolas Gallagher's Bash prompt](https://github.com/necolas/dotfiles/blob/master/shell/bash_prompt)

For the custom scripts and configuration, inspiration has been taken – and, in
some cases, code shamelessly copied – from some of these related projects:

- [Sebastien Rousseau's dotfiles.io](https://dotfiles.io/)
- [Thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles)
- [Nicola Paolucci's dotfiles](https://github.com/durdn/cfg)
- [YADR – Yet Another Dotfile Repo](https://github.com/skwp/dotfiles)
- [Ramesh Padmanabhaiah's Base framework](https://github.com/codeforester/base)
- [Phil Haack's dotfiles](https://github.com/haacked/dotfiles)
- [Michael Biven's dotfiles](https://github.com/michaelbiven/dotfiles)
- [Nicolas Gallagher's OS X dotfiles](https://github.com/necolas/dotfiles)
- [GitHub Codespaces examples dotfiles](https://github.com/codespaces-contrib/dotfiles)
- [Git Wiki: Aliases](https://git.wiki.kernel.org/index.php/Aliases)

## 📓 Developer documentation

See the [contributing guidelines](./CONTRIBUTING.md).

-----

Copyright © 2020-present Kieran Potts, [MIT license](./LICENSE.txt)
