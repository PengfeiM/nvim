-- 显示配置
-- {
    -- 样式
    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.opt.termguicolors = true

    -- jkhl 移动时光标周围保留8行
    vim.o.scrolloff = 8
    vim.o.sidescrolloff = 8
    -- 显示行号
    vim.wo.number = true
    -- 使用相对行号
    -- vim.wo.relativenumber = true
    -- 高亮所在行
    vim.wo.cursorline = true
    -- 显示左侧图标指示列
    vim.wo.signcolumn = "yes"
    -- 右侧参考线
    vim.wo.colorcolumn = "120"

    -- guicursor
    -- 所有模式都使用下划线光标（hor20 表示高度 20% 的下划线）
    vim.opt.guicursor = "a:hor20"
-- }


-- 格式化配置
--{
    -- tab 配置
    vim.o.tabstop = 4
    vim.bo.tabstop = 4
    vim.o.softtabstop = 4
    vim.o.shiftround = true
	-- >> << 时移动长度
	vim.o.shiftwidth = 4
	vim.bo.shiftwidth = 4
	-- 空格替代
	vim.o.expandtab = true
	vim.bo.expandtab = true
	-- 新行对齐当前行
	vim.o.autoindent = true
	vim.bo.autoindent = true
    vim.o.smartindent = true
--}


-- 操作配置
--{
    -- 搜索大小写不敏感，除非包含大写
    vim.o.ignorecase = true
    vim.o.smartcase = true
    -- 搜索不要高亮
    vim.o.hlsearch = true
    -- 实时搜索
    vim.o.incsearch = true
--}
