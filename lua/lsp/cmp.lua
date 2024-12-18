-- cmp.lua
local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("找不到 cmp")
    return
end

-- 引用一些 cmp 自身的能力
local types = require("cmp.types")
local str = require("cmp.utils.str")

-- 导入 lspkind
local lspkind = require("lspkind")

cmp.setup({
    sources = cmp.config.sources({
        -- { name = "codeium" }, -- 需要安装 codeium.nvim
        { name = "nvim_lsp" },
        -- For vsnip users.
        { name = "vsnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
    -- 省略其他配置
    mapping = require("keybinding").cmp(cmp),

    -- lspkind 美化，格式配置
    formatting = {
        		completion = { border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, scrollbar = "║" },
		documentation = {
			border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			scrollbar = "║",
		},
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 20,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				-- Get the full snippet (and only keep first line)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end
				word = str.oneline(word)
				if
					entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
					and string.sub(vim_item.abbr, -1, -1) == "~"
				then
					word = word .. "~"
				end
				vim_item.abbr = word
				return vim_item
			end,
		}),
    }
})
