# Requirements

- **UNIX-like environment** – [Git Bash for Windows](https://gitforwindows.org/) is supported
- **[Git](https://git-scm.com/)** – tested with v29

## Optional dependencies

- **[Oh My Posh](https://ohmyposh.dev/docs/)** is an optional dependency. If the `oh-my-posh` utility is available on your system, it will be used to customize your terminal's prompt line. A Windows binary is bundled with this repository, and will be symlinked from your `~/bin` directory. For other systems, following the [installation instructions](https://ohmyposh.dev/docs/).

  To properly render some of the posh themes, you will need to install a [Nerd Font](https://ohmyposh.dev/docs/config-fonts) and configure your terminal to use it. Nerd fonts are fonts extended with special glyphs – in Unicode's [private use range](https://unicode-table.com/en/blocks/private-use-area/) – that are used to create visual design effects – like icons and rounded corners – in the terminal's prompt line.

  Nerd Fonts can be explored on [the Nerd Fonts website](https://www.nerdfonts.com/font-downloads). Meslo is a good option. Some [Powerline fonts](https://github.com/powerline/fonts) will work for _some_ Posh themes but not all. Nerd Fonts is a superset of the Powerline glyphs, so some Posh themes will use Nerd Font glyphs that are not available in Powerline fonts. 

  When you've installed the Nerd Font of your choice, simply set your terminal to use that font. If you have Git Bash configured as the default profile for VSCode's integrated terminal, you will also need to enable the Nerd Font in VSCode's integrated terminal too, eg:

  ```json
  {
    "terminal.integrated.defaultProfile.windows": "Git Bash",
    "terminal.integrated.fontFamily": "MesloLGM NF",
  }
  ```
