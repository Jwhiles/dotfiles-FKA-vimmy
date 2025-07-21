a = vim.api

vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
]])

require('plugins')
require('settings')
require('keymaps')


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

