-- 引用通用函数
local utils = require("lsp.utils")

vim.lsp.config["ty"] = {
	on_attach = function(client, bufnr)
		-- 绑定一下快捷键
		utils.LspKeybind(client, bufnr)
	end,
}

vim.lsp.enable("ty")
