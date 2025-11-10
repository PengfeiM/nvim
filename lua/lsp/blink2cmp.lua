-- blink2cmp.lua

local capabilities = require("lsp.blink")

local basepyright_config = vim.lsp.config["basedpyright"] or {}
vim.lsp.config["basedpyright"] = vim.tbl_extend("force", basepyright_config, { capabilities = capabilities })

local bufls_config = vim.lsp.config["bufls"] or {}
vim.lsp.config["bufls"] = vim.tbl_extend("force", bufls_config, { capabilities = capabilities })

local clangd_config = vim.lsp.config["clangd"] or {}
vim.lsp.config["clangd"] = vim.tbl_extend("force", clangd_config, { capabilities = capabilities })

local gopls_config = vim.lsp.config["gopls"] or {}
vim.lsp.config["gopls"] = vim.tbl_extend("force", gopls_config, { capabilities = capabilities })

local pylsp_config = vim.lsp.config["pylsp"] or {}
vim.lsp.config["pylsp"] = vim.tbl_extend("force", pylsp_config, { capabilities = capabilities })

local lua_ls_config = vim.lsp.config["lua_ls"] or {}
vim.lsp.config["lua_ls"] = vim.tbl_extend("force", lua_ls_config, { capabilities = capabilities })
