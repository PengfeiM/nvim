-- aerial.lua
local status, aerial = pcall(require, "aerial")
if not status then
    nvim_notify("没找到 aerial 插件", vim.log.levels.WARN, {
        title = "aerial",
    })
    return
end

aerial.setup({
    filter_kind = {
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Package",
        "Struct",
    }
})
