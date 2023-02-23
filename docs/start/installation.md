# Installation

> **Disclaimer** \
> Some of the operations enabled by the dotfiles are potentially destructive. For example, some Git aliases rewrite commit histories. If you choose to use these dotfiles, you do so at your own risk.

Follow these steps to install the dotfiles on a new computer for the first time. After installing, follow the instructions for [configuring](configuring.md) and [updating](updating.md) the dotfiles.

1.  **Clone this repository**

    You may clone this repository to any location on your local filesystem.

    ```sh
    git clone git@github.com:kieranpotts/dotfiles.git
    ```

2.  **Run the update script**

    Change to the root directory of the cloned repository and run the `bin/update!` shell script. If your OS is Windows, your terminal program  MUST be run with administrator privileges in order for the script to be able to create the necessary symlinks.

    ```sh
    cd dotfiles
    sh bin/update!
    ```

    The update script will install and enable the dotfiles configuration. The first time you do this, you will need to exit your terminal program then restart it. Doing so will create a new login shell, which will load the newly-installed dotfiles configuration at startup.

3.  **Add the `bin` directory to your system PATH environment variable**

    This repository's `bin` directory contains various executable programs including `oh-my-posh` and `lazygit` binaries (for Windows only), as well as various `git-*` shell scripts that are mapped to Git aliases. It is RECOMMENDED you add the `bin` directory to your system PATH environment variable, which will make these programs available from the command line.

4.  **Install the Nerd Fonts** (optional step)

    This repository also shares my configurations for programs like Visual Studio Code and Windows Terminal. Some of the program configurations depend upon the following fonts being installed on the local system:

    - Hack
    - Hack Nerd Font

    Hack is a programming font. It adds special ligatures that merge multiple consecutive characters into a single composite glyph, for example `>=` is presented as `≥` and `!=` as `≠`, improving readability without changing the code. Hack Nerd Font is a version of the same font extended with additional glyphs that are used to create visual design effects like icons and rounded corners in a shell's prompt line.

    Both these fonts are included in the `./vendor/fonts` directory and need to be installed manually. The Hack Nerd Font is the Windows-compatible version.

5.  **Create hardlinks to other configuration files**

    While the `update!` script automates most of the work, some steps need to be performed manually.

    My Windows Terminal settings are included with these dotfiles, for easy portability between machines. The file is `etc/wt.json`. In order to enable these settings in WT, follow these steps:

    Open Windows Terminal, go to "Settings", and follow the link to "Open JSON File".

    Now, you have two options. You can either copy-and-paste the contents of `etc/wt.json` into the `settings.json` file that Windows Terminal reads on your computer. Alternatively, you can create a hardlink from WT's `settings.json` file to the `etc/wt.json` file in this repository. The second option is a little more complicated but has the advantage of capturing in the repository any changes you subsequently make to the settings of Windows Terminal.

    To create the hardlink, you must first delete WT's own `settings.json` file.

    Next, run Windows Powershell as Administrator. If you use Windows Terminal for this step, it will recreate it's own `settings.json` file, but that MUST NOT exist for the next step to succeed.

    Run the below Powershell command to create a hard link to the `etc/wt.json` file distributed in this repository. Update the paths as necessary.

    ```powershell
    New-Item -ItemType SymbolicLink -Path "C:\Users\Kieran\AppData\Local\Packages\Microsoft.WindowsTerminal_[hash]\LocalState\settings.json" -Target "C:\path\to\dotfiles\etc\wt.json"
    ```

    Open Windows Terminal to check the changes are effective.
