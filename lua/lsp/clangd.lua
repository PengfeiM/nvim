--[[
-- old way
local nvim_lsp = require("lspconfig")

-- vim.notify("lsp.clangd 加载成功")

-- 引用通用函数
local utils = require("lsp.utils")

nvim_lsp.clangd.setup({

	-- 绑定一下快捷键
	on_attach = utils.LspKeybind,

	-- 自定义 clangd 启动命令
	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
	-- 支持文件
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		-- "proto",
		"cuda",
	}, -- 支持的文件类型
	root_dir = nvim_lsp.util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		".git",
		"compile_flags.txt",
		"configure.ac"
	), -- 根目录
	capabilities = require("cmp_nvim_lsp").default_capabilities(), -- 自动补全支持

	-- init_options = {
	--     fallbackFlags = { '-std=c++17' },
	-- },
	},
})
-- ]]

-- 引用通用函数
local utils = require("lsp.utils")

-- new way
vim.lsp.config["clangd"] = {
	-- 绑定一下快捷键
	on_attach = utils.LspKeybind,

	-- 自定义 clangd 启动命令
	cmd = { "clangd", "--background-index", "--clang-tidy", "--log=verbose" },
	-- 支持文件
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		-- "proto",
		"cuda",
	}, -- 支持的文件类型
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		".git",
		"compile_flags.txt",
		"configure.ac",
	},
	capabilities = require("cmp_nvim_lsp").default_capabilities(), -- 自动补全支持
}

vim.lsp.enable("clangd")
