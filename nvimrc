" Specify a directory for plugins
"" - For Neovim: ~/.local/share/nvim/plugged
"" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

""" Plug Install Plugins
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sbdchd/neoformat'
Plug 'szw/vim-maximizer'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-surround'
"Plug 'easymotion/vim-easymotion'
call plug#end()


set completeopt=menu,menuone,noselect " better autocomplete options
set mouse=a " if I accidentally use the mouse
set splitright " splits to the right
set splitbelow " splits below
set expandtab " space characters instead of tab
set tabstop=2 " tab equals 2 spaces
set shiftwidth=2 " indentation
set number " show absolute line numbers
set relativenumber " also show relative numbers
set ignorecase " search case insensitive
set smartcase " search via smartcase
set incsearch " search incremental
set diffopt+=vertical " starts diff mode in vertical split
set hidden " allow hidden buffers
set nobackup " don't create backup files
set nowritebackup " don't create backup files
set cmdheight=1 " only one line for commands
set shortmess+=c " don't need to press enter so often
set signcolumn=yes " add a column for sings (e.g. LSP, ...)
set updatetime=520 " time until update
set undofile " persists undo tree
filetype plugin indent on " enable detection, plugins and indents
let mapleader = " " " space as leader key
if (has("termguicolors"))
  set termguicolors " better colors, but makes it sery slow!
endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown
nnoremap <leader>v :e $MYVIMRC<CR>


" Appearance
colorscheme dracula

" junegun/fzf.vim
nnoremap <leader><space> :GFiles<CR>
nnoremap <leader>FF :Files<CR>
nnoremap <leader>cc :History:<CR>
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif

" szw/vim-maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 100
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_term_per_tab = 1
nnoremap <c-y> :Ttoggle<CR>
inoremap <c-y> <Esc>:Ttoggle<CR>
tnoremap <c-y> <c-\><c-n>:Ttoggle<CR>
nnoremap <leader>x :TREPLSendLine<CR>
vnoremap <leader>x :TREPLSendSelection<CR>
if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif

" sbdchd/neoformat
nnoremap <leader>p :Neoformat prettier<CR>


" neovim/nvim-lspconfig
lua require'lspconfig'.tsserver.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>





"augroup SyntaxSettings
"    autocmd!
"    autocmd BufNewFile,BufRead *.tsx set filetype=typescript
"augroup END



""
"" Features
""
"" These options and commands enable some very useful features in Vim, that
"" no user should have to live without.

"" Set 'nocompatible' to ward off unexpected things that your distro might
"" have made, as well as sanely reset options when re-sourcing .vimrc
"set nocompatible

"" automatically update on file changes
"set autoread

"" Attempt to determine the type of a file based on its name and possibly its
"" contents. Use this to allow intelligent auto-indenting for each filetype,
"" and for plugins that are filetype specific.
"filetype indent plugin on

"" Enable syntax highlighting
"syntax on
"color morning


""------------------------------------------------------------
"" Using hidden to allow for easier file switching by suspending buffers
"set hidden

"" Better command-line completion
"set wildmenu

"" Show partial commands in the last line of the screen
"set showcmd

"" Highlight searches
"set hlsearch

"" Map escape to turn off search highlighting
"nnoremap <esc> :noh<return><esc>
"" needed so that vim still understands escape sequences
"nnoremap <esc>^[ <esc>^[]

"" Disable model lines to prevent possible security problems
"set nomodeline


"" --- Basic Usability Options ---

"" Use case insensitive search, except when using capital letters
"set ignorecase
"set smartcase

"" be rid of swp files
"set noswapfile

"" Allow backspacing over autoindent, line breaks and start of insert action
"set backspace=indent,eol,start

"" When opening a new line and no filetype-specific indenting is enabled, keep
"" the same indent as the line you're currently on. Useful for READMEs, etc.
"set autoindent

"" Stop certain movements from always going to the first character of a line.
"" While this behaviour deviates from that of Vi, it does what most users
"" coming from other editors would expect.
"set nostartofline

"" Display the cursor position on the last line of the screen or in the status
"" line of a window
"set ruler

"" Always display the status line, even if only one window is displayed
"set laststatus=2

"" Instead of failing a command because of unsaved changes, instead raise a
"" dialogue asking if you wish to save changed files.
"set confirm

"" Use visual bell instead of beeping when doing something wrong
"set novisualbell

"" And reset the terminal code for the visual bell. If visualbell is set, and
"" this line is also included, vim will neither flash nor beep. If visualbell
"" is unset, this does nothing.
"set t_vb=

"" Set the command window height to 2 lines
"set cmdheight=2

"" Display line numbers on the left
"set number

"" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

"" Use <F11> to toggle between 'paste' and 'nopaste'
"" This can be used to prevent auto indentation from causing headaches
"set pastetoggle=<F11>

"" Force the cursor onto a new line after 80 characters
"set textwidth=80
"" However, in Git commit messages, let’s make it 72 characters
"autocmd FileType gitcommit set textwidth=72
" " Colour the 81st (or 73rd) column so that we don’t type over our limit
"set colorcolumn=+1
"highlight ColorColumn ctermbg=23
" " In Git commit messages, also colour the 51st column (for titles)
"autocmd FileType gitcommit set colorcolumn+=51

""------------------------------------------------------------
"" Indentation settings for using 4 spaces instead of tabs.
"" Do not change 'tabstop' from its default value of 8 with this setup.
"set tabstop=8
"set shiftwidth=2
"set softtabstop=2
"set shiftround
"set expandtab

""------------------------------------------------------------
"" Useful mappings

"" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
"" which is the default
"map Y y$

"" map jk to change mode
"inoremap jk <ESC>

"" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"" short cuts for working with tabs and splits
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>t<leader> :tabnext

"" close all other splits
"map <leader>o :only<cr>

"" search for things with ack
"nnoremap <leader>a :Ack<space>

""------------------------------------------------------------
"" appearance

"" Keep the cursor seven characters from top or bottom of screen
set so=7

"" show invisible characters
set list
set listchars=tab:▸\ ,eol:¬

""------------------------------------------------------------
"" plugin related settings
""
"" ----- NERDTree ------
"" map a shortcut to NERDTree
map <C-n> :NERDTreeToggle<CR>
"" open nerd tree at current file
map <leader>tt :NERDTreeFind<CR>


"" ----- ctrlp.vim  ------
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'
"nnoremap <leader>. :CtrlPTag<cr>             " Leader . to open cp-tags

"" ---- fugitive -----
":set diffopt+=vertical
nnoremap <leader>gg :G <CR>


"" map leader key then s to open the location list
":nnoremap <leader>s :lopen<CR>
":nnoremap <leader>S :lclose<CR>

"" ---- ALE ----
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_delay = 1000


"" ---- syntax highlight js / jsx -----
"" vim-jsx
"let g:jsx_ext_required = 0


" quickly toggle to the last open file
:nnoremap ,, <C-^><CR>

"" " Handle resizing of panes when there are several open
"" set winwidth=84
"" " We have to have a winheight bigger than we want to set winminheight. But if
"" " we set winheight to be huge before winminheight, the winminheight set will
"" " fail.
"" set winheight=5
"" set winminheight=5
"" set winheight=999

"  autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe "normal g`\"" |
"    \ endif


"let g:NERDTreeWinPos = "right"



"map <Leader> <Plug>(easymotion-prefix)

