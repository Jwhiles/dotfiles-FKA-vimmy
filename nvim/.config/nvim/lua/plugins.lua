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
    use('tpope/vim-commentary')
    use('christoomey/vim-tmux-navigator')
    use({'junegunn/fzf',  dir = '~/.fzf', ['do'] = './install --all' })
    use('junegunn/fzf.vim')
    use('airblade/vim-gitgutter')
    -- is this doing anything?
    use('prettier/vim-prettier')
    use('tpope/vim-surround')
    use('nvim-lua/plenary.nvim' )
    use('ThePrimeagen/harpoon')
    use('tpope/vim-fugitive')
    use('goolord/alpha-nvim')
    -- Highlights a unique char in each word - for easy jumpin
    use("unblevable/quick-scope")
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      }
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


    use("rebelot/kanagawa.nvim") -- My theme

    use { -- Show a nice UI with possible shortcuts
      "folke/which-key.nvim",
      config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
            require("which-key").setup {
            }
          end
        }


    -- the testing zone
    use("mbbill/undotree")
  end)

