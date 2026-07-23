-- render_markdown.lua
local plugin_name = "render-markdown"
local status, r_md = pcall(require, "render-markdown")
if not status then
	nvim_notify("没有找到 render-markdown 插件", vim.log.levels.WARN, {
		title = plugin_name,
	})
	return
end

r_md.setup({
	-- Pre configured settings that will attempt to mimic various target user experiences.
	-- User provided settings will take precedence.
	-- | obsidian | mimic Obsidian UI                                          |
	-- | lazy     | will attempt to stay up to date with LazyVim configuration |
	-- | none     | does nothing                                               |
	preset = "obsidian",
	-- Filetypes this plugin will run on.
	file_types = { "markdown", "noice" },
	completions = {
		lsp = { enabled = true },
		blink = { enabled = true },
	},
})
