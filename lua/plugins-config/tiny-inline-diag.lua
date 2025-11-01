-- tiny-inline-diag.lua

local status, tiny_diag = pcall(require, "tiny-inline-diagnostic")
if not status then
	nvim_notify("tiny-inline-diagnostic not found")
	return
end

tiny_diag.setup({
	-- Choose a preset style for diagnostic appearance
	-- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
	preset = "ghost",

	-- Make diagnostic background transparent
	transparent_bg = false,

	-- Make cursorline background transparent for diagnostics
	transparent_cursorline = true,

	options = {
		add_messages = {
			display_count = true,
		},
		multilines = {
			enabled = true,
		},
		show_source = {
			enabled = false,
		},
	},
})
