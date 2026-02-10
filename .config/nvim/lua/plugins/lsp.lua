local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config('*', {
	root_markers = { '.git' }
})

vim.lsp.config.clangd = {
	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
	root_markers = { ".clangd", "compile_commands.json" },
	filetypes = { "c", "cpp" },
	capabilities = capabilities,
}

vim.lsp.config("lua_ls", {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = {
		'luarc.json',
		'luarc.jsonc',
		'.luacheckrc',
		'stylua.toml',
		'.git',
	},
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			}
		}
	},
	capabilities = capabilities,
})

vim.lsp.config("cmake-language-server", {
	cmd = {'cmake-language-server'},
	filetypes = {'cmake'},
	init_options = {
		build_directory = 'build',
	},
	root_markers = {
		'CMakePresets.json',
		'CTestConfig.cmake',
		'build',
		'cmake',
	},
})

vim.lsp.config("pyright", {
	cmd = {'pyright-langserver', '--stdio'},
	filetypes = {'python'},
	root_markers = {
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'pyrightconfig.json',
	},
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = 'openFilesOnly',
			useLibraryCodeForTypes = true,
		}
	},
})

vim.lsp.enable({'clangd', 'lua_ls', 'cmake-language-server', 'pyright'})
