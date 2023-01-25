# Requirements

- **UNIX-like environment** – [Git Bash for Windows](https://gitforwindows.org/) is supported
- **[Git](https://git-scm.com/)** – recommended ≥ v29

## Optional dependencies

- **[Oh My Posh](https://ohmyposh.dev/docs/)** is an optional dependency. If the `oh-my-posh` utility is available on your system, it will be used to customize your terminal's prompt line.

  A Windows binary is bundled with this repository, and will be symlinked from your `~/bin` directory. For other systems, following the [installation instructions](https://ohmyposh.dev/docs/).

  To properly render some of the posh themes, you will need to install a [Nerd Font](https://ohmyposh.dev/docs/config-fonts) and configure your terminal to use it. Nerd fonts are fonts extended with special characters, glyphs originally developed for [Powerline](https://github.com/powerline/powerline), a Vim plugin that customizes that Vim statusline. Utilities like Oh My Posh use the same Powerline glyphs to customize the shell prompt.

  Nerd Fonts can be explored on [the Nerd Fonts website](https://www.nerdfonts.com/). MesloLGM NF is a good option. Cascadia Code is another popular option and is shipped with Windows Terminal, but you will need to download and install [Cascadia Code PL](https://github.com/microsoft/cascadia-code/releases), a fork of Cascadia Code that Microsoft maintains with added Powerline glyphs.

  When you've installed the Nerd Font of your choice, simply set your terminal to use that font. If you have Git Bash configured as the default profile for VSCode's integrated terminal, you will also need to enable the Nerd Font in VSCode's integrated terminal too, eg:

  ```json
  {
    "terminal.integrated.defaultProfile.windows": "Git Bash",
    "terminal.integrated.fontFamily": "MesloLGM NF",
  }
  ```
