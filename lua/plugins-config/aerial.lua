-- aerial.lua
local status, aerial = pcall(require, "aerial")
if not status then
    nvim_notify("没找到 aerial 插件", vim.log.levels.WARN, {
        title = "aerial",
    })
    return
end

aerial.setup({
    -- Priority list of preferred backends for aerial.
    -- This can be a filetype map (see :help aerial-filetype-map)
    -- backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    -- backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" }, -- default
    backends = {
        -- ['_'] = { "treesitter", "lsp", "markdown", "asciidoc", "man" }, -- default
        go = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        c = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
        cpp = { "lsp", "treesitter", "markdown", "asciidoc", "man" },
    },

    filter_kind = {
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Field",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Package",
        "Property",
        "Struct",
        -- "Variable",
    },
})
