-- bufls.lua

-- old
--[[
local nvim_lsp = require('lspconfig')
nvim_lsp.buf_ls.setup({
    -- keybinding
    on_attach = utils.LspKeybind,


    -- cmd, installed by `brew install buf`
    cmd = { "buf", "beta", "lsp" },
    -- support file types
    filetypes = {
        "proto",
    },
    root_dir = nvim_lsp.util.root_pattern(
        "buf.yaml",
        ".git"
    ), -- 根目录
})
--]]

local utils = require("lsp.utils")
vim.lsp.config["bufls"] = {
	-- keybinding
	on_attach = utils.LspKeybind,

	-- cmd, installed by `brew install buf`
	cmd = { "buf", "beta", "lsp" },
	-- support file types
	filetypes = {
		"proto",
	},
	root_markers = {
		"buf.yaml",
		".git",
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(), -- 自动补全支持
}

vim.lsp.enable("bufls")
