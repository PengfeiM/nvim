-- utils.lua
-- 存放一些有用的通用函数

local utilFuncs = {}
local opt = { noremap = true, silent = true }

-- 定义快捷键函数
utilFuncs.LspKeybind = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require("keybinding").lspKeybinding(buf_set_keymap)
end

-- function LspKeybind(client, bufnr)
--     local function buf_set_keymap(...)
--         vim.api.nvim_buf_set_keymap(bufnr, ...)
--     end
--     -- 绑定快捷键
--     require("keybinding").lspKeybinding(buf_set_keymap)
-- end

utilFuncs.ConfLspKeybind = function(client, bufnr)
    -- diff with upper LspKeybind
    --   * no jump def or ref
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- show diagnostic in line
    buf_set_keymap("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    -- show diagnostic in file
    buf_set_keymap("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", opt)
    -- show diagnostic in workspace
    buf_set_keymap("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opt)
    -- format
    buf_set_keymap("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opt)
end


return utilFuncs
