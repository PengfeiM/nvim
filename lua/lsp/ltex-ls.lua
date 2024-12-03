-- ltex-ls.lua
local nvim_lsp = require('lspconfig')


-- ltex-ls 配置
nvim_lsp.ltex.setup({

    -- default: { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex", "pandoc", "quarto", "rmd", "context", "html", "xhtml", "mail", "text" }
    -- filetypes = {
    --     "text",
    --     "plaintex",
    -- },

    settings = {
        ltex = {
            language = "en-US",
        },
    },
})
