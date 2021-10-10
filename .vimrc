" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set autoread
set backspace=indent,eol,start
set cmdheight=2
set completeopt=longest,menuone
set cursorline
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set nobackup
set nowritebackup
set number
set ruler
set shortmess+=c
set showcmd
set updatetime=300
set visualbell
set wildmenu
set wildmode=list:longest
" Spaces win tabs
set expandtab
set tabstop=4
set shiftwidth=4
" Indentation
set autoindent
set smartindent
" Mouse support
set mouse=a

filetype plugin indent on
syntax on

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
augroup END

" Mappings
" <Esc> is equal to <Ctrl-[>
" Clear highlightings when hlsearch
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" vim-plug plugin manager
" see commands like :Plug...
" for installing listed plugins run :PlugInstall command
" for updating installed plugins run :PlugUpdate command
" for updating vim-plug itself run :PlugUpgrade command
call plug#begin()
    " Syntax for apparmor files
    " local plugin (syntax file is the symlink to debian distribution)
    Plug '~/.vim/pack/local/start/apparmor'
    " Color scheme
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
call plug#end()

" Gruvbox colorscheme specific settings
let g:gruvbox_italic=1

" Color scheme
set background=dark
if exists("$COLORTERM")
    if has("termguicolors")
        set termguicolors
    endif
    colorscheme gruvbox
endif

" Airline settings
let g:airline_symbols_ascii = 1

