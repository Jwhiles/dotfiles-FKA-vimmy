local Remap = require('remap')
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- leader p to paste without emptying paste register!!!
xnoremap("<leader>p", "\"_dP")

-- junegun/fzf.vim
nnoremap("<leader><space>", ":GFiles<CR>")
nnoremap("<leader>FF", ":Files<CR>")
nnoremap("<leader>cc", ":History:<CR>")
nnoremap("<leader>ff", ":Rg<CR>")
nnoremap("<leader>fb", ":Buffers<CR>")

-- szw/vim-maximizer
nnoremap("<leader>m", ":MaximizerToggle!<CR>")


-- Map escape to turn off search highlighting
nnoremap("<esc>", ":noh<return><esc>")
--needed so that vim still understands escape sequences
nnoremap("<esc>^[", "<esc>^[]")
