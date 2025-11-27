-- barbar.lua
local status, bar = pcall(require, "barbar")
if not status then
	nvim_notify("barbar not found")
end

vim.g.barbar_auto_setup = false -- disable auto-setup

bar.setup({
	-- Set the filetypes which barbar will offset itself for
	sidebar_filetypes = {
		NvimTree = true,
	},
	icons = {
		-- Configure the base icons on the bufferline.
		-- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
		buffer_index = true,
		buffer_number = false,
		-- Enables / disables diagnostic symbols
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = true },
			[vim.diagnostic.severity.WARN] = { enabled = true },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		gitsigns = {
			added = { enabled = true, icon = "+" },
			changed = { enabled = true, icon = "~" },
			deleted = { enabled = true, icon = "-" },
		},
		pinned = { button = "", filename = true },
	},
})
