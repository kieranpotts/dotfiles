" ==============================================================================
" The `~/.vimrc` file contains initialization commands for Vim.
"
" This configuration is compatible with the full version of Vim. Ubuntu 16.04
" LTS, Raspberry Pi OS, and presumably other Debian distros, ship with the
" minimalist version of Vim (`/usr/bin/vim.tiny`), with which this configuration
" file is not compatible. To check which version of Vim is installed, run:
"
" ```
" readlink -f `which vi`
" ```
"
" To install the full version of Vim, `/usr/bin/vim.basic`, run:
"
" ```
" sudo apt update
" sudo apt install vim
" ```
"
" See: https://vimhelp.org/starting.txt.html#vimrc
" ==============================================================================

" Disable compatibility with Vi, which can cause unexpected issues.
set nocompatible

" Enable automatic detection of file types, where possible.
filetype on

" Enable plugins and automatically load plugins for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn on syntax highlighting, unless Vim is started in diff mode.
syntax on
if &diff
  syntax off
endif

" Show line numbers.
set number

" Highlight the current cursor line (horizontal).
set cursorline

" Highlight the current cursor column (vertical).
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files, it's annoying in version-controlled workspaces!
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file, incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000
