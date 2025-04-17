-- plugins-config.lualine
--

local status, lualine = pcall(require, "lualine")
if not status then
    vim.notify("没有找到 lualine")
    return
end


-- 引入 venv 函数
local lsp_venv = require('lsp.lsp_venv')


lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        -- theme = 'dracula',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
        }
    },
    sections = {
        lualine_a = {
            'mode',
            -- {
            --     -- 显示 spell 检查状态
            --     function()
            --         if vim.wo.spell then
            --             return '󰓆 '..vim.o.spelllang
            --         else
            --             return ''
            --         end
            --     end,
            --     color = { fg='#21222c'},
            -- },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
            'filename',
            'lsp_progress',
        },
        lualine_x = {
            'encoding',
            'fileformat',
            {
                function()
                    local msg = "No Active Lsp"
                    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                    local clients = vim.lsp.get_active_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    local clients_name = {}
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            -- return "LSP"
                            -- return client.name
                            table.insert(clients_name, client.name)
                        end
                    end
                    if #clients_name > 0 then
                        return table.concat(clients_name, ",")
                    end
                    return msg
                end,

                icon = " ",
            },
        },
        -- lualine_y = {'selectioncount', 'searchcount'},
        lualine_y = { 'filetype', lsp_venv.get_lsp_venv },
        -- lualine_z = {'progress', 'location'}
        lualine_z = {
            'selectioncount',
            'searchcount',
            {
                function()
                    local current_line = vim.fn.line('.')                -- 当前行
                    local total_lines = vim.fn.line('$')                 -- 总行数
                    local current_col = vim.fn.col('.')                  -- 当前列
                    local percent = math.floor((current_line / total_lines) * 100) -- 百分比

                    -- 格式化显示为：68% :677/994☰ ℅:3 %d%%
                    return string.format("%2d%%%% :%d/%d☰ ℅:%d", percent, current_line, total_lines, current_col)
                end,
                -- icon = '📜' -- 可选图标，可以根据需要调整
            }
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
