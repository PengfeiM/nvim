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
    -- catppuccin config
    --{
        require("catppuccin").setup({
            flavour = "auto", -- latte, frappe, macchiato, mocha
            transparent_background = true, -- enables setting the background color.
            float = {
                transparent = true, -- enable transparent floating windows
                solid = false, -- use solid styling for floating windows, see |winborder|
            },
            show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
                loops = {},
                functions = {},
                keywords = {"italic"},
                strings = {},
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {"bold", "italic"},
                operators = {},
                -- miscs = {}, -- Uncomment to turn off hard-coded styles
            },
            default_integrations = true,
            auto_integrations = true,
            integrations = {
                aerial = true,
                blink_cmp = {
                    style = 'bordered',
                },
                cmp = true,
                fidget = true,
                gitsigns = true,
                lsp_saga = true,
                nvimtree = true,
                notify = false,
            },
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
                keywords = { italic = true, bold = true },
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
    -- onedark pro
    --{
        require("onedarkpro").setup({
            colors = {}, -- Override default colors or create your own
            highlights = {}, -- Override default highlight groups or create your own
            styles = { -- For example, to apply bold and italic, use "bold,italic"
                types = "italic", -- Style that is applied to types
                methods = "italic", -- Style that is applied to methods
                numbers = "NONE", -- Style that is applied to numbers
                strings = "NONE", -- Style that is applied to strings
                comments = "italic", -- Style that is applied to comments
                keywords = "bold,italic", -- Style that is applied to keywords
                constants = "bold", -- Style that is applied to constants
                functions = "bold", -- Style that is applied to functions
                operators = "NONE", -- Style that is applied to operators
                variables = "NONE", -- Style that is applied to variables
                parameters = "italic", -- Style that is applied to parameters
                conditionals = "italic", -- Style that is applied to conditionals
                virtual_text = "italic", -- Style that is applied to virtual text
            },
            filetypes = { -- Override which filetype highlight groups are loaded
                c = true,
                comment = true,
                go = true,
                html = true,
                java = true,
                javascript = true,
                json = true,
                lua = true,
                markdown = true,
                php = true,
                python = true,
                ruby = true,
                rust = true,
                scss = true,
                toml = true,
                typescript = true,
                typescriptreact = true,
                vue = true,
                xml = true,
                yaml = true,
            },
            plugins = { -- Override which plugin highlight groups are loaded
                aerial = true,
                barbar = true,
                blink_cmp = true,
                codecompanion = true,
                copilot = true,
                dashboard = true,
                flash_nvim = true,
                gitgraph_nvim = true,
                gitsigns = true,
                hop = true,
                indentline = true,
                leap = true,
                lsp_saga = true,
                lsp_semantic_tokens = true,
                marks = true,
                mini_diff = true,
                mini_icons = true,
                mini_indentscope = true,
                mini_test = true,
                neotest = true,
                neo_tree = true,
                nvim_cmp = true,
                nvim_bqf = true,
                nvim_dap = true,
                nvim_dap_ui = true,
                nvim_hlslens = true,
                nvim_lsp = true,
                nvim_navic = true,
                nvim_notify = true,
                nvim_tree = true,
                nvim_ts_rainbow = true,
                op_nvim = true,
                packer = true,
                persisted = true,
                polygot = true,
                rainbow_delimiters = true,
                render_markdown = true,
                startify = true,
                telescope = true,
                toggleterm = true,
                treesitter = true,
                trouble = true,
                vim_ultest = true,
                which_key = true,
                vim_dadbod_ui = true,
            },

            options = {
                cursorline = true, -- Use cursorline highlighting?
                transparency = true, -- Use a transparent background?
                terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
                lualine_transparency = true, -- Center bar transparency?
                highlight_inactive_windows = true, -- When the window is out of focus, change the normal background?
            }
        })
    --}
--}
-- }
-- 主题选择
-- vim.cmd.colorscheme("cyberdream")
-- read from conf: ~/.config/nvim/conf/config.lua
local home = os.getenv("HOME")
local config_path = home.."/.config/nvim/conf/config.lua"
local config = dofile(config_path)
vim.cmd.colorscheme(config.theme)
