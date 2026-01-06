local status, nvim_tips = pcall(require, "neovim_tips")

if not status then
	nvim_notify("neovim_tips not found")
	return
end

nvim_tips.setup({
	-- Daily tip mode: 0=off, 1=once per day, 2=every startup
	daily_tip = 1,
	-- Show footer in daily tip popup (set to false to hide contribution links)
	show_daily_tip_footer = true,
	-- Bookmark symbol (default: 🌟)
	bookmark_symbol = "🌟 ",

	-- Enable caching for faster loading (default: true, recommended)
	use_cache = true,
})
