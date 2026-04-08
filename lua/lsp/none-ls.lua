local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting

local indent_2_file_types = { "json", "jsonc" }

local function set_indentation(filetype)
	if vim.tbl_contains(indent_2_file_types, filetype) then
		vim.bo.shiftwidth = 2
		vim.bo.tabstop = 2
	end

	-- if filetype == "yaml" then
	--     vim.bo.shiftwidth = 4
	--     vim.bo.tabstop = 4
	-- end
end

null_ls.setup({
	debug = false,
	sources = {
		-- Formatting ---------------------
		formatting.shfmt,
		-- StyLua
		formatting.stylua,
		-- frontend
		formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
				"css",
				"scss",
				"less",
				"html",
				-- "json",
				"yaml",
				"yml",
				"graphql",
				"astro",
				"markdown",
			},
			extra_filetypes = { "njk" },
			prefer_local = "node_modules/.bin",
		}),
		formatting.prettier.with({
			filetypes = {
				"json",
				"jsonc",
			},
			-- make indent = 4 for json file
			extra_args = { "--tab-width", "2" },
		}),
		-- add some go functions,
		-- 1. gomodifytags
		-- 2. go impl a interface
		null_ls.builtins.code_actions.gomodifytags,
		null_ls.builtins.code_actions.impl,
		formatting.goimports,
		formatting.gofumpt,
	},
	-- 保存自动格式化
	-- on_attach = function(client)
	-- 	-- if client.server_capabilities.documentFormattingProvider then
	-- 	--	vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format{ async = true}")
	-- 	-- end
	-- end,
	on_attach = function(client, bufnr)
		local filetype = vim.bo.filetype
		set_indentation(filetype)
	end,
})
