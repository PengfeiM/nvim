-- nvim-treesitter
local status, nvim_treesitter = pcall(require, "nvim-treesitter")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end


-- 配置
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the listed parsers MUST always be installed)
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "go",
        "gomod",
        "gosum",
        "python",
        "bash",
    },

    -- 代码高亮模块
    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },

    indent = {
        enable = true, -- 自动缩进
    },
    fold = {
        enable = true, -- 启用折叠功能
        disable = {},
    },
}

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.gotmpl = {
    install_info = {
        url = "https://github.com/ngalaiko/tree-sitter-go-template",
        files = { "src/parser.c" },
    },
    filetype = "gotmpl",
    used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml", "tpl" },
}

nvim_treesitter.setup({})
