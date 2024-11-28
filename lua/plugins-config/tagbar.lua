local status, tagbar = pcall(require, "tagbar")
if not status then
	vim.notify("没有找到 tagbar 或者 nvim lua 加载 tagbar 失败，使用 vim 格式配置")
    vim.cmd([[
        let g:tagbar_width = max([30, winwidth(0)/8]) 
        let g:tagbar_autofocus = 1
        let g:tagbar_autoclose = 0
        let g:tagbar_show_tag_linenumbers = 2
        let g:tagbar_show_tag_count = 1
    ]])
	return
end


tagbar.setup({
    -- 宽度设置，tagbar 默认在右侧，垂直结构
    tagbar_width = 30,

    -- 自动聚焦
    tagbar_autofocus = true,

    -- 自动关闭
    tagbar_autoclose = false,

    -- 排序
    tagbar_sort = true,

    -- 显示 tag 所在行号，0：不显示，1：右边，2：左边
    tagbar_show_tag_linenumber = 1,

    -- 显示 tag 下子 tag 数量
    tagbar_show_tag_count = true,
    
    -- 自动 wrap 过长的 tag
    tagbar_wrap = 1
})
