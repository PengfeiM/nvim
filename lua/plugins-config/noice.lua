local status, noice = pcall(require, "noice")
if not status then
	nvim_notify("noice not found", vim.log.levels.WARN, {
		title = "noice",
	})
end

local shell_return = {
	event = "msg_show",
	kind = { "shell_ret", "shell_out", "shell_err" },
	max_height = 20,
	cond = function(message)
		-- 让 notify 的 title = 刚才执行的 shell 命令（通常来自 `:!cmd`）
		-- Noice 会把当时的 cmdline 快照挂在 message.cmdline 上
		local title
		if message and message.cmdline and message.cmdline.state then
			local firstc = message.cmdline.state.firstc or ""
			local input = message.cmdline:get() or ""
			local cmdline = firstc .. input
			-- 优先提取 `:! ...` 的真实 shell 命令
			title = cmdline:match("^:%s*!%s*(.+)$") or cmdline
			title = vim.trim(title)
			-- 软截断，避免 notify 标题过长
			if vim.fn.strchars(title) > 80 then
				title = vim.fn.strcharpart(title, 0, 80) .. "…"
			end
		end

		message.opts = message.opts or {}
		if title ~= nil and title ~= "" then
			message.opts.title = title
		end
        -- always return true to avoid msg suppress.
		return true
	end,
}

local long_msg = {
	event = "msg_show",
	min_height = 20,
}

noice.setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
		hover = { enabled = false },
		signature = { enabled = false },
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},

	-- custom routes
	routes = {
		-- show shell stdout, stderr in split
		{
			filter = shell_return,
			-- view = "popup",
			view = "notify",
			opts = {
				stop = false,
                -- title works for notify
				title = "shell_output",
			},
		},
		-- always route any messages with more than 20 lines to the split view
		{
			filter = long_msg,
			view = "split",
		},
	},
})
