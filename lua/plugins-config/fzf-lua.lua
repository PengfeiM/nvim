-- fzf-lua.lua
local status, fzf_lua = pcall(require, "fzf-lua")
if not status then
    vim.notify("没有找到 fzf-lua")
  return
end

-- 函数，搜索 TODO FIXME 等
function fzf_search_todo()
    fzf_lua.live_grep({
        -- 自定义搜索模式
        -- search = [[TODO|FIXME]],
        query = "TODO|FIXME",
        -- 使用 ripgrep 的正则表达式
        -- rg_opts = "--line-number --no-heading --color=always -i",
        -- 动作：默认直接打开文件，支持自定义
        actions = {
            -- ["default"] = fzf_lua.actions.file_edit, -- 默认打开文件
            ["default"] = fzf_lua.actions.file_sel_to_qf, -- 添加到 quickfix
            -- ["ctrl-q"] = fzf_lua.actions.file_sel_to_qf, -- 添加到 quickfix
        },
        -- 搜索目录，可自定义路径或项目根目录
        cwd = vim.fn.getcwd(), -- 当前工作目录
    })
end
