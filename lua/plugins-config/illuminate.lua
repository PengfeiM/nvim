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
-- local colors = require('dracula').colors()

-- 自定义高亮
-- vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = colors.black, bg = colors.green, underline = true })
-- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = colors.black, bg = colors.green, underline = true })
-- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { fg = colors.black, bg = colors.bright_green, bold = true })

-- 在进入 Visual 模式时暂停 Illuminate 高亮
vim.cmd [[
  augroup IlluminateVisualPause
    autocmd!
    autocmd ModeChanged *:v* lua require('illuminate').pause()
  augroup END
]]

-- 在退出 Visual 模式时恢复 Illuminate 高亮
vim.cmd [[
  augroup IlluminateVisualResume
    autocmd!
    autocmd ModeChanged *:n* lua require('illuminate').resume()
  augroup END
]]
