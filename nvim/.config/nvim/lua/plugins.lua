vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
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
    -- LSP completion source for nvim-cmp
    use('pangloss/vim-javascript')
    use('vim-airline/vim-airline')
    use('tpope/vim-commentary')
    use('dracula/vim')
    use('christoomey/vim-tmux-navigator')
    use('szw/vim-maximizer')
    use('kassio/neoterm')
    use({'junegunn/fzf',  dir = '~/.fzf', ['do'] = './install --all' })
    use('junegunn/fzf.vim')
    use('airblade/vim-gitgutter')
    -- is this doing anything?
    use('nvim-lua/completion-nvim')
    use('prettier/vim-prettier')
    use('tpope/vim-surround')
    use('rose-pine/neovim')
    use('nvim-lua/plenary.nvim' )
    use('ThePrimeagen/harpoon')
    use('tpope/vim-fugitive')
    use('goolord/alpha-nvim')
    use('github/copilot.vim')
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    -- the testing zone
    use("nvim-telescope/telescope.nvim")
    use("ThePrimeagen/git-worktree.nvim")
  end)


