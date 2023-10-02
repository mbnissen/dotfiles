-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.3',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      { 'saadparwaiz1/cmp_luasnip' }, -- Optional

      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      -- Typescript
      { 'jose-elias-alvarez/typescript.nvim' }
    }
  }

  -- Elixir
  use('mhinz/vim-mix-format')

  -- use {
  --   'nvim-telescope/telescope.nvim', tag = '0.1.1',
  --   -- or                            , branch = '0.1.x',
  --   requires = { { 'nvim-lua/plenary.nvim' } }
  -- }

  -- use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- use({ 'ellisonleao/gruvbox.nvim', as = 'gruxbox' })

  -- vim.cmd('colorscheme rose-pine')

  -- use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  -- use('nvim-treesitter/playground')
  -- use('nvim-lua/plenary.nvim')
  -- use('mbbill/undotree')
  -- use('mhinz/vim-mix-format')
  -- use('hashivim/vim-terraform')

  -- -- eslint
  -- use('jose-elias-alvarez/null-ls.nvim')
  -- use('MunifTanjim/eslint.nvim')
  -- use('MunifTanjim/prettier.nvim')

  -- use {
  --   'nvim-tree/nvim-tree.lua',
  --   requires = {
  --     'nvim-tree/nvim-web-devicons', -- optional
  --   },
  --   config = function()
  --     require("nvim-tree").setup {}
  --   end
  -- }

  -- use({
  --   "L3MON4D3/LuaSnip",
  --   -- follow latest release.
  --   tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --   -- install jsregexp (optional!:).
  --   run = "make install_jsregexp"
  -- })

  -- --use {
  -- --  "folke/which-key.nvim",
  -- --  config = function()
  -- --    vim.o.timeout = true
  -- --    vim.o.timeoutlen = 300
  -- --    require("which-key").setup {
  -- --      -- your configuration comes here
  -- --      -- or leave it empty to use the default settings
  -- --      -- refer to the configuration section below
  -- --    }
  -- --  end
  -- --}

  -- use {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v1.x',
  --   requires = {
  --     -- LSP Support
  --     { 'neovim/nvim-lspconfig' },             -- Required
  --     { 'williamboman/mason.nvim' },           -- Optional
  --     { 'williamboman/mason-lspconfig.nvim' }, -- Optional

  --     -- Autocompletion
  --     { 'hrsh7th/nvim-cmp' },         -- Required
  --     { 'hrsh7th/cmp-nvim-lsp' },     -- Required
  --     { 'hrsh7th/cmp-buffer' },       -- Optional
  --     { 'hrsh7th/cmp-path' },         -- Optional
  --     { 'saadparwaiz1/cmp_luasnip' }, -- Optional
  --     { 'hrsh7th/cmp-nvim-lua' },     -- Optional

  --     -- Typescript
  --     { 'jose-elias-alvarez/typescript.nvim' }

  --     -- Snippets
  --     -- { 'L3MON4D3/LuaSnip' },             -- Required
  --     --{ 'rafamadriz/friendly-snippets' }, -- Optional
  --   }
  -- }
end)
