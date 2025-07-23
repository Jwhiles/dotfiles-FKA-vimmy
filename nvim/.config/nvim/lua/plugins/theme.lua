return  {
	'rebelot/kanagawa.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa-wave]])
    end,
	keys = {
		{  '<leader>lm', function() return vim.cmd("colorscheme kanagawa-lotus") end, { desc = 'Switch to Light Mode theme' } },
		{  '<leader>dm', function() return vim.cmd("colorscheme kanagawa-wave") end, { desc = 'Switch to Dark Mode theme' } } 
	},
}

