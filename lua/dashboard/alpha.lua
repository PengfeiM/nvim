local plugin_name = "alpha"
local status, alpha = pcall(require, "alpha")
if not status then
	nvim_notify("dashboard.alpha not found", vim.log.levels.WARN, {
		title = plugin_name,
	})
	return
end

local theta = require("alpha.themes.theta")
local dashboard = require("alpha.themes.dashboard")
-- available: devicons, mini, default is mini
-- if provider not loaded and enabled is true, it will try to use another provider
theta.file_icons.provider = "devicons"
theta.header.val = {
	[[　　　 　　/＾>》, -―‐‐＜＾}]],
	[[　　　 　./:::/,≠´::::::ヽ.]],
	[[　　　　/::::〃::::／}::丿ハ]],
	[[　　　./:::::i{l|／　ﾉ／ }::}]],
	[[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
	[[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
	[[　 |:::::::|／}｀ｽ /          /]],
	[[.　|::::::|(_:::つ/ MacBook /　neovim!]],
	[[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
}
theta.header.opts = {
	position = "center",
	-- hl = "Type",
	hl = "Operator",
}
-- this is a overwrite
theta.buttons.val = {
	{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
	{ type = "padding", val = 1 },
	dashboard.button("e", "  New file", "<cmd>ene<CR>"),
	dashboard.button("n", "󰐅  Nvim tree", "<cmd>NvimTreeOpen<CR>"),
	dashboard.button("SPC f f", "󰈞  Find file"),
	dashboard.button("SPC f g", "󰊄  Live grep"),
	dashboard.button("c", "  Configuration", "<cmd>exe 'cd' stdpath('config')<CR>"),
	dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
	dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
}

-- load alpha
alpha.setup(
	-- use theta
	theta.config
)
