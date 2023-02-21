# Installation

> **Disclaimer** \
> Some of the operations enabled by this dotfiles configuration are potentially destructive. For example, some Git aliases rewrite commit histories. If you choose to use these tools, you do so at your own risk.

1.  **Clone this repository to any location on your local filesystem.**

    ```sh
    git clone git@github.com:kieranpotts/dotfiles.git
    ```

    Change to the root directory of the cloned repository and run the `bin/update!` shell script. If using Git Bash for Windows, your terminal MUST be run with administrator privileges in order for the script to be able to create the necessary symlinks.

    ```sh
    cd dotfiles
    sh bin/update!
    ```

    The update script will install and enable the dotfiles configuration. The first time you do this, you will need to exit your terminal program then restart it. Doing so will create a new login shell, which will load the newly-installed dotfiles configuration at startup.

2.  **Add the `bin` directory to your system PATH environment variable.**

    The cloned repository's `bin` directory contains various executable programs including `oh-my-posh` and `lazygit` binaries (for Windows only) and various `git-*` shell scripts, which are mapped to Git aliases. It is RECOMMENDED you add the `bin` directory to your system PATH environment variable to make these programs available from the command line.

    From now on, you can run `update!` in your terminal to download and upgrade to the latest dotfiles configuration.

3.  **Install the Nerd Fonts.**

    In the next step you will manually [configure](configuration.md) your shell and utilities like Git, as well as desktop programs like Windows Terminal. Some of those configurations depend upon the following fonts being installed on your system:

    - **Hack**
    - **Hack Nerd Font**

    Hack is a programming font. It adds special ligatures that merge multiple consecutive characters into a single composite glyph, for example `>=` is presented as `≥` and `!=` as `≠`, improving readability without changing the code.

    Hack Nerd Font is a version of the Hack programming font that is extended with special glyphs – in Unicode's [private use range](https://unicode-table.com/en/blocks/private-use-area/) – that are used to create visual design effects – like icons and rounded corners – in the terminal's prompt line.

    I use the standard Hack font in my code editor, and the [Nerd Font](https://ohmyposh.dev/docs/config-fonts) variation to customize the prompt line of my terminal using the Oh-My-Posh.

    Both these fonts are distributed in the `./vendor/fonts` directory and need to be installed manually. The Hack Nerd Font is the Windows-compatible version.

-----

Proceed to the [configuration](configuration.md) step.
