o = vim.o

o.wrap = false
o.tabstop = 4
o.shiftwidth = 4
o.updatetime=100 -- time until update
o.timeoutlen = 300

-- Show absolute number on active line, relative numbers on others
o.number = true
o.relativenumber = true
o.inccommand = "split"

-- Search stuff good
o.ignorecase =true -- search case insensitive
o.smartcase=true -- search via smartcase
o.incsearch=true -- search incremental


-- don't bother with backup files
o.writebackup=false
o.cmdheight=1
o.undofile=true -- persists undo tree


-- copy to the system clipboard
o.clipboard='unnamedplus' 


-- Better auto indentation
o.autoindent = true
o.copyindent = true
o.breakindent = true


-- Enable spell checking
o.spelllang = "en_gb" 
o.spell = true

-- Maximum of five items in auto-complete
o.pumheight = 5

-- Allow editing macros
vim.keymap.set('n', "<leader>Q", [[:let @q = input("Edit macro:", @q)<CR>]])

o.autoread = true

-- Disable modelines
o.modeline = false

o.confirm = true
o.scrolloff = 5 -- keep 5 lines above/below cursor
o.splitbelow = true
o.splitright = true
