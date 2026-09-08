local gitsigns = require("gitsigns")

gitsigns.setup({

	-- add key-binding on start up
	-- may encapsule a better start up function in the future
	-- on_attach = require("keybinding").gitSignsKeys(bufnr, )
	on_attach = function(bufnr)
		local keybinding = require("keybinding")

		keybinding.gitSignsKeys(bufnr, gitsigns)
	end,

	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`

	-- enable current line blame
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_formatter = "<abbrev_sha>, <author>, <author_time:%R> - <summary>",
})
