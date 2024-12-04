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
    -- 设置 nvim-tree 透明背景
    vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

    -- =====================================================================
    -- 自定义一些配色
    -- ---------------------------------------------------------------------
    -- 引用 dracula 颜色
    local colors = require('dracula').colors()


    -- nvim-tree 配置自定义
    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg=colors.purple, bold = true})
    vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg=colors.purple, bold = true})
    vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg=colors.cyan, bold = true})

    -- tagbar 颜色自定义
    vim.api.nvim_set_hl(0, "TagbarHighlight", { fg=colors.menu, bg = colors.bright_green })
    -- , ctermbg = colors.bright_green

    -- illuminate 同变量高亮自定义
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { fg = colors.black, bg = colors.green, underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { fg = colors.black, bg = colors.green, underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { fg = colors.black, bg = colors.bright_green, bold = true })
    -- =====================================================================



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
