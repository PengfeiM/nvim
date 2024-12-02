-- code-folding.lua 代码折叠，服用 nvim-treesitter 能力

-- 设置折叠方式为 Treesitter
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- 设置折叠默认展开级别
vim.o.foldlevel = 99       -- 默认折叠级别（展开所有）
vim.o.foldlevelstart = 99  -- 启动时展开所有折叠
vim.o.foldenable = true    -- 启用折叠
