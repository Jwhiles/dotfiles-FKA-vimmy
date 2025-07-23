-- Configure language server protocols
-- https://github.com/neovim/nvim-lspconfig

local common_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  --
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, bufopts)
  vim.keymap.set('n', '<leader>f', function() 
    vim.lsp.buf.format { filter = function(client) return client.name ~= "ts_ls" end } 
  end, bufopts)

end


return {
	'neovim/nvim-lspconfig',
	opts = {
		servers = {
			ts_ls = { 
				on_attach = function(client, bufnr) 
					common_on_attach(client, bufnr)
				end
			},
			eslint = {
				on_attach = function(client, bufnr) 
					common_on_attach(client, bufnr)
				end
			},
			-- rust_analyzer = {
			-- 	settings = {
			-- 		['rust-analyzer'] = {
			-- 			diagnostics = {
			-- 				enable = false,
			-- 			}
			-- 		}
			-- 	}
			-- },
			lua_ls = {
				on_init = function(client)
					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						workspace = { library = { vim.env.VIMRUNTIME } }
					})
				end,
				on_attach = on_attach,
				settings = { Lua = {} }
			},
		}
	},
	inlay_hints = {
		enabled = true,
	},

	config = function(_, opts)
		for server, settings in pairs(opts.servers) do
			vim.lsp.config(server, settings)
			vim.lsp.enable(server)
		end
	end,
}

