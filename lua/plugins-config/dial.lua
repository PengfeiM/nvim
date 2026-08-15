return {
	"monaqa/dial.nvim",
	desc = "Increment and decrement numbers, dates, and more",
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			-- default group: used when no group name is specified
			default = {
				augend.integer.alias.decimal, -- 0, 1, 2, ...
				augend.integer.alias.decimal_int, -- -1592, 314, ...
				augend.integer.alias.hex, -- 0x00, 0x3f3f, ...
				augend.integer.alias.octal, -- 0o11, 0o24, ...
				augend.integer.alias.binary, -- 0b0101, 0b11001111, ...
				augend.date.alias["%Y/%m/%d"], -- 2024/01/23
				augend.date.alias["%Y-%m-%d"], -- 2024-01-23
				augend.date.alias["%m/%d"], -- 01/04, 12/25
				augend.date.alias["%H:%M:%S"], -- 14:30:00
				augend.date.alias["%H:%M"], -- 14:30
				augend.hexcolor.new({ case = "prefer_lower" }), -- #1a1a1a, #EEFEFE
				augend.constant.alias.bool, -- true <-> false
				augend.constant.alias.Bool, -- True <-> False
				augend.constant.alias.alpha, -- a, b, ..., z
				augend.constant.alias.Alpha, -- A, B, ..., Z
				augend.constant.alias.en_weekday, -- Mon, Tue, ..., Sun
				augend.constant.alias.en_weekday_full, -- Monday, Tuesday, ..., Sunday
				augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
				augend.constant.new({ elements = { "===", "!==" }, word = false, cyclic = true }),
				augend.semver.alias.semver, -- 1.2.3
			},
		})

		local map = require("dial.map")
		local keymaps = {
			{ "n", "<C-a>", "increment", "normal" },
			{ "n", "<C-x>", "decrement", "normal" },
			{ "n", "g<C-a>", "increment", "gnormal" },
			{ "n", "g<C-x>", "decrement", "gnormal" },
			{ "x", "<C-a>", "increment", "visual" },
			{ "x", "<C-x>", "decrement", "visual" },
			{ "x", "g<C-a>", "increment", "gvisual" },
			{ "x", "g<C-x>", "decrement", "gvisual" },
		}
		for _, k in ipairs(keymaps) do
			local mode, lhs, action, motion = k[1], k[2], k[3], k[4]
			vim.keymap.set(mode, lhs, function()
				map.manipulate(action, motion)
			end, { desc = ("dial: %s %s"):format(action, motion) })
		end
	end,
}
