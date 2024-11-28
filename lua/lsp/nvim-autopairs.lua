-- nvim-autopairs.lua
local status, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status then
    vim.notify("找不到 nvim-autopairs")
    return
end

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp_autopairs = nvim_autopairs.completion.cmp
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

nvim_autopairs.setup({})
