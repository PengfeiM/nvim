-- =========================================================================
--         _   ___     _____ __  __ ____   ____ 
--        | \ | \ \   / /_ _|  \/  |  _ \ / ___|
--        |  \| |\ \ / / | || |\/| | |_) | |    
--        | |\  | \ V /  | || |  | |  _ <| |___ 
--        |_| \_|  \_/  |___|_|  |_|_| \_\\____|
-- ========================================================================

-- 字符编码
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "UTF-8"

-- 光标停留时间设置
vim.o.updatetime = 500 -- 将光标停留触发的时间设置为 500 毫秒


-- ======================================================
-- import settings
-- 导入配置
-- ------------------------------------------------------
require("basic")
require("plugin")
require("theme")
-- 导入快捷键
require("keybinding")
-- ======================================================


-- ======================================================
-- 启动插件配置
-- ------------------------------------------------------

-- nvim-tree: 目录插件启动
require("plugins-config.nvim-tree")

-- lualine: 状态栏启动
require("plugins-config.lualine")

-- bufferline: tab 栏启动
require("plugins-config.bufferline")

-- tagbar：配置
require("plugins-config.tagbar")

-- fzf-lua: 配置
require("plugins-config.fzf-lua")

-- nvim-treesitter
require("plugins-config.nvim-treesitter")

-- rainbow
require("plugins-config.rainbow")

-- gitsigns
require("plugins-config.gitsigns")


-- ------------------------------------------------------
require("lsp.mason")
require("lsp.cmp")
require("lsp.lspsaga")
require("lsp.lspkind")
require("lsp.nvim-autopairs")  -- 引用了 cmp，放在 cmp 后面

-- ======================================================

-- ======================================================



