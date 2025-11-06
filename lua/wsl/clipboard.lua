-- clipboard.lua
-- clipboard setting for wsl neovim
-- which I copy from help clipboard-wsl

--[[
let g:clipboard = {
      \   'name': 'WslClipboard',
      \   'copy': {
      \      '+': 'clip.exe',
      \      '*': 'clip.exe',
      \    },
      \   'paste': {
      \      '+': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \      '*': 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      \   },
      \   'cache_enabled': 0,
      \ }
]]
-- make it lua
--[[
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "clip.exe",
		["*"] = "clip.exe",
	},
	paste = {
		["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
	},
	cache_enabled = 0,
}
]]
-- clip.exe is not working in wsl.Debian, use xclip instead.
-- 使用 xclip
if vim.fn.executable("xclip") == 1 then
	vim.g.clipboard = {
		name = "xclip",
		copy = {
			["+"] = "xclip -selection clipboard",
			["*"] = "xclip -selection clipboard",
		},
		paste = {
			["+"] = "xclip -selection clipboard -o",
			["*"] = "xclip -selection clipboard -o",
		},
		cache_enabled = false,
	}
	vim.o.clipboard = "unnamedplus"
	print("Clipboard: using xclip")
elseif vim.fn.executable("xsel") == 1 then
	vim.g.clipboard = {
		name = "xsel",
		copy = {
			["+"] = "xsel --clipboard --input",
			["*"] = "xsel --clipboard --input",
		},
		paste = {
			["+"] = "xsel --clipboard --output",
			["*"] = "xsel --clipboard --output",
		},
		cache_enabled = false,
	}
	vim.o.clipboard = "unnamedplus"
	print("Clipboard: using xsel")
else
	print("Please install xclip or xsel for clipboard support")
end
