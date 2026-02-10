-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Make sure to setup 'mapLeader' and 'mapLocalLeader' before
-- Loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.vim
require("lazy").setup({
  spec = {
	-- Colorschemes
		{ "rebelot/kanagawa.nvim" },
		{ "Mofiqul/vscode.nvim" },
		{ "sainnhe/everforest" },
		{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true, },
  -- import your plugins
		{
			"mason-org/mason.nvim",
			opts = {
				ensure_installed = {
					"clangd"
				}
			}
		},
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp"},
		{ "hrsh7th/cmp-buffer"},
		{ "hrsh7th/cmp-path"},
		{ "hrsh7th/cmp-cmdline"},
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			lazy = false,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "master",
			lazy = false,
			build = ":TSUpdate",
		},
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"romgrk/barbar.nvim",
			dependencies = {
				"lewis6991/gitsigns.nvim",
				"nvim-tree/nvim-web-devicons",
			},
			version = "^1.0.0",
		},
		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		},
		{ "numToStr/Comment.nvim" },
		{ "akinsho/toggleterm.nvim", version="*", config=true },
  },
  -- Configure any other settings here. See the docs for more details.
  -- colorscheme that will be used when installing plugins
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  -- checker = { enabled = true },
})

