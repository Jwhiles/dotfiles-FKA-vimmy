local Remap = require('remap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap


-- # Leader Key
vim.g.mapleader = " " -- space as leader key

-- # General nice stuff, unrelated to plugins
-- leader p to paste without emptying paste register, in visual mode.
xnoremap("<leader>p", "\"_dP")

-- Go to prev/next diagnostic
nnoremap('g[', vim.diagnostic.goto_prev)
nnoremap('g]', vim.diagnostic.goto_next)

-- short cuts for working with tabs and splits
nnoremap('<leader>tn', ':tabnew<cr>')
nnoremap('<leader>to', ':tabonly<cr>')
nnoremap('<leader>tc', ':tabclose<cr>')
nnoremap('<leader>tm', ':tabmove')
nnoremap('<leader>t<leader>', ':tabnext')

-- close all other splits
nnoremap('<leader>o', ':only<cr>')

-- Map escape to turn off search highlighting
nnoremap("<esc>", ":noh<return><esc>")
--needed so that vim still understands escape sequences
nnoremap("<esc>^[", "<esc>^[]")

-- junegun/fzf.vim
nnoremap("<leader><space>", ":GFiles<CR>")
nnoremap("<leader>FF", ":Files<CR>")
nnoremap("<leader>cc", ":History:<CR>")
nnoremap("<leader>ff", ":Rg<CR>")
nnoremap("<leader>fb", ":Buffers<CR>")

-- szw/vim-maximizer
nnoremap("<leader>m", ":MaximizerToggle!<CR>")


nnoremap("<C-f>", "<cmd>silent !tmux neww tm-sesh<CR>")



nnoremap("<C-p>", ":Telescope")


nnoremap("<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)
nnoremap("<leader>gm", function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)

vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

-- Harpoon
local harpoonUi = require('harpoon.ui')
local harpoonMark = require('harpoon.mark')
vim.keymap.set('n', '<leader>j', function()
    harpoonUi.nav_file(1)
end)
vim.keymap.set('n', '<leader>k', function()
    harpoonUi.nav_file(2)
end)
vim.keymap.set('n', '<leader>l', function()
    harpoonUi.nav_file(3)
end)
vim.keymap.set('n', '<leader>;', function()
    harpoonUi.nav_file(4)
end)
vim.keymap.set('n', '<leader>af', harpoonMark.add_file)
vim.keymap.set('n', '<leader>sf', harpoonUi.toggle_quick_menu)

-- Make Y behave like D and C
vim.keymap.set('n', 'Y', 'y$')


vim.keymap.set('n', '<leader>\\', '<C-^><CR>')



