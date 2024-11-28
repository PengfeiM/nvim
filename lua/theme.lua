-- 主题配置
-- {
    -- 主题选择
    -- vim.cmd.colorscheme("cyberdream")
    vim.cmd.colorscheme("dracula")


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

        })
    --}
-- }
