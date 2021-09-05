" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set hidden
set autoread
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set backspace=indent,eol,start
set history=10000
set showcmd
set ruler
set visualbell
set incsearch
set ignorecase
set number
set cursorline
set wildmode=list:longest
set wildmenu
set hlsearch
set laststatus=2
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

" vim-plug plugin manager
" see commands like :Plug...
" for installing listed plugins run :PlugInstall command
" for updating vim-plug itself run :PlugUpgrade command
" for updating installed plugins run :PlugUpdate command
call plug#begin()
" Color scheme
Plug 'morhetz/gruvbox'
" Syntax for apparmor files
" local plugin with debian distribution
Plug '~/.vim/pack/local/start/apparmor'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

" Color scheme
set background=dark
colorscheme gruvbox

