-- -- Options (see available options below)
-- require('rose-pine').setup({
-- 	--- @usage 'auto'|'main'|'moon'|'dawn'
-- 	variant = 'dawn',
-- 	--- @usage 'main'|'moon'|'dawn'
-- 	dark_variant = 'main',
-- })


-- -- Load colorscheme after options
-- vim.cmd('colorscheme rose-pine')
--
-- vim.cmd[[colorscheme dracula]]
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
