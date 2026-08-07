return {
	"MagicDuck/grug-far.nvim",
	opts = {},
	keys = {
		{
			"<leader>fa",
			function()
				require("grug-far").open({ engine = "astgrep" })
			end,
			desc = "ast-grep search/replace",
		},
	},
}
