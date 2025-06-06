-- 键位绑定配置

-- ================================================================
-- 本地变量
-- ----------------------------------------------------------------
local opt = { noremap = true, silent = true }
-- ================================================================

-- ================================================================
-- Leader 键
-- ----------------------------------------------------------------
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- ================================================================


-- ================================================================
-- 退出快捷键
-- ----------------------------------------------------------------
vim.keymap.set("n", "<Leader>q", ":q<CR>", opt)
vim.keymap.set("n", "<Leader>qa", ":wqa<CR>", opt)
-- ================================================================


-- ================================================================
-- 导航快捷键
-- ----------------------------------------------------------------

-- 窗口导航
vim.keymap.set("n", "<C-J>", "<C-W>j")
vim.keymap.set("n", "<C-K>", "<C-W>k")
vim.keymap.set("n", "<C-H>", "<C-W>h")
vim.keymap.set("n", "<C-L>", "<C-W>l")

-- ================================================================


-- ================================================================
-- 文本操作快捷键
-- ----------------------------------------------------------------

-- 复制文本到系统剪切板
-- 复制到系统剪贴板
vim.api.nvim_set_keymap('n', '<Leader>y', '"+y', opt) -- 普通模式
vim.api.nvim_set_keymap('v', '<Leader>y', '"+y', opt) -- 视觉模式
vim.api.nvim_set_keymap('n', '<Leader>Y', '"+Y', opt) -- 整行复制

-- 从系统剪贴板粘贴
vim.api.nvim_set_keymap('n', '<Leader>p', '"+p', opt) -- 普通模式
vim.api.nvim_set_keymap('v', '<Leader>p', '"+p', opt) -- 视觉模式
-- ================================================================


-- ================================================================
-- 插件快捷键
-- ----------------------------------------------------------------
local pluginKeyBinding = {}

-- nvim-tree 快捷键
vim.keymap.set({"n", "v"}, "<Leader>nt", ":NvimTreeToggle<CR>")
vim.keymap.set({"n", "v"}, "<Leader>nf", ":NvimTreeFindFile<CR>")
pluginKeyBinding.nvim_tree = {
	--{ key = "r", action = "refresh" },
}


-- bufferline 快捷键
-- keybindings.lua
-- buffer 切换、关闭
vim.keymap.set("n", "<Leader>bp", ":BufferLineCyclePrev<CR>", opt)
vim.keymap.set("n", "<Leader>bn", ":BufferLineCycleNext<CR>", opt)
vim.keymap.set("n", "<Leader>bo", ":BufferLineCloseOthers<CR>", opt)
vim.keymap.set("n", "<Leader>bd", ":Bdelete<CR>", opt)
-- buffer 相对编号跳转
vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', opt)
vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', opt)
vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', opt)
vim.keymap.set('n', '<leader>4', '<cmd>BufferLineGoToBuffer 4<CR>', opt)
vim.keymap.set('n', '<leader>5', '<cmd>BufferLineGoToBuffer 5<CR>', opt)
vim.keymap.set('n', '<leader>6', '<cmd>BufferLineGoToBuffer 6<CR>', opt)
vim.keymap.set('n', '<leader>7', '<cmd>BufferLineGoToBuffer 7<CR>', opt)
vim.keymap.set('n', '<leader>8', '<cmd>BufferLineGoToBuffer 8<CR>', opt)
vim.keymap.set('n', '<leader>9', '<cmd>BufferLineGoToBuffer 9<CR>', opt)
-- 跳转到目前相对位置的最后一个 buffer
vim.keymap.set('n', '<leader>0', '<cmd>BufferLineGoToBuffer -1<CR>', opt)
-- 跳转到绝对的第一个 buffer
vim.keymap.set('n', '<leader>&', '<cmd>lua require("bufferline").go_to(1, true)<CR>', opt)
-- 跳转到绝对的最后一个 buffer
vim.keymap.set('n', '<leader>$', '<cmd>lua require("bufferline").go_to(-1, true)<CR>', opt)
-- 跳转到上一个 buffer
--vim.keymap.set('n', '<leader>-', '<cmd>BufferLineGoToBuffer #<CR>', opt)
vim.keymap.set('n', '<leader>-', ':b #<CR>', opt)


-- tagbar 快捷键
-- vim.keymap.set("n", "<Leader>tl", ":TagbarToggle<CR>", opt)
-- aerial 快捷键，代替 tagbar
vim.keymap.set("n", "<leader>tl", "<cmd>AerialToggle!<CR>")


-- fzf-lua 快捷键
require("fzf-lua")
vim.keymap.set("n", "<Leader>f", ":FzfLua files<CR>", opt)
vim.keymap.set("n", "<Leader>bb", ":FzfLua buffers<CR>", opt)
vim.keymap.set("n", "<Leader>a", ":FzfLua grep_cword<CR>", opt)
vim.keymap.set("v", "<Leader>a", ":FzfLua grep_visual<CR>", opt)
vim.keymap.set("n", "<Leader>A", ":FzfLua grep_project<CR>", opt)
vim.keymap.set("n", "<Leader>h", ":FzfLua oldfiles<CR>", opt)
-- vim.keymap.set("n", "<Leader>td", "<cmd>lua fzf_search_todo()<CR>", opt)
vim.keymap.set("n", "<Leader>td", ":TodoFzfLua<CR>", opt)

-- ----------------------------------------------------------
-- Gitsigns 快捷键
pluginKeyBinding.gitSignsKeys = function(bufnr, gitsigns)

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- 添加自己的快捷键
    map('n', '<leader>gb', gitsigns.blame)
    -- vim.keymap.set('n', '<leader>gb', gitsigns.blame, opt)
    --
    map('n', '<leader>gh', gitsigns.preview_hunk)

    --[[
    TODO: some action key binding, not use now
    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    --]]
end
-- ---------------------------------
-- lazygit 快捷键
pluginKeyBinding.lazyGitKeybinding = function ()
    return {
        vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", opt)
    }
end
-- pluginKeyBinding.lazyGitKeybinding = function ()
--     -- 可以添加按键绑定
--     vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", opt)
-- end

-- ================================================================




-- ================================================================
-- lsp 快捷键设置
-- lsp 快捷键设置
pluginKeyBinding.lspKeybinding = function(mapbuf)
 -- rename
 -- mapbuf("n", "<leader>r", ":lua vim.lsp.buf.rename<CR>", opt)
 mapbuf("n", "<leader>r", ":Lspsaga rename<CR>", opt)
 -- code action
 mapbuf("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
 -- go to definition
 mapbuf("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
 -- 测试 goto 引用，放在 quickfix 中
 -- vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
 mapbuf('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opt)
 -- 找到接口实现，放在 quickfix 中
 mapbuf('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
 -- open finder for definition and reference
 mapbuf("n", "gf", ":Lspsaga finder<CR>", opt)
 -- show hover
 -- mapbuf("n", "gh", ":lua vim.lsp.buf.hover()<CR>", opt) -- same result as K, remove for now
    -- show diagnostic in line
    mapbuf("n", "<leader>dl", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    -- show diagnostic in file
    mapbuf("n", "<leader>db", "<cmd>Lspsaga show_buf_diagnostics<CR>", opt)
    -- show diagnostic in workspace
    mapbuf("n", "<leader>dw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", opt)
 -- format
 mapbuf("n", "<leader>=", ":lua vim.lsp.buf.format { async = true }<CR>", opt)
end

-- Global, 不需要语言触发
-- Lspsaga
vim.keymap.set("n", "<Leader>tg", ":Lspsaga term_toggle<CR>", opt)


-- ================================================================
pluginKeyBinding.cmp = function(cmp)
 return {
  -- 出现补全
  ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  -- 取消
  ["<A-,>"] = cmp.mapping({
   i = cmp.mapping.abort(),
   c = cmp.mapping.close(),
  }),
  -- 上一个
  ["<C-k>"] = cmp.mapping.select_prev_item(),
  -- 下一个
  ["<C-j>"] = cmp.mapping.select_next_item(),
  -- 确认
  ["<CR>"] = cmp.mapping.confirm({
   select = true,
   behavior = cmp.ConfirmBehavior.Replace,
  }),
 }
end


-- ================================================================
-- 返回 插件快捷键
return pluginKeyBinding
