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


        -- fzf-lua：文件管理插件
        {
            "ibhagwan/fzf-lua",
            -- optional for icon support
            dependencies = { "nvim-tree/nvim-web-devicons" },
        },


        -- nvim-treesitter: 语法插件
        {
            'nvim-treesitter/nvim-treesitter',
        },


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
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/nvim-cmp',
        },
        -- beauty 自动补全
        {
            "onsails/lspkind.nvim",
        },
    })
--}
