-- 插件管理
-- {
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- trae: get url from env
-- local trae_url = os.getenv("TRAE_URL")

-- 插件列表
require("lazy").setup({
    -- 通用插件
    -- =======================================================
    -- themes, 主题
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "Mofiqul/dracula.nvim",
        name = "dracula",
        lazy = false,
        priority = 1000,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    {
        -- tokyonight
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        -- onedarkpro
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
    },

    -- nvim-notify: 自定义通知插件
    {
        'rcarriga/nvim-notify',
    },
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- better f,F,t,T
    {
        'jinh0/eyeliner.nvim',
    },

    {
        "saxon1964/neovim-tips",
        version = "*", -- Only update on tagged releases
        lazy = true,   -- Load only when keybinds are triggered
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL: Choose your preferred markdown renderer (or omit for raw markdown)
            "MeanderingProgrammer/render-markdown.nvim", -- Clean rendering
            -- OR: "OXY2DEV/markview.nvim", -- Rich rendering with advanced features
        },
        opts = {
            -- IMPORTANT: Daily tip DOES NOT WORK with lazy = true
            -- Reason: lazy = true loads plugin only when keybinds are triggered,
            --         but daily_tip needs plugin loaded at startup
            -- Solution: Keep daily_tip = 0 here, or use Option 2 below for daily tips
            daily_tip = 0, -- 0 = off, 1 = once per day, 2 = every startup
            -- Other optional settings...
            bookmark_symbol = "🌟 ",
        },
    },

    -- rainbow 括号
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    -- =======================================================

    -- function
    -- ======================================================
    -- autosave
    {
        "okuuva/auto-save.nvim",
        version = '*', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
        -- lazyload not good
        -- cmd = "ASToggle", -- optional for lazy loading on command
        -- event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
        opts = {
            -- your config goes here
            -- or just leave it empty :)
            -- diaplay save message
            debounce_delay = 0, -- delay after which a pending save is executed
        },
    },
    -- undo tree
    {
        "XXiaoA/atone.nvim",
        cmd = "Atone",
    },


    -- git
    -- =======================================================
    -- 行 git 状态
    {
        "lewis6991/gitsigns.nvim",
    },

    -- -----------------------------------
    -- lazygit
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    -- =======================================================

    -- 帮助插件 which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        -- opts = {
        --     -- your configuration comes here
        --     -- or leave it empty to use the default settings
        --     -- refer to the configuration section below
        -- },
        keys = {
            -- TODO: move it to keybindings.lua
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    -- =======================================================
    -- 功能插件
    -- ---------------------------------------------------
    -- nvim tree, a table of content
    -- 目录插件
    {
        "kyazdani42/nvim-tree.lua",
        event = "VimEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
    },

    -- 状态栏插件：lualine
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- -- 顶部文件 tab 插件：bufferline
    -- use barbar instead
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
    },

    -- aerial: 代替 tagbar 的大纲
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    },

    -- telescope: nvim version fzf-lua
    {
        'nvim-telescope/telescope.nvim', -- tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim',
            -- optional
            "AckslD/nvim-neoclip.lua",
            'edolphin-ydf/goimpl.nvim',
        }
    },


    -- nvim-treesitter: 语法高亮插件
    {
        'nvim-treesitter/nvim-treesitter',
        'nvim-treesitter/nvim-treesitter-context',
    },
    -- vim-illuminate: 语法高亮增强，自动高亮当前变量
    {
        "RRethy/vim-illuminate",
    },
    -- todo-comments: 特殊注释高亮搜索
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    -- ======================================================


    -- ======================================================
    -- lsp 插件
    -- ---------------------------------------------------
    -- lspconfig
    {
        "neovim/nvim-lspconfig",
    },
    -- mason
    {
        "williamboman/mason.nvim",
    },
    -- mason-lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
    },
    -- lspsaga: lsp 增强插件
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },

    -- tiny-inline-diagnostic, beautiful diagnostic
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        end,
    },
    -- ---------------------------------------------------
    {
        -- 常见片段
        "rafamadriz/friendly-snippets",
    },
    -- 括号自动补全
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },
    -- use blink instead
    -- blink.cmp
    {
        "saghen/blink.cmp",
        version = "*", -- 最新稳定版
        dependencies = {
            'rafamadriz/friendly-snippets',
            'xzbdmw/colorful-menu.nvim', -- optional, only makes cmp menu more beautiful
            'xieyonn/blink-cmp-dat-word',
        },
    },
    {
        'saghen/blink.indent',
        --- @module 'blink.indent'
        --- @type blink.indent.Config
        -- opts = {},
    },

    -- blink-ripgrep

    -- --------------------------------------------------
    -- 格式化
    -- null-ls
    {
        -- 'jose-elias-alvarez/null-ls.nvim',
        'nvimtools/none-ls.nvim',
    },

    -- prettier 格式化 json 等
    {
        'MunifTanjim/prettier.nvim',
    },
    -- ---------------------------------------------------
    -- ============================================================================================


    -- #####################################################################################################


    -- 指定插件
    -- ============================================================================================
    -- MARKDOWN
    -- ---------------------------------------------------
    -- markdown-preview: markdown 预览
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" }, -- 仅在 markdown 文件中加载
        build = "cd app && yarn install",
        config = function()
            -- 仅在 md 文件中启用对应的快捷键
            require("plugins-config.markdown.keybinding").markdown_preview_keymaps(0)
        end,
    },
    -- markdown render inside nvim
    {
        'MeanderingProgrammer/render-markdown.nvim',
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    }
    -- ============================================================================================
})
--}
