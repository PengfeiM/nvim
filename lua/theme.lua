-- 主题配置
-- {
    -- =====================================================================
    -- 自定义一些配色
    -- ---------------------------------------------------------------------
    -- 引用 dracula 颜色
    local dracula_colors = require('dracula').colors()

    local custom_colors = {
        dark_cyan = "#4ACDDA",
    }
    -- local cyberdream_colors = require("cyberdream").colors.default
    local cyberdream_colors = {
        bg = "#16181a",
        bgAlt = "#1e2124",
        bgHighlight = "#3c4048",
        fg = "#ffffff",
        grey = "#7b8496",
        blue = "#5ea1ff",
        green = "#5eff6c",
        cyan = "#5ef1ff",
        red = "#ff6e5e",
        yellow = "#f1ff5e",
        magenta = "#ff5ef1",
        pink = "#ff5ea0",
        orange = "#ffbd5e",
        purple = "#bd5eff",
    }
    -- nvim-tree 配置自定义
    -- vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg=dracula_colors.purple, bold = true})
    -- vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg=dracula_colors.purple, bold = true})
    -- vim.api.nvim_set_hl(0, "NvimTreeIndentMarker", { fg=dracula_colors.cyan, bold = true})

    -- tagbar 颜色自定义
    -- vim.api.nvim_set_hl(0, "TagbarHighlight", { fg=dracula_colors.menu, bg = dracula_colors.bright_green })
    -- , ctermbg = colors.bright_green

    -- illuminate 同变量高亮自定义
    -- vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = colors.nontext, underline = true })
    -- vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = colors.nontext, underline = true })
    -- vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = colors.visual, bold = true })
    -- =====================================================================

    -- cyberdream 主题配置
    -- {
        require("cyberdream").setup({
            -- 透明色
            transparent = true,
            -- 斜体注释
            italic_comments = true,
            -- Modern borderless telescope theme - also applies to fzf-lua
            borderless_telescope = false,
            -- Set terminal colors used in `:terminal`
            terminal_colors = true,

            -- override some highlight
            highlights = {
                -- Example:
                -- Comment = { fg = "#696969", bg = "NONE", italic = true },
                Search = { fg = cyberdream_colors.bgAlt, bg = custom_colors.dark_cyan },
                CurSearch = { fg = cyberdream_colors.bgAlt, bg = cyberdream_colors.cyan, bold = true },
            },
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

    -- catppuccin 主题配置
    -- {
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            transparent_background = true, -- enables setting the background color.        })
        })
    --} 
    -- tokyo night
    --{
        require("tokyonight").setup({
            transparent = true, -- Enable this to disable setting the background color
            -- transparent = false, -- Enable this to disable setting the background color
            styles = {
                -- Style to be applied to different syntax groups
                -- Value is any valid attr-list value for `:help nvim_set_hl`
                comments = { italic = true },
                keywords = { italic = true },
                functions = { italic = true },
                -- variables = { italic = true },
                -- Background styles. Can be "dark", "transparent" or "normal"
                sidebars = "transparent", -- style for sidebars, see below
                floats = "transparent", -- style for floating windows
            },
            -- sidebars = { "aerial", "NvimTree" },
            lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
        })
    --}
-- }
-- 主题选择
-- vim.cmd.colorscheme("cyberdream")
-- vim.cmd.colorscheme("dracula")
-- read from conf: ~/.config/nvim/conf/config.lua
local home = os.getenv("HOME")
local config_path = home.."/.config/nvim/conf/config.lua"
-- try read conf
local ok, config = pcall(dofile, config_path)
if ok and config and config.theme then
    -- 成功读取配置文件且有主题设置
    vim.cmd.colorscheme(config.theme)
else
    -- 读取失败或没有主题设置，使用回退主题
    vim.notify("Failed to load theme from config, falling back to 'dracula'", vim.log.levels.WARN)
    vim.cmd.colorscheme("dracula")
end
