require('kanagawa').setup({
  colors = {
    theme = {
      all = {
        ui = {
          bg_gutter = "none"
        }
      }
    }
  },
})
vim.cmd("colorscheme kanagawa-lotus")

vim.keymap.set('n', '<leader>lm', function() return vim.cmd("colorscheme kanagawa-lotus") end)
vim.keymap.set('n', '<leader>dm', function() return vim.cmd("colorscheme kanagawa-wave") end)
