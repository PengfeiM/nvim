local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("没有找到 nvim-tree")
	return
end

-- nvim-tree 配置
nvim_tree.setup({
    sort_by = "case_sensitive",
    -- 是否显示 git 状态
    git = {
        enable = true,
    },
    -- 过滤文件
    filters = {
        dotfiles = true, -- 过滤 dotfile
        custom = { "node_modules" }, -- 其他过滤目录
    },
    view = {
	    -- 文件浏览器展示位置，左侧：left, 右侧：right
	    side = "left",
	    -- 行号是否显示
	    number = false,
	    relativenumber = false,
	    signcolumn = "yes", -- 显示图标
	    width = 32,
    },
    renderer = {
        group_empty = true,
        -- hidden_display = "simple",
        hidden_display = "all",
        icons = {
            web_devicons = {
            file = {
              enable = true,
              color = true,
            },
            folder = {
              enable = true,
              color = true,
            },
          },
        },
    },
})
