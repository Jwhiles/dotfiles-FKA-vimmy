local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.vim/plugged')

-- Plug Install Plugins
-- Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
-- Completion framework
Plug 'hrsh7th/nvim-cmp'
-- LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
-- Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
-- Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'szw/vim-maximizer'
Plug 'kassio/neoterm'
Plug('junegunn/fzf', { dir = '~/.fzf', ['do'] = './install --all' })
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
-- is this doing anything?
Plug 'nvim-lua/completion-nvim'
Plug 'prettier/vim-prettier'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'git@github.com:rose-pine/neovim.git'
Plug 'nvim-lua/plenary.nvim' 
Plug 'ThePrimeagen/harpoon'

vim.call('plug#end')

