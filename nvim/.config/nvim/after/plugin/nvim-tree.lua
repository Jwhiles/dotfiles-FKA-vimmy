local Remap = require('remap')
local nnoremap = Remap.nnoremap


require("nvim-tree").setup({})

nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nnoremap("<leader>tt", ":NvimTreeFindFileToggle<CR>")
