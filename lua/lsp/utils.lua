-- utils.lua
-- 存放一些有用的通用函数

local utilFuncs = {}

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



return utilFuncs
