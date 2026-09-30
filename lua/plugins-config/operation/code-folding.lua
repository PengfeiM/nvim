-- -- code-folding.lua 代码折叠，服用 nvim-treesitter 能力
--
-- -- 设置折叠方式为 Treesitter
-- vim.o.foldmethod = 'expr'
-- -- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.api.nvim_create_autocmd("FileType", {
--     -- use indent as folding method in python
--     pattern = { "python" },
--     callback = function()
--         vim.opt_local.foldmethod = "indent"
--     end,
-- })
--
-- -- 设置折叠默认展开级别
-- vim.o.foldlevel = 99      -- 默认折叠级别（展开所有）
-- vim.o.foldlevelstart = 99 -- 启动时展开所有折叠
-- vim.o.foldenable = true   -- 启用折叠
-- old

-- origami
local status, origami = pcall(require, "origami")
if not status then
	nvim_notify("origami not found")
	return
end

origami.setup({
	useLspFoldsWithTreesitterFallback = {
		enabled = true,
		foldmethodIfNeitherIsAvailable = "indent", ---@type string|fun(bufnr: number): string
	},
	pauseFoldsOnSearch = true,
	foldtext = {
		enabled = true,
		padding = {
			character = " ",
			width = 3, ---@type number|fun(win: number, foldstart: number, currentVirtualTextLength: number): number
			hlgroup = nil,
		},
		lineCount = {
			template = "%d lines", -- `%d` is replaced with the number of folded lines
			hlgroup = "Comment",
		},
		diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
		gitsignsCount = true, -- requires `gitsigns.nvim` or `mini.diff`
		disableOnFt = { "snacks_picker_input" }, ---@type string[]
	},
	autoFold = {
		enabled = true,
		kinds = { "comment", "imports" }, ---@type lsp.FoldingRangeKind[]
	},
	foldKeymaps = {
		setup = true, -- modifies `h`, `l`, `^`, and `$`
		closeOnlyOnFirstColumn = false, -- `h` and `^` only fold in the 1st column
		scrollLeftOnCaret = false, -- `^` should scroll left (basically mapped to `0^`)
	},
})
