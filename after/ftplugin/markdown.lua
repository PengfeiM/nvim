-- markdown filetype keymaps — applied to every markdown buffer
local opts = { noremap = true, silent = true, buffer = true }

vim.keymap.set('n', '<leader>ms', '<cmd>LivePreview start<CR>', opts)
vim.keymap.set('n', '<leader>mc', '<cmd>LivePreview close<CR>', opts)
vim.keymap.set('n', '<leader>mp', '<cmd>LivePreview pick<CR>', opts)
vim.keymap.set('n', '<leader>mr', ':RenderMarkdown toggle<CR>', opts)
