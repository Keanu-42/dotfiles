-- packer install
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- pluginmgr
  use 'neanias/everforest-nvim' -- theme
  use 'christoomey/vim-tmux-navigator'
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  use 'lewis6991/gitsigns.nvim'
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig'
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'rafamadriz/friendly-snippets'
  use 'hrsh7th/cmp-path'
  use 'numToStr/Comment.nvim'
  use 'windwp/nvim-autopairs'
  use {
    'nvim-lualine/lualine.nvim', -- statusbar
    requires = {
      'kyazdani42/nvim-web-devicons', opt = true
    }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  use {
     'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- file retrieval
     requires = { {'nvim-lua/plenary.nvim'
      } 
    }
  }
  use {
  'folke/noice.nvim',
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
    }
  } 
  use { 
    'sindrets/diffview.nvim', 
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
