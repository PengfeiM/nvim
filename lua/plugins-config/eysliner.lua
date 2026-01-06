-- eyeliner.lua
local status, eyeliner = pcall(require, "eyeliner")
if not status then
	nvim_notify("eyeliner not found")
    return
end

eyeliner.setup({
	-- show highlights only after keypress
	highlight_on_key = true,

	-- dim all other characters if set to true (recommended!)
	-- dim = false,
	dim = true,

	-- set the maximum number of characters eyeliner.nvim will check from
	-- your current cursor position; this is useful if you are dealing with
	-- large files: see https://github.com/jinh0/eyeliner.nvim/issues/41
	max_length = 9999,

	-- filetypes for which eyeliner should be disabled;
	-- e.g., to disable on help files:
	-- disabled_filetypes = {"help"}
	disabled_filetypes = {"NvimTree"},

	-- buftypes for which eyeliner should be disabled
	-- e.g., disabled_buftypes = {"nofile"}
	disabled_buftypes = {"nofile"},

	-- add eyeliner to f/F/t/T keymaps;
	-- see section on advanced configuration for more information
	default_keymaps = true,
})

-- set color, make it undependent with tree-sitter.
vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg='#f5a97f', bold = true, underline = true })
vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg='#89b4fa', underline = true })
vim.api.nvim_set_hl(0, 'EyelinerDimmed', { fg='#939ab7', underline = true })
