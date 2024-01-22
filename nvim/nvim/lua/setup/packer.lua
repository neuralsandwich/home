-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'jodosha/vim-godebug'

  use 'ThePrimeagen/git-worktree.nvim'
  use 'hoob3rt/lualine.nvim'
  use 'nvim-lua/popup.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  use {
    'xbase-lab/xbase',
      run = 'make install', -- or "make install && make free_space" (not recommended, longer build time)
      requires = {
        "neovim/nvim-lspconfig",
        -- "nvim-telescope/telescope.nvim", -- optional
        -- "nvim-lua/plenary.nvim", -- optional/requirement of telescope.nvim
        -- "stevearc/dressing.nvim", -- optional (in case you don't use telescope but something else)
      },
      config = function()
        require'xbase'.setup({})  -- see default configuration bellow
      end
  }

end)
