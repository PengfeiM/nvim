local status, notify = pcall(require, "notify")
if not status then
    vim.notify("没有找到 nvim-notify")
end

notify.setup({
    background_colour = "#00000040",   -- #RRGGBBAA，最后的 AA 为透明度值（0~255）
})
