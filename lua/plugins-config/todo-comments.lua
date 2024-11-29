-- todo-comments.lua
local status, todo_comments = pcall(require, "todo-comments")
if not status then
    vim.notify("找不到 todo-comments")
    return
end


-- ====================================
-- some demonstration below
-- --------------------------
-- TODO: 
-- FIXME:
-- FIXIT:
-- BUG:
-- ISSUE:
-- NOTE:
-- HACK:
-- WARN:
-- PERF:
-- TEST:
-- ====================================

-- todo-comments 配置
todo_comments.opt = {
    -- TODO: 添加一些配置，留空则代表使用默认配置
}

todo_comments.setup({})
