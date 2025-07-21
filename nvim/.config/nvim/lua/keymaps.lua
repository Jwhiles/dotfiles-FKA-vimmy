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
nnoremap('g[', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
nnoremap('g]', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

-- short cuts for working with tabs and splits
nnoremap('<leader>tn', ':tabnew<cr>', { desc = "Open new tab" })
nnoremap('<leader>to', ':tabonly<cr>', { desc = "Close all tabs beside active tab" })
nnoremap('<leader>tc', ':tabclose<cr>', { desc = "Close current tab" })

-- close all other splits
nnoremap('<leader>o', ':only<cr>', { desc = "Close all other splits" })

nnoremap("<esc>", ":noh<return><esc>", { desc = "Clear search highlighting" })
--needed so that vim still understands escape sequences
nnoremap("<esc>^[", "<esc>^[]")

-- junegun/fzf.vim
nnoremap("<leader><space>", ":GFiles<CR>")
nnoremap("<leader>FF", ":Files<CR>")
nnoremap("<leader>cc", ":History:<CR>")
nnoremap("<leader>ff", ":Rg<CR>")
nnoremap("<leader>fb", ":Buffers<CR>")


nnoremap("<C-f>", "<cmd>silent !tmux neww tm-sesh<CR>", { desc = "Open tmux session picker" })


nnoremap("<C-p>", ":Telescope<CR>", { desc = "Open Telescope" })



vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)


-- Make Y behave like D and C
vim.keymap.set('n', 'Y', 'y$')

vim.keymap.set('n', '\\', '<C-^><CR>')



