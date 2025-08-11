return {
  "cpplain/flexoki.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
	keys = {
		{  '<leader>lm', function() vim.o.background = 'light' end, { desc = 'Switch to Light Mode theme' } },
		{  '<leader>dm', function() vim.o.background = 'dark'  end, { desc = 'Switch to Dark Mode theme' } } 
	},
	config = function()
		vim.cmd([[colorscheme flexoki]])

		require("flexoki").setup({
			plugins = {
				"nvim_treesitter_context",
				"which_key",
			}
		})
	end,
}
