-- plan1: virtual_lines
-- best, generate a virtual_line, to show info and location
vim.diagnostic.config(
    {
        bufferline = true,
        float = true,
        jump = {
            float = false,
            wrap = true
        },
        severity_sort = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        virtual_lines = {
            only_current_line = false, -- 显示所有行的诊断（设为 `true` 则仅当前行）
            highlight_whole_line = false, -- 是否高亮整行
        },
        virtual_text = false,
    })

-- plan2: virtual_text
-- backup: show diag in line, behind git blame
-- vim.diagnostic.config({
--         bufferline = true,
--         float = true,
--         jump = {
--             float = false,
--             wrap = true
--         },
--         severity_sort = false,
--         signs = true,
--         underline = true,
--         update_in_insert = false,
--         virtual_lines = false,
--         virtual_text = true,
-- })

-- plan3: float diag
-- need automatic config, not implemented yet
-- vim.diagnostic.config({
--     bufferline = true,
--     -- float = true,
--     float = {
--         border = "rounded",
--         source = "always", -- 显示诊断来源
--
--     },
--     jump = {
--         float = false,
--         wrap = true
--     },
--     severity_sort = false,
--     signs = true,
--     underline = true,
--     update_in_insert = false,
--     virtual_lines = false,
--     virtual_text = false,
-- })
