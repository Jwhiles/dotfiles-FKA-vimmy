local Remap = require('remap')
local nnoremap = Remap.nnoremap

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({})

nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nnoremap("<leader>tt", ":NvimTreeFindFileToggle<CR>")
