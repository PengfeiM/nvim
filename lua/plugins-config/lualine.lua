-- plugins-config.lualine
--

local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("没有找到 lualine")
	return
end

-- 引入 venv 函数
local lsp_venv = require("lsp.lsp_venv")

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		-- theme = 'dracula',
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = {
			"mode",
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			"tabs",
			"filename",
		},
		lualine_x = {
			-- {
			-- 	function()
			-- 		local ok, noice = pcall(require, "noice")
			-- 		if ok then
			-- 			return noice.api.statusline.message.get()
			-- 		end
			-- 		return ""
			-- 	end,
			-- 	cond = function()
			-- 		local ok, noice = pcall(require, "noice")
			-- 		return ok and noice.api.statusline.message.has()
			-- 	end,
			-- 	color = { fg = "#ff9e64" },
			-- 	max_length = vim.o.columns / 3,
			-- },
			{
				function()
					local ok, noice = pcall(require, "noice")
					if ok then
						return noice.api.statusline.command.get()
					end
					return ""
				end,
				cond = function()
					local ok, noice = pcall(require, "noice")
					return ok and noice.api.statusline.command.has()
				end,
				color = { fg = "#ff9e64" },
			},
			{
				function()
					local ok, noice = pcall(require, "noice")
					if ok then
						return noice.api.statusline.mode.get()
					end
					return ""
				end,
				cond = function()
					local ok, noice = pcall(require, "noice")
					return ok and noice.api.statusline.mode.has()
				end,
				color = { fg = "#ff9e64" },
			},
			"encoding",
			"fileformat",
		},
		-- lualine_y = {'selectioncount', 'searchcount'},
		lualine_y = {
			{
				function()
					local ok, status = pcall(require, "sidekick.status")
					if ok then
						local cli_status = status.cli()
						if #cli_status > 0 then
							local s = cli_status[1]
							local text = " "
							if s.mux_session then
								text = text .. "[" .. (s.mux_backend or "tmux") .. ":" .. s.mux_session .. "]"
							end
							if #cli_status > 1 then
								text = text .. " (+" .. (#cli_status - 1) .. ")"
							end
							return text
						end
					end
					return ""
				end,
				cond = function()
					local ok, status = pcall(require, "sidekick.status")
					return ok and #status.cli() > 0
				end,
				color = { fg = "#7aa2f7" },
			},
			{
				"lsp_status",
				icon = "󱙝",
			},
			"filetype",
			lsp_venv.get_lsp_venv,
		},
		-- lualine_z = {'progress', 'location'}
		lualine_z = {
			"selectioncount",
			"searchcount",
			{
				function()
					local current_line = vim.fn.line(".") -- 当前行
					local total_lines = vim.fn.line("$") -- 总行数
					-- local current_col = vim.fn.col('.')                  -- 当前列
					local current_col = vim.fn.virtcol(".") -- 当前列, 视觉列，按照显示统计，而非字符数
					local percent = math.floor((current_line / total_lines) * 100) -- 百分比

					-- 格式化显示为：83% :101/121 :7
					return string.format("%2d%%%% :%d/%d :%d", percent, current_line, total_lines, current_col)
				end,
				-- icon = '📜' -- 可选图标，可以根据需要调整
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
