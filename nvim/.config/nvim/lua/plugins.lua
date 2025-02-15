vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
    --  plugin manager
    use('wbthomason/packer.nvim')
    -- Collection of common configurations for the Nvim LSP client
    use('neovim/nvim-lspconfig')
    -- Completion framework
    use('hrsh7th/cmp-nvim-lsp')
    -- Snippet completion source for nvim-cmp
    use('hrsh7th/cmp-vsnip')
    -- Other usefull completion sources
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/nvim-cmp')
    use('pangloss/vim-javascript')
    use('tpope/vim-commentary')
    use('christoomey/vim-tmux-navigator')
    use('szw/vim-maximizer')
    use('kassio/neoterm')
    use({'junegunn/fzf',  dir = '~/.fzf', ['do'] = './install --all' })
    use('junegunn/fzf.vim')
    use('airblade/vim-gitgutter')
    -- is this doing anything?
--     use('nvim-lua/completion-nvim')
    use('prettier/vim-prettier')
    use('tpope/vim-surround')
    use('Mofiqul/dracula.nvim')
    use('nvim-lua/plenary.nvim' )
    use('ThePrimeagen/harpoon')
    use('tpope/vim-fugitive')
    use('goolord/alpha-nvim')
    -- Highlights a unique char in each word - for easy jumpin
    use("unblevable/quick-scope")
    use('github/copilot.vim')
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      }
    }
-- 
--     -- the testing zone
    use("mbbill/undotree")
    use("nvim-telescope/telescope.nvim")
    -- use("simrat39/rust-tools.nvim")
    use {'nvim-treesitter/nvim-treesitter'}
    use {
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
            require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
          end
        }
  end)

