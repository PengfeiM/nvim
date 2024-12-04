local gitsigns = require("gitsigns")


gitsigns.setup({

    -- add key-binding on start up
    -- may encapsule a better start up function in the future
    -- on_attach = require("keybinding").gitSignsKeys(bufnr, )
    on_attach = function(bufnr)
        local keybinding = require("keybinding")

        keybinding.gitSignsKeys(bufnr, gitsigns)
    end
})
