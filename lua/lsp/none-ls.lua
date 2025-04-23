local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("没有找到 null-ls")
	return
end

local formatting = null_ls.builtins.formatting

local function set_indentation(filetype)
    if filetype == "json" then
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
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
		-- go fmt
		formatting.goimports,
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
				-- "yaml",
				"graphql",
				"astro",
				"markdown",
			},
			extra_filetypes = { "njk" },
			prefer_local = "node_modules/.bin",
		}),
        -- add some go functions, 
        -- 1. gomodifytags
        -- 2. go impl a interface
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
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
