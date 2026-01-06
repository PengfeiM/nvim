-- auto-save.lua
-- configurations for auto-save
local status, auto_save = pcall(require, "auto-save")
if not status then
	nvim_notify("no auto-save plugin found")
	return
end

local plugin_name = "auto-save"

auto_save.setup({
	enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
	trigger_events = { -- See :h events
		immediate_save = { "BufLeave", "FocusLost", "QuitPre", "VimSuspend" }, -- vim events that trigger an immediate save
		defer_save = { "InsertLeave", "TextChanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
		cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
	},
	condition = function(buf)
		return vim.bo[buf].filetype ~= "TelescopePrompt"
	end,
	write_all_buffers = false, -- write all buffers when the current one meets `condition`
	noautocmd = false, -- do not execute autocmds when saving
	lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
	debounce_delay = 10, -- delay after which a pending save is executed
	-- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
	debug = false,
})

-- =========================================
-- add some auto cmd
-- add a augroup
local group = vim.api.nvim_create_augroup("autosave", {})
-- display message when auto save a buffer
vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveWritePost",
	group = group,
	callback = function(opts)
		if opts.data.saved_buffer ~= nil then
			local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
			-- vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO)
			-- use nvim notify
			local relative_path = vim.fn.fnamemodify(filename, ":.") -- 相对文件路径（项目根）
			nvim_notify(
				"AutoSave: saved " .. relative_path .. " at " .. vim.fn.strftime("%H:%M:%S"),
				vim.log.levels.INFO,
				{
					title = plugin_name,
					icon = "💾",
				}
			)
		end
	end,
})
-- display message when auto-save enable/disable
vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveEnable",
	group = group,
	callback = function(opts)
		-- vim.notify('AutoSave enabled', vim.log.levels.INFO)
		-- use nvim notify
		nvim_notify("AutoSave enabled", vim.log.levels.INFO, {
			title = plugin_name,
			icon = "💾",
		})
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveDisable",
	group = group,
	callback = function(opts)
		-- vim.notify('AutoSave disabled', vim.log.levels.INFO)
		-- use nvim notify
		nvim_notify("AutoSave disabled", vim.log.levels.INFO, {
			title = plugin_name,
			icon = "💾",
		})
	end,
})
-- =========================================
