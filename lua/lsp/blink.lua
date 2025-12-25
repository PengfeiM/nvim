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
	sources = {
		-- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
		-- so you don't need to define them in `sources.providers`
		-- default = { "lsp", "buffer", "snippets", "path", "datword", "trae" },
		default = { "lsp", "buffer", "snippets", "path", "datword" },

		providers = {
			-- add datword provider
			datword = {
				name = "Word",
				module = "blink-cmp-dat-word",
				score_offset = -50, -- a little lower priority
				opts = {
					paths = {
						-- "path_to_your_words.txt", -- add your owned word files before dictionary.
						"~/.config/nvim/conf/words", -- This file is my own defined words
						"/usr/share/dict/words", -- This file is included by default on Linux/macOS.
					},
					build_command = "BuildDatWord", -- Define a Command to rebuild words, eg: `BuildDatWord`, then use `BuildDatWord!` to force rebuild cache.
					spellsuggest = true, -- Enable limited spellsuggest. eg: enter `thsi` give you `this`.
				},
			},
			-- trae = {
			-- 	name = "trae",
			-- 	module = "blink.compat.source",
			-- 	score_offset = 0, -- trae的默认score有点低，可以按需改下
			-- 	opts = {},
			-- },
		},
	},
	completion = {
		documentation = { auto_show = true }, -- 自动显示文档
		menu = {
			border = "rounded",
			draw = {
				-- We don't need label_description now because label and label_description are already
				-- combined together in label by colorful-menu.nvim.
				columns = { { "kind_icon" }, { "label", gap = 1 }},
				-- columns = { { "kind_icon" }, { "label", gap = 1 }, {"source_name"}}, -- with source name
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu").blink_components_text(ctx)
						end,
						highlight = function(ctx)
							return require("colorful-menu").blink_components_highlight(ctx)
						end,
					},
				},
			},
		}, -- 菜单样式
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
