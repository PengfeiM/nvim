-- render_markdown.lua
local plugin_name = "render-markdown"
local status, r_md = pcall(require, "render-markdown")
if not status then
    nvim_notify("没有找到 render-markdown 插件", vim.log.levels.WARN, {
        title = plugin_name,
    })
    return
end

r_md.setup({
    completions = { lsp = { enabled = true } },
})
