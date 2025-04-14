local gitsigns = require("gitsigns")


gitsigns.setup({

    -- add key-binding on start up
    -- may encapsule a better start up function in the future
    -- on_attach = require("keybinding").gitSignsKeys(bufnr, )
    on_attach = function(bufnr)
        local keybinding = require("keybinding")

        keybinding.gitSignsKeys(bufnr, gitsigns)
    end,

    -- enable current line blame
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_formatter = '<abbrev_sha>, <author>, <author_time:%R> - <summary>',
})
