-- Fuzzy finder
-- https://github.com/ibhagwan/fzf-lua

return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	keys = {
		{ "<leader>ff",       "<cmd>FzfLua live_grep_native<cr>",      desc = "Grep" },
		{ "grc",              "<cmd>FzfLua grep_cword<cr>",            desc = "Grep word under cursor" },
		{ "grC",              "<cmd>FzfLua grep_cword<cr>",            desc = "Grep WORD under cursor" },
		{ "<leader><space>",  "<cmd>FzfLua files<cr>",                 desc = "Find files" },
		{ "<leader>fb",       "<cmd>FzfLua buffers<cr>",               desc = "Find buffers" },
		{ "<leader>km",       "<cmd>FzfLua keymaps<cr>",               desc = "View keymaps" },
		{ "<leader>sh",       "<cmd>FzfLua search_history<cr>",        desc = "Search history" },
		{ "<leader>sc",       "<cmd>FzfLua git_bcommits<cr>",          desc = "Source control commits" },
		{ "<leader>ch",       "<cmd>FzfLua command_history<cr>",       desc = "Command history" },
		{ "gd",               "<cmd>FzfLua lsp_definitions<cr>",       desc = "LSP definitions" },
		{ "gr",               "<cmd>FzfLua lsp_references<cr>",        desc = "LSP references" },

		-- { "ss",  "<cmd>FzfLua spell_suggest<cr>",         desc = "Spell suggest" },
		-- { "ft",  "<cmd>FzfLua filetypes<cr>",             desc = "Change file-types" },
		-- { "ht",  "<cmd>FzfLua help_tags<cr>",             desc = "Help tags" },
		-- { "hg",  "<cmd>FzfLua highlights<cr>",            desc = "Highlights" },
		-- { "li",  "<cmd>FzfLua lsp_implementations<cr>",   desc = "LSP implementations" },
		-- { "ltd", "<cmd>FzfLua lsp_typedefs<cr>",          desc = "LSP type definitions" },
		-- { "lds", "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "LSP document symbols" },
		-- { "lws", "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "LSP workspace symbols" },
		-- { "ca",  "<cmd>FzfLua lsp_code_actions<cr>",      desc = "LSP code actions" },
	},

	config = function()
		require('fzf-lua').setup({
			keymap = {
				fzf = {
					true,
					-- Use <c-q> to select all items and add them to the quickfix list
					["ctrl-q"] = "select-all+accept",
				},
			},
		})
	end,
}
-- my old keybinds
-- vim.cmd([[
-- " junegun/fzf.vim
-- nnoremap <leader><space> :GFiles<CR>
-- nnoremap <leader>FF :Files<CR>
-- nnoremap <leader>cc :History:<CR>
-- nnoremap <leader>ff :Rg<CR>
-- nnoremap <leader>fb :Buffers<CR>
-- inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
--     \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
--     \ fzf#wrap({'dir': expand('%:p:h')}))
-- if has('nvim')
--   au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
--   au! FileType fzf tunmap <buffer> <Esc>
-- endif
-- ]])
--
-- -- junegun/fzf.vim
-- nnoremap("<leader><space>", ":GFiles<CR>")
-- nnoremap("<leader>FF", ":Files<CR>")
-- nnoremap("<leader>cc", ":History:<CR>")
-- nnoremap("<leader>ff", ":Rg<CR>")
-- nnoremap("<leader>fb", ":Buffers<CR>")
