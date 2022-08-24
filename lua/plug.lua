local fn = vim.fn
local command = vim.api.nvim_command

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	command("packadd packer.nvim")
end

local status_ok, packer = pcall(require, "packer")
if status_ok then 
  vim.cmd[[colorscheme tokyodark]]
else 
  return
end

packer.startup(function()
  use { "wbthomason/packer.nvim" }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use {
    'yamatsum/nvim-nonicons',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }


  use("williamboman/nvim-lsp-installer")
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-cmdline' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'folke/which-key.nvim' }
  use { 'lewis6991/spellsitter.nvim' }
  use { 'akinsho/toggleterm.nvim' }

  -- [[ Theme ]]
  use { 'mhinz/vim-startify' }
  use { 'DanilaMihailov/beacon.nvim' }
  use { 'tiagovla/tokyodark.nvim' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
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
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
  
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

end)

