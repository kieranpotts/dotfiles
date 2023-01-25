# Installation

*****
**Disclaimer**: Some of the operations enabled by this dotfiles configuration are potentially destructive. For example, some Git aliases rewrite commit histories. If you choose to use these tools, you do so at your own risk.
*****

Clone this repository to any location on your local filesystem:

```sh
git clone git@github.com:kieranpotts/dotfiles.git
```

Change to the root directory of the cloned repository and run the `bin/update.sh` script. Bash is the only shell supported at this time. If using Git Bash for Windows, the shell MUST be run with administrator privileges in order for the necessary symlinks to be created.

```sh
cd dotfiles
bash bin/update.sh
```

This will install and enable the dotfiles configuration. The first time you do this, you will need to exit the shell then login again. Doing so will create a new login shell, which will load the newly-installed dotfiles configuration at startup.

The installation script will attempt to replace the following files in your home directory. If you already have any of these files, they will be renamed with the ".backup" prefix – for example, your existing `~/.bashrc` file will be renamed `~/.backup.bashrc`.

- `~/.bash_profile`
- `~/.bashrc`
- `~/.gitconfig`
- `~/.profile`

## Oh My Posh installation

Oh My Posh is an optional dependency. If installed on your system, it will be used to customize your terminal's prompt line. The following instructions cover installation and configuration of Oh My Posh for Git Bash for Windows. For WSL follow the instructions for [Linux](https://ohmyposh.dev/docs/linux), and for macOS see [here](https://ohmyposh.dev/docs/macos).

Except for the minimalist themes that don't render any icons, you will need to install a [Nerd Font](https://ohmyposh.dev/docs/config-fonts). These fonts are extended with additional characters that are used in the prompt line. Meslo LGN NF is recommended for use with Oh My Posh. Cascadia Code is another popular option and is shipped with Windows Terminal, but you will need to download and install [Cascadia Code PL](https://github.com/microsoft/cascadia-code/releases), a fork of Cascadia Code that Microsoft maintains with added support for Powerline glyphs.

When you've installed the Nerd Font of your choice, set your terminal to use that font. Windows Terminal you can configure to use the font in the Git Bash profile only. If you have Git Bash configured as the default profile for VSCode's integrated terminal, you will also need to enable the Nerd Font in VSCode's integrated terminal too, eg:

```json
{
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.fontFamily": "MesloLGM NF",
}
```

To get Oh My Posh working in Git Bash for Windows, follow these steps:

1. Download the latest [Windows executable](https://github.com/JanDeDobbeleer/oh-my-posh/releases) of Oh My Posh — it will be named something like `posh-windows-amd64.exe`

2. Save this file to `C:\Program Files\Git\usr\bin`, renaming it `oh-my-posh.exe`. Alternatively, you can put this file in any location that is in your system's PATH environment variable.

3. Type the `oh-my-posh` command into Git Bash to check it works.

These dotfiles ship with an Oh My Posh theme based on the popular Agnoster theme. Run the commands below to install other themes. (Note, `wget` is not pre-installed in Git Bash. Download the [binary from here](https://eternallybored.org/misc/wget/) then add the `wget.exe` file to `C:\Program Files\Git\usr\bin` or another location in your PATH.)

```sh
$ mkdir ~/poshthemes
$ wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/poshthemes/themes.zip
$ unzip ~/poshthemes/themes.zip -d ~/poshthemes
$ chmod u+rw ~/poshthemes/*.json
$ rm ~/poshthemes/themes.zip
```

Now change the `oh-my-posh init` command in your `~/.local.bash_profile` to enable your desired theme. Example:

```sh
eval "$(oh-my-posh init bash --config ~/poshthemes/clean-detailed.omp.json)"
```

To enable the theme, type `reload!` into your terminal, which will re-source your shell startup scripts.

Oh My Posh is highly customizable — see [the website](https://ohmyposh.dev/docs/) for more options. What is great about Oh My Posh is that, as a consistent cross-platform framework, configurations can be shared between shells. Thus, you can expose your Powershell, Git Bash and WSL environments to the same configuration, so you have a consistent prompt in every terminal.
