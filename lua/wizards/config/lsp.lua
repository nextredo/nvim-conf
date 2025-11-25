--[[
Information:
- :help lspconfig-all
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
--]]

-- TODO enable file watching
-- "(workspace/didChangeWatchedFiles)" disabled on all clients

-- TODO notify once LSP loaded

-- LSPs to enable
local lsps = {
    "lua_ls",      -- For Lua
    "clangd",      -- Clangd for C & C++
    "html",        -- Vscode extracted lang servers
    "cssls",       -- Vscode extracted lang servers
    -- "tailwindcss", -- Tailwind's intellisense (lots of web files)
                      -- Currently does nothing, eats heaps of RAM, dies from OOM ((sensational))
    "docker_compose_language_service",
    "nginx_language_server",
    "dockerls",
    "digestif",
    "pyright",
    -- TODO use based pyright instead
    -- "basedpyright",
    "bashls",
    "nixd",
    "gdscript",
    "gdshader_lsp",
    "gopls",
    "glsl_analyzer",
    "rust_analyzer",
    "protols",
    "cmake",
}

-- LSPs with default config
for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, {})
end

-- Custom LSP server setups ----------------------------------------------------
vim.lsp.config("clangd", {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = {
        "clangd",

        -- Allowlist (whitelist) binaries for execution & querying by clangd (see clangd --help)
        -- Driver to execute is still chosen by compile_commands.json
        '--query-driver="/usr/bin/g*,/usr/bin/arm-none-eabi-*,/usr/bin/clang*"',
        "--clang-tidy",
        "--background-index",
        "--all-scopes-completion",
        "--completion-style=bundled",
        "--header-insertion=never",
        "--limit-references=0",
        "-j=8",

        -- Debug
        -- "--log=info",
        -- "--log=verbose",
    },
    single_file_support = true,
})
