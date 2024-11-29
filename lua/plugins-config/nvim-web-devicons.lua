local status, nvim_web_devicons = pcall(require, "nvim-web-devicons")
if not status then
    vim.notify("没找到 nvim-web-devicons")
    return
end


-- nvim-web-devicons 配置
nvim_web_devicons.setup({
    -- same as `override` but specifically for operating system
    -- takes effect when `strict` is true
    override_by_operating_system = {
        ["apple"] = {
            icon = "",
            color = "#A2AAAD",
            cterm_color = "248",
            name = "Apple",
        },
    },
})
