" ==============================================================================
" Initialization commands for NeoVim.
"
" https://neovim.io/doc/user/starting.html#config
" https://vimhelp.org/starting.txt.html#vimrc
" ==============================================================================

" Enable automatic detection of file types, where possible.
filetype on

" Enable plugins, and automatically load plugins for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype plugin indent on

" Turn on syntax highlighting, unless Vim is started in diff mode.
syntax on
if &diff
  syntax off
endif

" Disable compatibility to old-time vi.
set nocompatible

" Show line numbers.
set number

" Set 52 and 80 column borders.
" 52 is the recommended line length for Git commit message titles.
set colorcolumn=52,80
hi ColorColumn ctermbg=darkgrey guibg=darkgrey

" Do not wrap lines. Allow long lines to extend as far as the line goes.
"set nowrap

" Doft-wrap lines (ie visually wrap) that would otherwise extend beyond the screen width.
" Wrap at 121 columns, breaking by word rather than character.
set linebreak
set columns=120
set wrap

" These options are used for hard-wrapping when typing (ie automatically inserting new lines).
set textwidth=0
set wrapmargin=0

" Highlight the current cursor line (horizontal).
set cursorline

" Highlight the current cursor column (vertical).
" set cursorcolumn

" Set shift width (ie auto-indent) to 2 spaces.
set shiftwidth=2

" Set tab width to 2 columns.
set tabstop=2

" See multiple spaces as tabstops so <BS> does the right thing.
set softtabstop=2

" Use space characters instead of tabs.
set expandtab

" Get Bash-like tab completions.
set wildmode=longest,list

" Enable spell check (may need to download language package).
"set spell

" While searching though a file, incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Set the commands to save in history default number is 20.
set history=1000

" Enable mouse click.
set mouse=a

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Speed up scrolling in Vim.
set ttyfast

" Use system clipboard.
set clipboard=unnamedplus

" Do not save backup files, it's annoying in version-controlled workspaces!
set nobackup

" Directory to store backup files.
"set backupdir=~/.cache/vim

" Disable creating swap file.
"set noswapfile
