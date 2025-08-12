-- markdown-preview.lua
-- local status, md_pre = pcall(require, "markdown-preview")
-- if not status then
--     vim.notify("没有找到 markdown-preview")
-- end
-- no need to load

local home = os.getenv("HOME")
local config_path = home.."/.config/nvim/conf/config.lua"
local config = dofile(config_path)
-- 设置 mkdp_markdown_css
vim.g.mkdp_markdown_css = config.md_css

-- md_pre.setup({
--     -- use a custom Markdown style. Must be an absolute path
--     -- like '/Users/username/markdown.css' or expand('~/markdown.css')
--     -- mkdp_markdown_css = home.."/.config/nvim/conf/github-markdown-css/github-markdown.css",
--     mkdp_markdown_css = config.md_css,
-- })
