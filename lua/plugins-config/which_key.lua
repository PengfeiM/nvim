local status, which_key = pcall(require, "which-key")
if not status then
	nvim_notify("which-key not found", vim.log.levels.WARN, {
		title = plugin_name,
	})
	return
end

which_key.setup({
	---@type false | "classic" | "modern" | "helix"
	preset = "helix",
})
