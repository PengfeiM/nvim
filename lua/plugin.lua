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
        -- NOTE: pre-downloaded, use it in the future
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },

    -- nvim-notify: 自定义通知插件
    {
        'rcarriga/nvim-notify',
    },

    -- rainbow 括号
    {
        "HiPhish/rainbow-delimiters.nvim",
    },
    -- =======================================================


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

    -- 顶部文件 tab 插件：bufferline
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    -- bufferline 协作插件：bufdelete
    {
        'famiu/bufdelete.nvim',
    },

    -- tagbar：代码大纲查看
    {
        'preservim/tagbar',
    },

    -- nvim-ufo：代码折叠
    -- {
    --     'kevinhwang91/nvim-ufo',
    --     dependencies = 'kevinhwang91/promise-async',
    -- },

    -- fzf-lua：文件管理插件
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
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
    -- indent-blankline: 显示缩进
    { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
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
    -- 自动补全插件
    {
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-vsnip",
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        "mortepau/codicons.nvim",
    },
    {
        -- 常见片段
        "rafamadriz/friendly-snippets",
    },
    -- 括号自动补全
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },
    -- beauty 自动补全
    {
        "onsails/lspkind.nvim",
    },
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
    --
    -- 在 lualine 中显示 lsp 状态
    {
        'arkav/lualine-lsp-progress',
    },
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
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    }
    -- ============================================================================================
})
--}
