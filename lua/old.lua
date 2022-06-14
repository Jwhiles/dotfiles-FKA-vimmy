vim.cmd([[
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
]])
