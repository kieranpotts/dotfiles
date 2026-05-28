# Configuration

The `./run/install` script will have established various symlinks in your home directory for the Unix dotfiles. For example, `~/.gitconfig` will be symlinked to `/path/to/dotfiles/dist/global.gitconfig`.

You SHOULD NOT change the dotfiles symlinks (eg. `~/.gitconfig`) or edit the contents of their target files in this repository's `dist` directory. Instead, you can make changes to your dotfiles configuration via the "local" files that have been added to your home directory – as explained below.

The following files will be added to your home directory.

- `~/local.profile`
- `~/local.bash_profile`
- `~/local.bashrc`
- `~/local.gitconfig`
- `~/local.gitignore`
- `~/local.gitmessage`

These are _not_ symlinked and they are not kept under version control, either. Therefore, you can safely edit these files to make configuration changes in each environment. It's via these "local" files that you extend the "global" dotfiles configurations shared via this repository.

> **Tip:** Whenever you make changes to `~/local.bashrc`, you can call the `reload!` function to re-source `~/.bashrc` (which in turn re-sources `~/local.bashrc`), so your changes take effect immediately, without needing to restart the shell session.
>
> ```
> reload!
> ```
>
> Changes to `~/local.bash_profile` or `~/local.profile` require a fresh login shell – either restart your terminal or run `exec bash --login`.

If you already had files like `.profile` or `.gitconfig` in your user directory, the `./run/install` script will have created backups of these files before replacing them. The backup files will be named with the "backup" prefix. For example, your existing `~/.bashrc` file will have been renamed `~/backup.bashrc`. You may need to manually copy-and-paste existing configurations from the old "backup" files to the new "local" files.

## Git configuration

You MUST edit the `~/local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects:

```ini
[user]
  email = you@example.com
  name = Your Name
```

> **Tip:** GitHub provides free aliases for your GitHub account's email address, to help keep your personal email address private. You can enable this via your GitHub account's email settings.

When you ran the `./run/install` script, your previous Git configuration would have been backed up to `~/backup.gitconfig`. You SHOULD review the contents of this file and copy any other configurations you wish to keep to the new `~/local.gitconfig` file.

From now on you SHOULD NOT use the `git config --global` command to update your Git configuration. If you do, this command will update the file symlinked from `~/.gitconfig`. To avoid this, you SHOULD instead directly edit the `~/local.gitconfig` file.

You MAY also edit the `~/local.gitignore` file to configure global [ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds rules to ignore files or directories named `__TODO__`, `__NOTES__` or `__SCRIPTS__` in any Git repository anywhere on your local filesystem. It means the contents of these paths will be private to you and will not be committed to source control.

## Git configuration: signing Git commits

Some manual configuration steps are required if you want to sign your Git commits using a GnuPG (aka. GPG) key.

To set this up, first check if you already have a GPG key pair:

```
$ gpg --list-secret-keys --keyid-format=long
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

If you already have a key you can reuse – one that matches the email address associated with your GitHub/GitLab account – then use the following command to export the public key, and copy the output into your GitHub/GitLab account (in Settings → SSH and GPG keys).

----
$ gpg --armor --export <key-id>
----

If you don't already have a suitable GPG key, create one with the following command.

```
$ gpg --full-generate-key
```

At the prompts, choose RSA, 4096 bits, and optionally set an expiration time. For your uid, use the same email address you use to create Git commits that will be pushed to GitHub/GitLab. If you use a private email aliase provided by GitHub, use that.

Optionally, you can set a passphrase to protect your private key. If you set a passphrase, you'll need to enter it each time you use the key (though the GPG agent will cache passphrases for a while).

If you set a passphrase for your key, add the following line to your `~/local.bashrc`. This tells GPG to use the current terminal for passphrase prompts. When committing to a Git repository, you will be prompted for your GPG key's passphrase via a prompt within the CLI.

```
export GPG_TTY=$(tty)
```

Re-source your `~/local.bashrc` for the change to take effect.

Before adding the GPG key to your Git config, check that you've configured your key correctly. You can do this by using it to sign an arbitrary piece of text:

```
echo "test" | gpg --clearsign
```

You should be prompted for your GPG key's passphrase (if set) and you will see the signed text output.

Now add the following to your `~/local.gitconfig` file, replacing `<key-id>` with your actual key ID.

```
[user]
  signingkey = <key-id>
```

You can now sign commits and tags on a case-by-case basis:

```
git commit -S -m "Your commit message"
git tag -s v1.0 -m "Version 1.0"
```

Once you've verified this works as expected, you can make this the default behavior for all commits and tags. In `~/local.gitconfig`:

```
[commit]
  gpgsign = true

[tag]
  gpgsign = true
```

Finally, before you push any signed commits, you need to export your public key, and copy the output into your GitHub/GitLab account (in Settings → SSH and GPG keys). Once set up, a "verified" badge will be shown next to your signed commits in the upstream repository's GUI.

```
$ gpg --armor --export <key-id>
```

## Prompt themes

A couple of different solutions for customizing the command line prompt are included with these dotfiles.

The first solution depends on [Oh-My-Posh](https://ohmyposh.dev/), a cross-platform prompt theming framework. It means the prompt theme can be used in Powershell, Git Bash, WSL, and other shells. The theme is enabled via the following command in the `~/local.bashrc` file. You just need to uncomment the line to enable it.

```sh
eval "$(oh-my-posh init bash --config ~/.prompt-themes/oh-my-posh/ocean.omp.json 2> /dev/null)"
```

Then either restart the terminal or call the `reload!` function to re-source the shell startup scripts.

Alternatively, you can enable the `git-prompt.sh` or `git-prompt-simple.sh` scripts, both of which add Git repo information to the standard prompt line. Uncomment the following lines in the `~/local.bashrc` file, instead.

```sh
source ~/.prompt-themes/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_UPSTREAMEQUALS=""

# Or:
source ~/.prompt-themes/git-prompt-simple.bash
```
