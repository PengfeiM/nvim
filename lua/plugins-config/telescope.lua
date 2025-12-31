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
-- optional extensions
telescope.load_extension("goimpl")
-- try load neoclip
local neoclip_exist, neoclip = pcall(require, "neoclip")
if not neoclip_exist then
	nvim_notify("neoclip not found")
else
	neoclip.setup({
		keys = {
			telescope = {
				i = {
					select = "<c-y>",
					-- paste = "<c-p>",
					paste = "<cr>",
					-- paste_behind = "<c-P>",
                    paste_behind = nil,
					replay = "<c-q>", -- replay a macro
					delete = "<c-d>", -- delete an entry
					edit = "<c-e>", -- edit an entry
					custom = {},
				},
				n = {
					select = "y",
					-- paste = "p",
					--- It is possible to map to more than one key.
					paste = { 'p', '<cr>' },
					paste_behind = "P",
					replay = "q",
					delete = "d",
					edit = "e",
					custom = {},
				},
			},
		},
	})
	telescope.load_extension("neoclip")
end
