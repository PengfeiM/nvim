-- 主题配置
-- {
    -- 主题选择
    -- vim.cmd.colorscheme("cyberdream")
    vim.cmd.colorscheme("dracula")
    -- transparent background
    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })


    -- cyberdream 主题配置
    -- {
        require("cyberdream").setup({
            -- 透明色
            transparent = true,
            -- 斜体注释
            italic_comments = true,
            -- Modern borderless telescope theme - also applies to fzf-lua
            borderless_telescope = true,
            -- Set terminal colors used in `:terminal`
            terminal_colors = true,
        })
    -- }

    -- dracula 主题配置
    -- {
        require("dracula").setup({
            -- 透明背景
            transparent_bg = true, -- default false
            -- 斜体注释
            italic_comment = true, -- default false
            -- show the '~' characters after the end of buffers
            show_end_of_buffer = true, -- default false
        })
    --}
-- }
