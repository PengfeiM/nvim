local status, illuminate = pcall(require, "illuminate")
if not status then
    vim.notify("没找到 vim-illuminate 插件")
    return
end


-- vim-illuminate 配置
illuminate.configure({
    delay = 200,                                      -- 高亮延迟（毫秒）
    filetypes_denylist = { "NvimTree", "alpha" },     -- 忽略特定文件类型
})

-- 引用 dracula 颜色
local colors = require('dracula').colors()

-- 自定义高亮
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = colors.nontext, underline = true })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = colors.nontext, underline = true })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = colors.visual, bold = true })