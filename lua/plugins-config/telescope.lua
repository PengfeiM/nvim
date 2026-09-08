local status, telescope = pcall(require, "telescope")
if not status then
	nvim_notify("no telescope")
	return
end

telescope.setup({
	defaults = {
		preview = {
			mime_hook = function(filepath, bufnr, opts)
				local is_image = function(filepath)
					local image_extensions = { "png", "jpg", "jpeg" } -- Supported image formats
					local split_path = vim.split(filepath:lower(), ".", { plain = true })
					local extension = split_path[#split_path]
					return vim.tbl_contains(image_extensions, extension)
				end
				if is_image(filepath) then
					local term = vim.api.nvim_open_term(bufnr, {})
					local function send_output(_, data, _)
						for _, d in ipairs(data) do
							vim.api.nvim_chan_send(term, d .. "\r\n")
						end
					end
					vim.fn.jobstart({
						"catimg",
						filepath, -- Terminal image viewer command
					}, { on_stdout = send_output, stdout_buffered = true, pty = true })
				else
					require("telescope.previewers.utils").set_preview_message(
						bufnr,
						opts.winid,
						"Binary cannot be previewed"
					)
				end
			end,
		},
	},
	extensions_list = { "themes", "terms" },
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
					paste = "<c-p>",
					-- paste = "<cr>",
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
					paste = { "p", "<cr>" },
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
-- aerial
telescope.load_extension("aerial")
