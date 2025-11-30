-- rust-analyzer.lua

-- 引用通用函数
local utils = require("lsp.utils")

vim.lsp.config["rust_analyzer"] = {
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true,
			},
		},
		checkOnSave = {
			enable = true,
			command = "clippy",
		},
	},
	on_attach = function(client, bufnr)
		-- vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		-- 绑定一下快捷键
		utils.LspKeybind(client, bufnr)
	end,
}

vim.lsp.enable("rust_analyzer")
