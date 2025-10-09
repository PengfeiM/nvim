-- blink.lua

-- must loaded it
local blink = require("blink.cmp")

blink.setup({
	keymap = {
		-- preset = "default", -- 内置默认快捷键
		--[[
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<C-y>'] = { 'select_and_accept', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        ]]
		preset = "enter",
		--[[
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = { 'snippet_forward', 'fallback' },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

            ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

            ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        --]]
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	completion = {
		documentation = { auto_show = true }, -- 自动显示文档
		menu = { border = "rounded" }, -- 菜单样式
		accept = { auto_brackets = { enabled = true } }, -- 自动补充函数的括号
		list = {
			selection = {
				-- preselect = true,
				auto_insert = true,

				-- disable in lspsage rename
				preselect = function(ctx)
					local disable_filetype = { "sagarename" }
					return not vim.tbl_contains(disable_filetype, vim.bo.filetype)
				end,
			},
		},
	},
	cmdline = {
		completion = {
			list = {
				selection = {
					-- When `true`, will automatically select the first item in the completion list
					preselect = false,
					-- When `true`, inserts the completion item automatically when selecting it
					auto_insert = true,
				},
			},
		},
	},
})

-- 返回 capability 给 LSP 使用
return blink.get_lsp_capabilities()
