" Specify a directory for plugins
"" - For Neovim: ~/.local/share/nvim/plugged
"" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

""" Plug Install Plugins
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'


Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'szw/vim-maximizer'
Plug 'kassio/neoterm'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" is this doing anything?
Plug 'nvim-lua/completion-nvim'

Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'git@github.com:rose-pine/neovim.git'
Plug 'nvim-lua/plenary.nvim' 
Plug 'ThePrimeagen/harpoon'

call plug#end()

autocmd BufWritePre *.go :silent! lua require('go.format').gofmt()

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

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
" if (has("termguicolors"))
"   set termguicolors " better colors, but makes it sery slow!
" endif
let g:netrw_banner=0 " disable banner in netrw
let g:netrw_liststyle=3 " tree view in netrw
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] " syntax highlighting in markdown
set clipboard=unnamedplus " copy to the system clipboard



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

" neovim/nvim-lspconfig
lua require'lspconfig'.tsserver.setup{}

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

lua << EOF
  -- Options (see available options below)
  vim.g.rose_pine_variant = 'moon'

  -- Load colorscheme after options
  vim.cmd('colorscheme rose-pine')
EOF

"" automatically update on file changes
set autoread

"" Attempt to determine the type of a file based on its name and possibly its
"" contents. Use this to allow intelligent auto-indenting for each filetype,
"" and for plugins that are filetype specific.
filetype indent plugin on

"" Map escape to turn off search highlighting
nnoremap <esc> :noh<return><esc>
"" needed so that vim still understands escape sequences
nnoremap <esc>^[ <esc>^[]

"" Disable model lines to prevent possible security problems
set nomodeline


"" --- Basic Usability Options ---


"" be rid of swp files
set noswapfile

"" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

"" When opening a new line and no filetype-specific indenting is enabled, keep
"" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

"" Stop certain movements from always going to the first character of a line.
"" While this behaviour deviates from that of Vi, it does what most users
"" coming from other editors would expect.
set nostartofline

"" Instead of failing a command because of unsaved changes, instead raise a
"" dialogue asking if you wish to save changed files.
set confirm

"" Quickly time out on keycodes, but never time out on mappings
"set notimeout ttimeout ttimeoutlen=200

" " Colour the 81st (or 73rd) column so that we don’t type over our limit
set colorcolumn=+1
highlight ColorColumn ctermbg=23
" " In Git commit messages, also colour the 51st column (for titles)
autocmd FileType gitcommit set colorcolumn+=51


""------------------------------------------------------------
"" Useful mappings

"" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
"" which is the default
map Y y$


"" short cuts for working with tabs and splits
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

"" close all other splits
map <leader>o :only<cr>


""------------------------------------------------------------
"" appearance

"" Keep the cursor seven characters from top or bottom of screen
set so=7


""------------------------------------------------------------
"" plugin related settings
""
"" ----- NERDTree ------
"" map a shortcut to NERDTree
map <C-n> :NERDTreeToggle<CR>
"" open nerd tree at current file
map <leader>tt :NERDTreeFind<CR>


"" ---- fugitive -----
nnoremap <leader>gg :G <CR>

"" map leader key then s to open the location list
: :nnoremap <leader>s :lopen<CR>
" :nnoremap <leader>S :lclose<CR>

" quickly toggle to the last open file
:nnoremap ,, <C-^><CR>


" remap S to overwrite the word with what's in the register
nnoremap S "_diwP

" HARPOON SHORTCUTS
nnoremap <leader>j <Cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>k <Cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>l <Cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>; <Cmd>lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <leader>af <Cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>sf <Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>



" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    -- ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF


autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
"
" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" I added some changes from https://sharksforarms.dev/posts/neovim-rust/
