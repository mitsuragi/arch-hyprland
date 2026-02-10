require('nvim-treesitter.configs').setup({
	ensure_installed = {"c", "cpp", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "lua", "html", "css"},
	sync_install = false,
	-- auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
