local opt = { noremap = true, silent = true }

-- 绑定快捷键
local MarkdownKeybinding = {}

MarkdownKeybinding.markdown_preview_keymaps = function(bufnr)
  -- 在 markdown 文件中启用快捷键
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>mp', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ms', ':MarkdownPreviewStop<CR>', { noremap = true, silent = true })
end

return MarkdownKeybinding
