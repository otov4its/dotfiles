" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" Turning on base settings
filetype plugin indent on
syntax on

set autoread			" automatically read a file when it was modified outside of Vim
set nobackup			" keep a backup after overwriting a file
set backspace=indent,eol,start	" allow backspacing over everything in insert mode
set history=100			" keep maximum 10000 lines of command line history
set showcmd			" display incomplete commands
set ruler			" show the cursor position all the time
set visualbell			" use a visual bell instead of beeping
set incsearch			" do incremental searching
set ignorecase			" ignore case when using a search pattern
set number			" line numbers
set cursorline			" show a visual line under the cursor's current line
set wildmode=full		" specifies how command line completion works
set wildmenu			" command-line completion shows a list of matches
set hlsearch			" highlight all matches for the last used search pattern
set laststatus=2
set mouse=a

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		\ | wincmd p | diffthis
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


"=====================================================
" Vim Addon Manager (VAM) settings
"=====================================================
fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()

" ACTIVATING PLUGINS
VAMActivate
	\	gruvbox
	\	vim-signify
	\	Solarized
	\	Darcula_Color_Scheme
	\	vim-airline
	\	ctrlp
	\	Python-mode-klen
	\	jedi-vim
	\	Syntastic
	\	YouCompleteMe
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


"=====================================================
" Airline settings
"=====================================================
let g:airline#extensions#virtualenv#enabled = 1 " Show virtualenv in status bar
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


"=====================================================
" Color scheme
"=====================================================
set bg=dark
set t_Co=256
let g:gruvbox_italic=1
colorscheme gruvbox
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


"=====================================================
" Jedi-vim settings
"=====================================================
" Октлючаем комплит (вместо этого используется Ycm)
let g:jedi#completions_enabled = 0
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


"=====================================================
" Syntastic settings
"=====================================================
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ['pylama']
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


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
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


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
"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

