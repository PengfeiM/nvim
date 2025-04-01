-- indent-blankline
local status, indent_blankline = pcall(require, "ibl")
if not status then
	vim.notify("没有找到 indent_blankline")
end
local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)
-- 使用一些低饱和度的颜色
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#C77C83" })    -- 降低饱和度的红色
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#C9B386" }) -- 柔和的黄色
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#85A2C9" })   -- 柔和的蓝色
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#B78B72" }) -- 柔和的橙色
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#87A78A" })  -- 柔和的绿色
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#A785B2" }) -- 柔和的紫色
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#73A0A5" })   -- 柔和的青色
end)

indent_blankline.setup({
	indent = { highlight = highlight },
	exclude = {
		filetypes = {

			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
			"gitcommit",
			"TelescopePrompt",
			"TelescopeResults",
			"",
			"dashboard",
		},
	},
	--	show_current_context = true,
	--	show_current_context_start = true,
	--	context_patterns = {
	--		"class",
	--		"function",
	--		"method",
	--		"element",
	--		"^if",
	--		"^while",
	--		"^object",
	--		"^for",
	--		"^table",
	--		"block",
	--		"arguments",
	--	},
	--	filetype_exclude = {
	--		"dashboard",
	--		"packer",
	--		"terminal",
	--		"help",
	--		"log",
	--		"markdown",
	--		"TelescopePrompt",
	--		"lsp-installer",
	--		"lspinfo",
	--		"toggleterm",
	--	},
	--	char = "▏",
})
