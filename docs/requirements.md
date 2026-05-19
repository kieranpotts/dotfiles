# Requirements

These dotfiles are intended for use in Bash on Debian-based systems, but I've made some effort to make them as cross-platform compatible as possible. Most of the shell scripts are POSIX-compliant and will therefore run in all Unix shells. They can be used on Windows too, via a Linux emulator like [MSysGit / Git Bash for Windows](https://gitforwindows.org/) or a virtual machine like WSL.

On Debian systems, my [bootstrap scripts](https://github.com/kieranpotts/bootstrap) can be used to install all dependencies, so automating the following steps. For Git Bash on Windows, my [devtools](https://github.com/kieranpotts/devtools) repository bundles most of the required programs, but some of the below steps still need to be done manually.

## REQUIRED programs

The only REQUIRED program is **Git**. The Git configuration has been tested with [Git](https://git-scm.com/) v2.39.1 and is expected to be compatible with versions after 2.35. For Debian distros, run the following command to check which is the current version of Git available via the APT package manager.

```sh
apt-cache policy git
```

If the available version is ≥ v2.35, go ahead and install from the default package registry.

```sh
sudo apt-get update
sudo apt-get install git -y
```

If you want to install a newer version of Git than is available via the package registry, you will need to install from source. Use `wget` to download the source of the desired version. For example, to download the source for Git v2.35.0, run the following command.

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

Run the following command to build and install the Git package. This is a slow operation.

```sh
make prefix=/usr/local all
sudo make prefix=/usr/local install
```

Restart your terminal, then check the installed Git version with the command `git --version`. Use `rm` to clean-up the temporary files and directories created in this process.

## OPTIONAL programs

It is RECOMMENDED to install Git Large File Storage (LFS). This is a Git extension that removes large files from Git repositories, storing them elsewhere and cross-referencing the files from the Git repositories using pointers.

Git LFS is included in the distribution of [Git for Windows](https://gitforwindows.org/), while [packages are available](https://github.com/git-lfs/git-lfs/blob/main/INSTALLING.md) for popular Linux distributions.

Once installed, run the following command to set up Git LFS globally in your local Git instance:

```sh
git lfs install
```

In each Git repository where you want to use Git LFS, run the following command to configure the file types that you'd like Git LFS to manage. Alternatively, you can edit the `.gitattributes` file directly. (Changes to the `.gitattributes` file MUST be committed).

```sh
git lfs track "*.pdf"
```

Then commit and push as normal. Git LFS will automatically manage the large files for you.

To convert existing large files, previously committed to the repository, use the `git lfs migrate` command. See the [Git LFS documentation](https://github.com/git-lfs/git-lfs/blob/main/docs/man/git-lfs-migrate.adoc) for further instructions, and more [about large files on GitHub](https://docs.github.com/en/repositories/working-with-files/managing-large-files/about-large-files-on-github).

----

Besides Git LFS, the following programs are also OPTIONAL:

- [Delta](https://github.com/dandavison/delta)
- [GPG4Win](https://www.gpg4win.org/)
- [Oh-My-Posh](https://ohmyposh.dev/docs/installation/linux)

GPG4Win is required for signing Git commits with a passphrase-protected private key. Delta is used for rendering diffs in Git output. Oh-My-Posh is a cross-platform framework for customizing the terminal prompt line.
