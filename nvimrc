" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"" Plug Install Plugins
Plug 'dracula/vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'ElmCast/elm-vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fireplace'
Plug 'prettier/vim-prettier'
Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
Plug 'w0rp/ale'
Plug 'tidalcycles/vim-tidal'
Plug 'christoomey/vim-tmux-navigator'
Plug 'leafgarland/typescript-vim'
call plug#end()


"
" Features 
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on
color dracula


"------------------------------------------------------------
" Using hidden to allow for easier file switching by suspending buffers
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches
set hlsearch

" Map escape to turn off search highlighting
nnoremap <esc> :noh<return><esc>
" needed so that vim still understands escape sequences
nnoremap <esc>^[ <esc>^[]

" Disable model lines to prevent possible security problems
set nomodeline


" --- Basic Usability Options --- 

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" be rid of swp files
set noswapfile

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set novisualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines
set cmdheight=2

" Display line numbers on the left
set relativenumber
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
" This can be used to prevent auto indentation from causing headaches
set pastetoggle=<F11>

" Force the cursor onto a new line after 80 characters
set textwidth=80
" However, in Git commit messages, let’s make it 72 characters
autocmd FileType gitcommit set textwidth=72
 " Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1
highlight ColorColumn ctermbg=23
 " In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51

"------------------------------------------------------------
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set tabstop=8
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab

"------------------------------------------------------------
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" short cuts for working with tabs and splits
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" close all other splits 
map <leader>o :only<cr>

" trim that whitespace
map <leader>tw :%s/\s\+$//e<cr>

" stylish haskell
map <leader>H :%!stylish-haskell<cr>

" search for things with ack
nnoremap <leader>a :Ack<space>

"------------------------------------------------------------
" appearance

" enable 256 colors
set t_Co=256

" Keep the cursor seven characters from top or bottom of screen
set so=7

" show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

"------------------------------------------------------------
" plugin related settings
"
" ----- NERDTree ------
" open NERDTree on startup if no other file is opened
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map a shortcut to NERDTree
map <C-n> :NERDTreeToggle<CR>
map <leader>tt :NERDTreeFind<CR>

" ----- ctrlp.vim  ------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/](bower_components|output|node_modules|bundle|build|es|DS_Store)|(\.(swp|ico|git|svn))$'
nnoremap <leader>. :CtrlPTag<cr>             " Leader . to open cp-tags

" ---- fugitive -----
:set diffopt+=vertical


" map leader key then s to open the location list
:nnoremap <leader>s :lopen<CR>
:nnoremap <leader>S :lclose<CR>

" ---- ALE ----
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 1000


" ---- syntax highlight js / jsx -----
" vim-jsx
let g:jsx_ext_required = 0

" ---- clojure stuff ----
" au Filetype clojure nmap <leader>E :%Eval<CR>
" au Filetype clojure nmap <leader>e :Eval<CR>
" au Filetype clojure nmap <c-c><c-k> :Require<cr>  



" quickly toggle to the last open file
:nnoremap ,, <C-^><CR>
 
" Handle resizing of panes when there are several open
set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"" prettier configuration
let g:prettier#config#print_width = 100
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'

