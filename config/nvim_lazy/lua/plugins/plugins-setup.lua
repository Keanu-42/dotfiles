-- -- packer install
-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end
-- 
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
-- ]])
-- 
-- local packer_bootstrap = ensure_packer()
-- 
-- return require('packer').startup(function(use)
--   use 'wbthomason/packer.nvim' -- pluginmgr
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
  require('lazy').setup({
  {
    "folke/tokyonight.nvim",
    'neanias/everforest-nvim',
    lazy = false,
    priority = 1000,
    config = function()
    end,
  },
  'christoomey/vim-tmux-navigator',
  'nvim-treesitter/nvim-treesitter',
  'p00f/nvim-ts-rainbow',
  'lewis6991/gitsigns.nvim',
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'hrsh7th/cmp-path',
  'numToStr/Comment.nvim',
  'windwp/nvim-autopairs',

  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
  },
-- 'kyazdani42/nvim-web-devicons', opt = true
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
   'folke/noice.nvim',
   dependencies = {
     'MunifTanjim/nui.nvim',
     'rcarriga/nvim-notify',
     }
   },
   {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    }
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
})
