local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

packer.startup(function(use)
  if packer_bootstrap then
    packer.sync()
  end

  -- [[ Basic Plugins ]]
  use {
      'kyazdani42/nvim-tree.lua',
      requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
     'yamatsum/nvim-nonicons',
     requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'folke/which-key.nvim' }
  use { 'lewis6991/spellsitter.nvim' }

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' }
  use { 'DanilaMihailov/beacon.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons',
      opt = true}
  }

  -- [[ Dev ]]
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{ 'nvim-lua/plenary.nvim' }}
  }
  use { 'majutsushi/tagbar' }
  use { 'Yggdroot/indentLine' }
  use { 'tpope/vim-fugitive' }
  use { 'junegunn/gv.vim' }
  use { 'windwp/nvim-autopairs' }
end)
