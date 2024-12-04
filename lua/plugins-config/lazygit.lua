local status, lazygit = pcall(require, "lazygit")
if not status then
    vim.notify("没有找到 lazygit 的 nvim 插件")
end


-- lazygit.config = require("keybinding").lazyGitKeybinding()
-- 快捷键
lazygit.keys = require("keybinding").lazyGitKeybinding()

lazygit.cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyG",
}
