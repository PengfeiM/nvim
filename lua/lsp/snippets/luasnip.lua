-- luasnip.lua
local status, _ = pcall(require, "luasnip")
if not status then
    nvim_notify("luasnip not found")
    return
end


-- load frientdly snippets.
require("luasnip.loaders.from_vscode").lazy_load()
