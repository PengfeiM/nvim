-- auto-save.lua
-- configurations for auto-save

local plugin_name = "auto-save"

-- =========================================
-- add some auto cmd
-- add a augroup
local group = vim.api.nvim_create_augroup('autosave', {})
-- display message when auto save a buffer
vim.api.nvim_create_autocmd('User', {
    pattern = 'AutoSaveWritePost',
    group = group,
    callback = function(opts)
        if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
            -- vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO)
            -- use nvim notify
            local relative_path = vim.fn.fnamemodify(filename, ':.') -- 相对文爱你路径（项目根）
            nvim_notify('AutoSave: saved ' .. relative_path .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO, {
                title = plugin_name,
                icon = "💾",
            })
        end
    end,
})
-- display message when auto-save enable/disable
vim.api.nvim_create_autocmd('User', {
    pattern = 'AutoSaveEnable',
    group = group,
    callback = function(opts)
        -- vim.notify('AutoSave enabled', vim.log.levels.INFO)
        -- use nvim notify
        nvim_notify('AutoSave enabled', vim.log.levels.INFO, {
            title = plugin_name,
            icon = "💾",
        })
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'AutoSaveDisable',
    group = group,
    callback = function(opts)
        -- vim.notify('AutoSave disabled', vim.log.levels.INFO)
        -- use nvim notify
        nvim_notify('AutoSave disabled', vim.log.levels.INFO, {
            title = plugin_name,
            icon = "💾",
        })
    end,
})
-- =========================================
