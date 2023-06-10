# Requirements

## Required dependencies

- A UNIX-like environment – [Git Bash for Windows](https://gitforwindows.org/) is supported
- [Git](https://git-scm.com/) – the dotfiles configuration has been tested with Git v29

## Optional dependencies

- If the `oh-my-posh` utility is available on your system, it will be used to customize your terminal's prompt line. A Windows binary is bundled with this repository and, to use it, all you need to do is add this repository's `bin` directory to your system PATH environment variable. For other systems, follow [these installation instructions](https://ohmyposh.dev/docs/).

- The full version of Vim (`/usr/bin/vim.basic`) is RECOMMENDED. The `.vimrc` file installed from this repository is not compatible with the minimalist version of Vim (`/usr/bin/vim.tiny`), which is installed by default on some Linux distros. To check which version of Vim is installed on your system, run:

  ```sh
  readlink -f `which vi`
  ```

  To install the full version of Vim, `/usr/bin/vim.basic`, run:

  ```sh
  sudo apt update
  sudo apt install vim
  ```
