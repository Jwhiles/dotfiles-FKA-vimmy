
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
	config = function() 
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set('n', '<leader>j', function()
			harpoon:list():select(1)
		end, { desc = "Open harpoon file 1" })

		vim.keymap.set('n', '<leader>k', function()
			harpoon:list():select(2)
		end, { desc = "Open harpoon file 2" })

		vim.keymap.set('n', '<leader>l', function()
			harpoon:list():select(3)
		end, { desc = "Open harpoon file 3" })

		vim.keymap.set('n', '<leader>;', function()
			harpoon:list():select(4)
		end, { desc = "Open harpoon file 4" })

		vim.keymap.set('n', '<leader>af', function() harpoon:list():add() end, { desc = "Add this file to Harpoon list" })
		vim.keymap.set('n', '<leader>sf', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show harpoon files list" })
	end
}
