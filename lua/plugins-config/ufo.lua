-- ufo.lua
-- nvim ufo 插件
-- https://github.com/kevinhwang91/nvim-ufo
-- 更好的代码折叠
-- 它覆盖了 gitsigns，暂时不用

local plugin_name = "ufo"
local status, ufo = pcall(require, "ufo")
if not status then
    nvim_notify("没有找到 ufo 插件", vim.log.levels.WARN, {
        title = plugin_name,
    })
    return
end

vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

-- NOTE: 也可以使用其他服务器作为代码折叠语法提供方：coc、lsp、treesitter

-- Option 2: nvim lsp as LSP client
-- Tell the server the capability of foldingRange,
-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}
local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
    require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
    })
end
require('ufo').setup()
