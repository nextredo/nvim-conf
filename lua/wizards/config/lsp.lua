--[[
Information:
- :help lspconfig-all
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
--]]

-- TODO enable file watching
-- "(workspace/didChangeWatchedFiles)" disabled on all clients

-- TODO notify once LSP loaded

-- LSPs to enable --------------------------------------------------------------
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
    "protols", -- Protocol buffers
    "cmake",
}

-- LSPs with default config
for _, lsp in ipairs(lsps) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, {})
end

-- TODO move into lsp/ directory
  -- then require all files in that dir from here?
--------------------------------------------------------------------------------
-- Custom LSP server setups ----------------------------------------------------
-- Clangd ----------------------------------------------------------------------
vim.lsp.config("clangd", {
    single_file_support = true,
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
})


-- Lua language server ---------------------------------------------------------
-- Directly stolen from
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
  settings = {
    -- Lua = {}
  }
})

-- vim.lsp.config("lua_ls", {
--   runtime = {
--     -- Tell the language server which version of Lua you're using (most
--     -- likely LuaJIT in the case of Neovim)
--     version = 'LuaJIT',
--     -- Tell the language server how to find Lua modules same way as Neovim
--     -- (see `:h lua-module-load`)
--     path = {
--       'lua/?.lua',
--       'lua/?/init.lua',
--     },
--   },
--   Lua = {
--     codeLens = {
--       enable = true
--     },
--     hint = {
--       enable = true,
--       semicolon = "Disable"
--     },
--     -- diagnostics = {
--     --     globals = { 'vim' }
--     -- },
--   },
-- })
