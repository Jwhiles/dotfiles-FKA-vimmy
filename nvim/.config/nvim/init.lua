o = vim.o
a = vim.api

vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
]])
require('plugins')

o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.updatetime=520 -- time until update
o.timeoutlen = 300

-- Show absolute number on active line, relative numbers on others
o.number = true
o.relativenumber = true
o.inccommand = "split"

-- Search stuff good
o.ignorecase =true -- search case insensitive
o.smartcase=true -- search via smartcase
o.incsearch=true -- search incremental


-- don't bother with backup files
o.writebackup=false
o.cmdheight=1
o.undofile=true -- persists undo tree


-- copy to the system clipboard
o.clipboard='unnamedplus' 


-- Better auto indentation
o.autoindent = true
o.copyindent = true
o.breakindent = true


-- Enable spell checking
o.spelllang = "en_gb" 
o.spell = true

-- Maximum of five items in auto-complete
o.pumheight = 5

vim.g.mapleader = " " -- space as leader key


require('old')
require('keymaps')

-- Allow editing macros
vim.keymap.set('n', "<leader>Q", [[:let @q = input("Edit macro:", @q)<CR>]])

-- # Auto Commands

-- reload config on save
a.nvim_create_autocmd('BufWritePost', {
  pattern = "*/nvim/*.lua",
  callback = function()
    local filepath = vim.fn.expand("%")

    dofile(filepath)
    vim.notify("Configuration reloaded \n" ..      filepath, nil)
  end,
  group = mygroup,
  desc = "Reload config on save",
})

-- autoformat code on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.php", "*.vue", "*.js", "*.ts", "*.tsx", "*.json", "*.css",
    "*.scss", "*.html"
  },
  callback = function()
    -- noop if no lsp
    vim.lsp.buf.format()
  end,
  group = mygroup,
  desc = "Autoformat code on save",
})


-- disable diagnostics for .env files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".env",
  callback = function()
    vim.diagnostic.disable()
  end,
  group = mygroup,
  desc = "Disable diagnostics for .env files",
})


-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = mygroup,
  desc = "Briefly highlight yanked text",
})

-- Disable some plugins that are not needed
for _, plugin in pairs({
    "netrwFileHandlers",
    "2html_plugin",
    "spellfile_plugin",
    "matchit"
}) do
    vim.g["loaded_" .. plugin] = 1
end

