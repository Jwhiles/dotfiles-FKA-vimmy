return {
	'nvim-tree/nvim-tree.lua',
	lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle Tree View" },
		{ "<leader>tt", ":NvimTreeFindFileToggle<CR>", desc = "Toggle tree view focused on current file" },
	},
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
		})
	end,
}
