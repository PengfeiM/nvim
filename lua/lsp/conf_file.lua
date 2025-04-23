-- conf_file.lua
-- 启用一些配置文件的 lsp
local nvim_lsp = require('lspconfig')
-- 引用通用函数
local utils = require('lsp.utils')

-- just import, no conf
-- nvim_lsp.yamlls.setup {} -- YAML
-- nvim_lsp.taplo.setup{}   -- TOML
-- nvim_lsp.jsonls.setup {} -- JSON
-- nvim_lsp.lemminx.setup{} -- XML

-- taplo conf, for TOML
nvim_lsp.taplo.setup({
    capabilities = capabilities,
    -- try to add keybinding
    on_attach = utils.ConfLspKeybind,
})

-- yamlls conf
nvim_lsp.yamlls.setup({
    capabilities = capabilities,
    on_attach = utils.ConfLspKeybind,
    settings = {
        yaml = {
            validate = true,
            format = {
                enable = true,
            },
            -- schemas = {
            --     kubernetes = "/*.yaml",
            --     ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
            -- }
        }
    },
})

-- jsonls
nvim_lsp.jsonls.setup({
    capabilities = capabilities,
    on_attach = utils.ConfLspKeybind,
    settings = {
        json = {
            schemas = {
                { fileMatch = { "package.json" }, url = "https://json.schemastore.org/package.json" }
            }
        }
    },
})
