vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
]])
require('plugins')

-- Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force user to select one from the menu
vim.opt.completeopt="menuone,noinsert,noselect"

vim.opt.mouse="a" -- if I accidentally use the mouse
vim.opt.splitright = true -- splits to the right
vim.opt.splitbelow = true -- splits below
vim.opt.expandtab = true -- space characters instead of tab
vim.opt.tabstop=2 -- tab equals 2 spaces
vim.opt.shiftwidth=2 -- indentation
vim.opt.number = true -- show absolute line numbers
vim.opt.relativenumber = true -- also show relative numbers
vim.opt.ignorecase =true -- search case insensitive
vim.opt.smartcase=true -- search via smartcase
vim.opt.incsearch=true -- search incremental
-- vim.opt.diffopt+=vertical -- starts diff mode in vertical split
vim.opt.hidden=true -- allow hidden buffers
-- vim.opt.nobackup=true -- don't create backup files
-- vim.opt.nowritebackup=true -- don't create backup files
vim.opt.cmdheight=1 -- only one line for commands
-- vim.opt.shortmess+=c -- don't need to press enter so often
-- vim.opt.signcolumn=true -- add a column for sings (e.g. LSP, ...)
vim.opt.updatetime=520 -- time until update
vim.opt.undofile=true -- persists undo tree
-- let g:netrw_banner=0 -- disable banner in netrw
-- let g:netrw_liststyle=3 -- tree view in netrw
-- let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript'] -- syntax highlighting in markdown
vim.opt.clipboard='unnamedplus' -- copy to the system clipboard

vim.g.mapleader = " " -- space as leader key

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
]])

require('old')
-- require('lsp')
require('keymaps')
