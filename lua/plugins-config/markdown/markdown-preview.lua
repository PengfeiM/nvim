-- markdown-preview.lua
local status, md_pre = pcall(require, "markdown-preview")
if not status then
    vim.notify("没有找到 markdown-preview")
end


md_pre.setup({})
