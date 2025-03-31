-- conf_file.lua
-- 启用一些配置文件的 lsp
local nvim_lsp = require('lspconfig')

nvim_lsp.yamlls.setup{}  -- YAML
nvim_lsp.taplo.setup{}   -- TOML
nvim_lsp.jsonls.setup{}  -- JSON
nvim_lsp.lemminx.setup{} -- XML
