vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.smarttab = true
vim.opt.hidden = true

vim.g.mapleader = "."

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	float = {
		show_header = true,
		source = "always",
		border = "single",
	},
})

vim.cmd('colorscheme kanagawa-wave')
