local plugin_name = "alpha"
local status, alpha = pcall(require, "alpha")
if not status then
	nvim_notify("dashboard.alpha not found", vim.log.levels.WARN, {
		title = plugin_name,
	})
	return
end

local theta = require("alpha.themes.theta")
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

-- load alpha
alpha.setup(
	-- use theta
	theta.config
)
