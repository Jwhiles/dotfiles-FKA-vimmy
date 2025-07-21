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

vim.keymap.set('n', '<leader>lm', function() return vim.cmd("colorscheme kanagawa-lotus") end, { desc = 'Switch to Light Mode theme' })
vim.keymap.set('n', '<leader>dm', function() return vim.cmd("colorscheme kanagawa-wave") end, { desc = 'Switch to Dark Mode theme' })
