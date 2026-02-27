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


--color
vim.opt.termguicolors = true

-- spell check
-- vim.opt.spell = true
-- vim.opt.spelllang = "en"

-- 光标停留时间设置
vim.o.updatetime = 500 -- 将光标停留触发的时间设置为 500 毫秒


-- ======================================================
-- import settings
-- 导入配置
-- ------------------------------------------------------
require("basic")
require("plugin")
require("theme")
-- 全局变量
-- 依赖lazy管理插件，需要放到插件require("plugin")后
_G.nvim_notify = require("globalvars").nvim_notify
-- 导入快捷键
require("keybinding")
-- ======================================================
-- 我自己的功能
-- require("filetypes")


-- ======================================================
-- 启动插件配置
-- ------------------------------------------------------
-- nvim-notify: 通知插件
require("plugins-config.notify")
require("plugins-config.noice")
require("plugins-config.fidget")

-- better fFtT, must after treesitter
require("plugins-config.eysliner")


-- useful plugin to help me get hands on vim
require("plugins-config.nvim-tips")
-- auto-save: 自动保存
require("plugins-config.auto-save")

-- nvim-tree: 目录插件启动
require("plugins-config.nvim-tree")

-- lualine: 状态栏启动
require("plugins-config.lualine")

-- bufferline: tab 栏启动
-- require("plugins-config.bufferline")
-- use barbar instead
require("plugins-config.barbar")

-- tagbar：配置
-- use aerial 
-- require("plugins-config.tagbar")
require("plugins-config.aerial")

-- nvim-ufo: 配置
-- require("plugins-config.ufo")


-- fzf-lua: 配置
-- require("plugins-config.fzf-lua")
require("plugins-config.telescope")

-- nvim-treesitter
require("plugins-config.nvim-treesitter")
require("plugins-config.code-folding")      -- 复用 treesitter 能力的代码折叠

-- vim-illuminate
require("plugins-config.illuminate")
-- todo-comments
require("plugins-config.todo-comments")

-- rainbow
-- require("plugins-config.rainbow")


-- indent blankline
-- require("plugins-config.indent-blankline")


-- ------------------------------------------------------
-- gitsigns
require("plugins-config.gitsigns")
-- lazygit
require("plugins-config.lazygit")
-- ------------------------------------------------------
require("lsp.mason")
require("lsp.lspsaga")
require("lsp.lsp-signature")
-- require("lsp.cmp")
-- require("lsp.lspkind")
require("lsp.nvim-autopairs")
require("lsp.blink")
require("plugins-config.blink_indent")
require("lsp.none-ls")
require("lsp.format.prettier")


-- ======================================================
-- which-key
require("plugins-config.which_key")
-- ---- diagnostic ----------------------------
-- require("diagnostic")
require("plugins-config.tiny-inline-diag")

-- ======================================================



