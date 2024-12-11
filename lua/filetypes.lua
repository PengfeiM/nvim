-- filetypes.lua
-- ⣿⣿⠟⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢋⣩⣉⠹⣿⣿
-- ⣿⣿ ⣿⣶⣕⣈⠹⠿⠿⠿⠿⠟⠛⣛⢋⣰⠣⣿⣿⠀⣿⣿
-- ⣿⣿⡀⣿⣿⣿⣧⢻⣿⣶⣷⣿⣿⣿⣿⣿⣿⠿⠶⡝⠀⣿⣿
-- ⣿⣿⣷⠘⣿⣿⣿⢏⣿⣿⣋⣀⣈⣻⣿⣿⣷⣤⣤⣿⡐⢿⣿
-- ⣿⣿⣿⣆⢩⣝⣫⣾⣿⣿⣿⣿⡟⠿⠿⠦⠀⠸⠿⣻⣿⡄⢻
-- ⣿⣿⣿⣿⡄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⠇⣼
-- ⣿⣿⣿⣿⣿⡄⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣰⣿
-- ⣿⣿⣿⣿⣿⠇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⣿⣿
-- ⣿⣿⣿⣿⠏⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢸⣿⣿
-- ⣿⣿⣿⠟⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿
-- ⣿⣿⠋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⣿
-- ⣿⠋⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿
-- 文件类型的一些操作

local plugin_name = "custom_filetypes"
-- 文件类型映射表
local custom_filetypes = {
    -- ["json.tpl"] = "JSON File",
    -- ["toml.tpl"] = "TOML File",
    -- ["yaml.tpl"] = "YAML File",
    -- ["yml.tpl"] = "YAML File",
    json = "json",
    html = "html",
    toml = "toml",
    yaml = "yaml",
    yml = "yaml",
}

-- 获取文件类型的函数
local function get_file_type(filename)
    local ext = filename:match("^.+%.([a-zA-Z0-9]+)%.tpl$") -- 提取后缀
    if ext then
        return custom_filetypes[ext:lower()] or "unknown"
    else
        return "No Extension Found"
    end
end


-- 使用全局变量定义的 nvim-notify，一个异步的 notify 插件
-- local notify = require("globalvars").nvim_notify
-- 自动命令：自动识别 tpl 文件的类型
-- 仅在 .tpl 文件中启用
--
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*.tpl",                        -- 仅匹配 .tpl 文件
    callback = function()
        local filename = vim.fn.expand("%:t") -- 获取当前文件名
        local filetype = get_file_type(filename)
        -- vim.notify("File Type: " .. filetype, vim.log.levels.INFO) -- 使用通知显示文件类型
        -- nvim_notify("File Type: " .. filetype, vim.log.levels.INFO, {
        --     title = plugin_name,
        -- })                                                                     -- 使用通知显示文件类型
        if filetype and filetype ~= "unknown" then
            vim.bo.filetype = filetype                                         -- 动态设置文件类型
            -- vim.notify("File Type set to: " .. filetype, vim.log.levels.INFO) -- 通知用户
            nvim_notify("File Type set to: " .. filetype, vim.log.levels.INFO, {
                title = plugin_name,
            }) -- 通知用户
            return
        else
            -- vim.notify("Unknown File Type for: " .. filename, vim.log.levels.WARN)
            nvim_notify("Unknown File Type for: " .. filename, vim.log.levels.WARN, {
                title = plugin_name,
            })
            return
        end
    end,
})
