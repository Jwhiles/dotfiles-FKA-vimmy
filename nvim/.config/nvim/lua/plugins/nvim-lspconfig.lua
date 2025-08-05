-- Configure language server protocols
-- https://github.com/neovim/nvim-lspconfig

local common_on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }

	local function map(key, func, desc)
		vim.keymap.set('n', key, func, vim.tbl_extend('force', bufopts, {desc = desc}))
	end

	map('gD', vim.lsp.buf.declaration, 'Go to declaration')
	map('gd', vim.lsp.buf.definition, 'Go to definition')
	map('K', vim.lsp.buf.hover, 'Show hover information')
	map('gi', vim.lsp.buf.implementation, 'Go to implementation')
	map('<C-k>', vim.lsp.buf.signature_help, 'Show signature help')
	map('<space>D', vim.lsp.buf.type_definition, 'Go to type definition')
	map('<space>rn', vim.lsp.buf.rename, 'Rename symbol')
	map('<space>ca', vim.lsp.buf.code_action, 'Code actions')
	map('gr', vim.lsp.buf.references, 'Show references')
  map('<leader>q', vim.diagnostic.setqflist, "Populate quick fix list with diagnostics")
  map('<leader>f', function() 
  	vim.lsp.buf.format { filter = function(client) return client.name ~= "ts_ls" end } 
  end, "Format buffer") 
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
			gopls = {
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

