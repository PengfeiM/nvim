local status, telescope = pcall(require, "telescope")
if not status then
	nvim_notify("no telescope")
	return
end

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

-- 加载扩展
telescope.load_extension("fzf")
telescope.load_extension("ui-select")
