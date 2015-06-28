" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax on
if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=100		" keep maximum 10000 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set number		" line numbers
set cursorline		" show a visual line under the cursor's current line
set wildmode=longest,list,full
set wildmenu
set laststatus=2
set mouse=a
set hlsearch

"=====================================================
" Vundle settings
"=====================================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " let Vundle manage Vundle, required
" My plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'alem0lars/vim-colorscheme-darcula'
Plugin 'vim-scripts/vcscommand.vim' " CVS/SVN/SVK/git/hg/bzr integration plugin
Plugin 'ludovicchabant/vim-lawrencium' " Mercurial wrapper
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim' " Ctrl-P fuzzy searcher
"Plugin 'jlanzarotta/bufexplorer' " Buffer explorer
Plugin 'klen/python-mode' " Python mode
Plugin 'davidhalter/jedi-vim' " awesome Python autocompletion with VIM
"Plugin 'mitsuhiko/vim-python-combined'
"Plugin 'vim-scripts/taglist.vim'
"Plugin 'project.tar.gz'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
call vundle#end()
filetype plugin indent on
"=====================================================
"=====================================================


"=====================================================
" Netrw Settings
"=====================================================
let g:netrw_winsize           = 20
let g:netrw_list_hide         = '\.pyc$'
"=====================================================
"=====================================================


"=====================================================
" Airline settings
"=====================================================
let g:airline#extensions#virtualenv#enabled = 1 " Show virtualenv in status bar
"=====================================================
"=====================================================


"=====================================================
" Color scheme
"=====================================================
set t_Co=256
let g:gruvbox_italic=1
colorscheme gruvbox
"=====================================================
"=====================================================


"=====================================================
" Jedi-vim settings
"=====================================================
" Октлючаем комплит (вместо этого используется Ycm)
let g:jedi#completions_enabled = 0
"=====================================================
"=====================================================


"=====================================================
" Syntastic settings
"=====================================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pylama']
"=====================================================
"=====================================================


"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется Ycm)
let g:pymode_rope = 0
" Отключаем документацию (вместо этого используется jedi-vim)
let g:pymode_doc = 0
" Отключаем проверку кода (вместо этого используется Syntastic)
let g:pymode_lint = 0
" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" отключить autofold по коду
let g:pymode_folding = 0
" возможность запускать код
let g:pymode_run = 1
"=====================================================
"=====================================================


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
endif

"=====================================================
" Mappings
"=====================================================
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" Don't use Ex mode, use Q for formatting
map Q gq
" Smooth scrolling
map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>
"=====================================================
"=====================================================

