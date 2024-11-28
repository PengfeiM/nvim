-- mason.lua
local mason_status, mason = pcall(require, "mason")
if not mason_status then
 vim.notify("没有找到 mason")
 return
--else
  --  vim.notify("mason 加载成功")
    --return
end

local nlsp_status, nvim_lsp = pcall(require, "lspconfig")
if not nlsp_status then
 vim.notify("没有找到 lspconfig")
 return
end

local mlsp_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mlsp_status then
 vim.notify("没有找到 mason-lspconfig")
 return
end


mason.setup({})
mason_lspconfig.setup({})


-- 定义快捷键函数
function LspKeybind(client, bufnr)
 local function buf_set_keymap(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
 end
 -- 绑定快捷键
 require("keybinding").lspKeybinding(buf_set_keymap)
end



-- 配置 lua_ls，保证 lua 的语法支持
nvim_lsp.lua_ls.setup({
 on_attach = LspKeybind,
 on_init = function(client)
  local path = client.workspace_folders[1].name
  if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
   client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
    Lua = {
     runtime = {
      version = "LuaJIT",
     },
     workspace = {
         checkThirdParty = false,
      library = {
       vim.env.VIMRUNTIME,
      },
     },
    },
   })

   client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end
  return true
 end,
})


-- 配置 pylsp
nvim_lsp.pylsp.setup({
    on_attach = LspKeybind,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391', 'E501'},
          maxLineLength = 120
        }
      }
    }
  }
})



-- 配置 gopls，使用已有的 gopls，路径在于：~/go/bin/gopls
nvim_lsp.gopls.setup({
    on_attach = LspKeybind,
    cmd = {"gopls"},
    settings = {
        gopls = {
            analyses = {
                unreachable = true,
                unusedparams = true,
                errcheck = true,
                misspell = true,
            },
            staticcheck = true,
        },
    },
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})
