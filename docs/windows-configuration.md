# Windows configuration

The main [configuration](./configuration.md) steps work fine when using Git exclusively in the WSL environment. But if you are committing from a Windows GUI client (eg. VS Code's built-in Git client, or GitHub Desktop), you will need some additional configuration so that you are prompted for your GPG key's passphrase via the Windows GUI.

**The following additional steps are required only if you use a passphrase-protected GPG key to sign your Git commits, and if you are using a Git client that's installed on your Windows host to interact with Git repositories installed in the WSL guest system.**

The solution is to download and install [GPG4Win](https://www.gpg4win.org), and configure Git in WSL to use GPG4Win's `gpg.exe` Windows binary, rather than the `gpg` binary installed in WSL.

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

To test the configuration, make a commit from a Windows GUI Git client, and you should be prompted for your GPG key's passphrase via a Windows GUI "pinentry" dialog. Also test via WSL, using either of the below commands. Because this is expected to use the native `gpg` binary installed in WSL, you will see the default terminal prompt for your passphrase.

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
