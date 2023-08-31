-- Options (see available options below)
require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'dawn',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
})


-- Load colorscheme after options
vim.cmd('colorscheme rose-pine')
