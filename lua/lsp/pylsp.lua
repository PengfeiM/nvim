-- 引用通用函数
local utils = require("lsp.utils")

-- new way
vim.lsp.config["pylsp"] = {
	-- 绑定一下快捷键
	on_attach = utils.LspKeybind,

	-- 文档链接：https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
	settings = {
		pylsp = {
			configurationSources = { "pycodestyle" }, -- ['flake8', 'pycodestyle'], default pycodestyle
			plugins = {
				autopep8 = {
					enabled = true, -- bool[true, false], default true
				},
				jedi = {
					auto_import_modules = { "json", "os", "requests", "sys", "subprocess" },
					-- environment = "./venv/bin/python",
					environment = (vim.fn.isdirectory("./venv/bin") == 1 and "./venv/bin/python")
						or vim.fn.exepath("python3"),
				},
				pycodestyle = {
					-- ignore = { "W391", "E501" },
					maxLineLength = 120,
				},
			},
		},
	},
}

vim.lsp.enable("pylsp")
