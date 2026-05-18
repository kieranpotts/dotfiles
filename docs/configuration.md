# Configuration

The `./run/install` script will have established various symlinks in your home directory for the Unix dotfiles. For example, `~/.gitconfig` will be symlinked to `/path/to/dotfiles/dist/global.gitconfig`.

> **Important:** You SHOULD NOT change the dotfiles symlinks (eg. `~/.gitconfig`) or edit the contents of their target files in this repository's `dist` directory. Instead, you can make changes to your dotfiles configuration via the "local" files that have been added to your home directory – as explained below.

The following files will be added to your home directory.

- `~/local.profile`
- `~/local.bash_profile`
- `~/local.bashrc`
- `~/local.gitconfig`
- `~/local.gitignore`
- `~/local.gitmessage`

These are _not_ symlinked and they are not kept under version control, either. Therefore, you can safely edit these files to make configuration changes in each environment. It's via these "local" files that you extend the "global" dotfiles configurations shared via this repository.

> **Tip:** Whenever you make changes to any of the "local" shell startup scripts – `~/local.bashrc`, `~/local.bash_profile`, or `~/local.profile` – you can call the `reload!` function to re-source the shell startup scripts, so your changes take effect immediately without needing to restart the shell session.
>
> ```
> reload!
> ```

If you already had files like `.profile` or `.gitconfig` in your user directory, the `./run/install` script will have created backups of these files before replacing them. The backup files will be named with the "backup" prefix. For example, your existing `~/.bashrc` file will have been renamed `~/backup.bashrc`. You may need to manually copy-and-paste existing configurations from the old "backup" files to the new "local" files.

## Git configuration

You MUST edit the `~/local.gitconfig` file to configure your Git user profile information. This data will be embedded in commit objects:

```ini
[user]
  email = you@example.com
  name = Your Name
```

> **Tip:** GitHub provides free aliases for your GitHub account's email address, to help keep your personal email address private. You can enable this via your GitHub account's email settings. If you have a GitHub email alias, you should use that in the `email` field in your local Git config.

When you ran the `./run/install` script, your previous Git configuration would have been backed up to `~/backup.gitconfig`. You SHOULD review the contents of this file and copy any other configurations you wish to keep to the new `~/local.gitconfig` file.

> **Note:** From now on you SHOULD NOT use the `git config --global` command to update your Git configuration. If you do, this command will update the file symlinked from `~/.gitconfig`. To avoid this, you SHOULD instead directly edit the `~/local.gitconfig` file.

You MAY also edit the `~/local.gitignore` file to configure global [Git ignore rules](https://git-scm.com/docs/gitignore). By default, this file adds rules to ignore files or directories named `__TODO__`, `__NOTES__` or `__SCRIPTS__` in any Git repository anywhere on your local filesystem. It means the contents of these paths will be private to you and will not be committed to source control.

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

If you don't already have a GPG key, create one with the following command.

```
$ gpg --full-generate-key
```

At the prompts, choose RSA, 4096 bits, and optionally set an expiration time. For your uid, use the same email address you use to create Git commits that will be pushed to GitHub/GitLab. If you use a private email aliases provided by GitHub, use that.

Optionally, you can set a passphrase to protect your private key. If you set a passphrase, you'll need to enter it each time you use the key (though the GPG agent will cache passphrases for a while).

If you set a passphrase for your key, add the following line to your `~/local.bashrc`. This tells GPG to use the current terminal for passphrase prompts. When committing to a Git repository, you will be prompted for your GPG key's passphrase via a prompt with the CLI.

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

Once you've verified this works as expected, you can make this the default behavior for all commits. In `~/local.gitconfig`:

```
[commit]
  gpgsign = true
```

Finally, before you push any signed commits, you need to export your public key, and copy the output into your GitHub/GitLab account (in Settings → SSH and GPG keys). Once set up, a "verified" badge will be shown next to your signed commits in the upstream repository's GUI.

```
$ gpg --armor --export <key-id>
```

The above configuration works fine when using Git exclusively in the WSL environment. But if you are committing from a Windows GUI client (eg. VS Code's built-in Git client, or GitHub Desktop), you will need some additional configuration so that you are prompted for your GPG key's passphrase via the Windows GUI. The solution is to download and install [GPG4Win](https://www.gpg4win.org), and configure Git in WSL to use GPG4Win's `gpg.exe` Windows binary, rather than the `gpg` binary installed in WSL.

In WSL, create a wrapper script for GPG4Win's `gpg.exe`:

```
$ sudo vim /usr/local/bin/gpgwin
```

Add the following contents:

```
#!/bin/bash

/mnt/c/Program\ Files\ \(x86\)/GnuPG/bin/gpg.exe "$@"
```

Make it executable:

```
$ sudo chmod +x /usr/local/bin/gpgwin
```

Configure Git to use the wrapper script instead of the default `gpg` binary. In `~/local.gitconfig`:

```
[gpg]
  program = /usr/local/bin/gpgwin
```

This configuration means that only Git will use GPG4Win's `gpg.exe` binary, and not the Linux `gpg` binary installed in WSL – typically found at `/usr/bin/gpg`. If you saved the Windows wrapper as `/usr/local/bin/gpg`, this would take precedence over the `/usr/bin/gpg` binary, and thus all `gpg` executions in WSL would use the wrapper.

Export your GPG key pair from WSL, and import the keys into GPG4Win:

```
$ gpg --armor --export-secret-keys YOUR_EMAIL > private.key
$ gpg --armor --export YOUR_EMAIL > public.key
```

Copy the files to somewhere on the Windows filesystem.

Open Kleopatra (an OpenPGP certificate and key management utility that is installed with GPG4Win). Go to **File -> Import Certificates**, and import both the `public.key` and `private.key` files you exported from WSL. The key should now be listed in Kleopatra, under **Certificates**.

Alternatively, you can import the keys via the command line:

```
cd C:\path\to\your\keys

# Import private key first (this usually imports the public key too)
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --import private.key

# Import public key (if needed)
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --import public.key
```

Verify the import:

```
# List secret keys
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --list-secret-keys

# List public keys
"C:\Program Files (x86)\GnuPG\bin\gpg.exe" --list-keys
```

> **Important:** Delete the original `public.key` and `private.key` files after importing them to GPG.

To test the configuration, make a commit from a Windows GUI Git client, and you should be prompted for your GPG key's passphrase via a Windows GUI "pinentry" dialog. Also test via WSL, using either of the below commands; because this is expected to use the native `gpg` binary installed in WSL, you will see the default terminal prompt for your passphrase.

```
# Sign an arbitrary piece of text.
echo "test" | gpg --clearsign

# Create a signed commit (may be empty).
git commit --allow-empty -m "test signed commit"
```

> **Tip:** Your passphrase is held in memory by the GPG agent. You need to restart the agent to clear the cached passphrase. For the native Linux agent you would use:
>
> ```
> $ gpgconf --kill gpg-agent
> ```
>
> But of course you're now using the Windows agent, so you need to issue the following command from Powershell or the regular Command Prompt:
>
> ```
> taskkill /f /im gpg-agent.exe
> ```
>
> On the next GPG command, it will take a few seconds for the agent to startup, and then you will be prompted for your passphrase again.
>
> You can use Kleopatra to manage your GPG configuration. For example, to adjust the period of time that your key passphrases are "remembered" for, go to **Settings > Configure Kleopatra > GnuPG System > Private Keys**. Locate the **Expire cached PINS after N seconds** and **Set maximum PIN cache lifetime to N seconds** settings, and adjust their values to your desired duration (in seconds). For instance, 86400 seconds is equivalent to one day.

It is RECOMMENDED to start the GPG agent automatically when you log in to Windows, otherwise the pinentry dialog may not appear when you first try to sign a commit from a Git GUI running on the Windows host, like VS Code. To do this, create a shortcut to `C:\Program Files (x86)\GnuPG\bin\gpg-agent.exe` from your Windows startup folder (press `Win+R` then type `shell:startup` to open the folder).

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
