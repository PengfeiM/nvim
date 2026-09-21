-- mason.lua
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	vim.notify("没有找到 mason")
	return
end

local mlsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_status then
	vim.notify("没有找到 mason-lspconfig")
	return
end

mason.setup({})
mason_lspconfig.setup({
	-- FIXME: disable auto-enable, mason-lspconfig has a bug, do not update mason now
	automatic_enable = false,
})

-- lua_ls
require("lsp.lua_ls")

-- golang
require("lsp.gopls")

-- python
-- require("lsp.pylsp")
-- require("lsp.basedpyright")
require("lsp.ruff")
require("lsp.ty")

-- 引用 clangd.lua，配置 clangd
require("lsp.clangd")

-- rust
require("lsp.rust-analyzer")

-- proto bufls
require("lsp.bufls")

-- bash
require("lsp.bash_ls")

-- ltex-ls
-- require("lsp.ltex-ls")
-- java use huge mem, not so useful, disable it

-- confs lsp
--   1. toml
--   2. yaml
--   3. json
require("lsp.conf_file")

-- call blink capability as very last
require("lsp.blink2cmp")
