-- 获取 Python 虚拟环境名称和版本的方法，带有 fallback 逻辑
local function get_lsp_venv()
    -- 尝试从 LSP 获取虚拟环境路径
    -- local clients = vim.lsp.get_active_clients()
    local clients = vim.lsp.get_clients()
    for _, client in ipairs(clients) do
        if client.name == "pyright" or client.name == "pylsp" then
            -- 获取 Python 环境的路径
            local python_path = client.config.settings and client.config.settings.python and
            client.config.settings.python.pythonPath
            if not python_path and client.name == "pyright" then
                python_path = client.config.settings and client.config.settings.pythonPath
            end
            if python_path then
                local venv_name = python_path:match("([^/\\]+)$")

                -- 如果虚拟环境名是 "venv"，则回退到路径的倒数第二部分作为虚拟环境名
                if venv_name == "venv" then
                    venv_name = python_path:match("([^/\\]+)[/\\][^/\\]+$")
                end

                -- 获取 Python 版本号（如果可以）
                local python_version = "unknown"
                if client.config.settings and client.config.settings.python and client.config.settings.python.pythonVersion then
                    python_version = client.config.settings.python.pythonVersion
                end

                return string.format("🐍 %s(%s)", venv_name or "unknown", python_version)
            end
        end
    end

    -- 如果 LSP 获取不到，尝试使用环境变量作为 fallback
    local env = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
    if env then
        -- 获取 Python 版本号
        local python_version = "unknown"
        local handle = io.popen("python --version 2>&1")
        if handle then
            local output = handle:read("*a")
            python_version = output:match("Python (%d+%.%d+%.%d+)")
            handle:close()
        end

        -- 如果虚拟环境名是 "venv"，则回退到路径的倒数第二部分作为虚拟环境名
        local venv_name = env:match("[^/\\]+$")
        if venv_name == "venv" then
            venv_name = env:match("([^/\\]+)[/\\][^/\\]+$")
        end

        return string.format("🐍 %s(%s)", venv_name, python_version)
    end

    -- 如果都没有，返回空字符串
    return ""
end

return { get_lsp_venv = get_lsp_venv }
