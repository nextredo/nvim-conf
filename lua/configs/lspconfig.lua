-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- See plugins/init.lua too
-- Look in the following link for details on setting up server configs teehee
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    "clangd",      -- Clang for C & C++
    "html",        -- Vscode extracted lang servers
    "cssls",       -- Vscode extracted lang servers
    "tailwindcss", -- Tailwind's intellisense (lots of web files)
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- Notes for html, css lang servers
-- [Install nodejs and npm](https://nodejs.org/en/download/package-manager/all)
-- Install the vscode extracted language servers package as it specifies in the `server_configurations.md`
-- Install the tailwindcss lang server as in the above doc

-- Notes for clangd
-- Use bear to build a compilation database <https://github.com/rizsotto/Bear>
    -- make distclean -j$(nproc) && bear -- make -j4

-- Follow this tutorial to fix clangd usage with a gcc codebase
-- <https://medium.com/unixification/how-to-setup-clangd-with-gcc-headers-and-neovim-lsp-for-competitive-programming-2f3f98425ae1>
    -- Try to find where the system includes clang can't find are
        -- echo '#include <cstdlib>' | g++ -xc - -H -v -fsyntax-only
        -- gcc -E -v -xc++ /dev/null
    -- Use the include directories from the last step in the next one
    -- Add a `.clangd` file (either in the project directory or in $HOME)
    -- CompileFlags:
        -- Add:
            -- - -I<an include directory from above>
            -- <repeat above line as many times as it takes>
-- add .clang-tidy too - can autogenerate this

-- Stolen from <https://github.com/fitrh/init.nvim/blob/7127fbef569ee498b1cbfae62ef372050b07afbc/lua/lsp/config/clangd.lua#L14>
-- and <https://github.com/williamboman/nvim-lsp-installer/discussions/392>

lspconfig.clangd.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = {
        "clangd",

        -- allowlist (whitelist) binaries for execution & querying by clangd
        -- driver to execute still chosen by compile_commands.json
        '--query-driver="/usr/bin/g*,/usr/bin/arm-none-eabi-*,/usr/bin/clang*"',
        -- '--query-driver="/usr/bin/g++,/usr/bin/gcc,/usr/bin/arm-none-eabi-gcc,/usr/bin/arm-non-eabi-g++,/usr/bin/clang,/usr/bin/clang++"',
        "--clang-tidy",
        "--background-index",
        "--all-scopes-completion",
        "--completion-style=bundled",
        "--header-insertion=never",
        "-j=8",

        -- Debug
        "--log=info",
        -- "--log=verbose",
    },
    single_file_support = true,
}



-- Old parts of the config:
    -- Oboslete flags:
    -- "--clang-tidy-checks=*",
    -- "--cross-file-rename",


    -- cmd = {
    --     "clangd",
    --     "--background-index",
    --     "-j=8",
    --     -- "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    --     '--query-driver="/usr/bin/g*,/usr/bin/arm-none-eabi*,/usr/bin/clang*"',
    --     "--clang-tidy",
    --     "--all-scopes-completion",
    --
    --     -- "--enable-config",
    --
    --     -- "--completion-style=detailed",
    --     "--completion-style=bundled",
    --
    --     -- "--header-insertion=iwyu",
    --     "--header-insertion=never",
    --     "--header-insertion-decorators",
    --     -- "--pch-storage=memory",
    -- }


-- For LSPs with specific configs
-- lspconfig.clangd.setup {
--     on_attach = on_attach,
--     on_init = on_init,
--     capabilities = capabilities,
--
--     -- See https://clangd.llvm.org/guides/system-headers#query-driver>
--     -- cmd = { 'clangd', '--query-driver=/usr/bin/g++' },
--     -- cmd = { 'clangd', '--query-driver=/usr/bin/clang' },
--     cmd = {
--         'clangd',
--         '--clang-tidy',
--         '--query-driver="/usr/bin/g*,/usr/bin/arm-none-eabi*,/usr/bin/clang*"'
--     },
--     ----enable-config
--     -- cmd = { 'clangd', '--query-driver="/usr/bin/gcc,/usr/bin/g++,/usr/bin/arm-none-eabi-gcc,/usr/bin/arm-none-eabi-g++"' },
--
--     -- cmd = {
--     --     "/usr/bin/clang"
--     -- },
--     -- cmd = {
--     --     "/usr/bin/clang" .. " --query-driver=/usr/bin/arm-none-eabi-gcc",
--     -- }
--     -- /usr/include/c++
--
-- }

-- local lspconfig = require('lspconfig')
-- lspconfig.rust_analyzer.setup {
--   -- Server-specific settings. See `:help lspconfig-setup`
--   -- :help lspconfig-all
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- lspconfig.clangd.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
