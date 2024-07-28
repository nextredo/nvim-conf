-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Settings
-- WARN: Border override for folke/lazy is elsewhere (configs/lazy.lua)
local _border = "rounded"

-- Don't think this actually does anything
vim.diagnostic.config({
  float = {
    border = _border,
  },
})

-- Override :LspInfo border
require('lspconfig.ui.windows').default_options = {
  border = _border
}

-- Override all LSP settings (regardless of client)
-- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or { }
  opts.border = opts.border or _border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--------------------------------------------------------------------------------
-- Default LSP server setups ---------------------------------------------------

-- See plugins/init.lua too
-- Look in the following link for details on setting up server configs teehee
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    "clangd",      -- Clangd for C & C++
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
-- Install the vscode extracted language servers package as specified in `server_configurations.md`
-- Install the tailwindcss lang server as in the above doc

-- Follow this tutorial to fix clangd usage with a gcc codebase
-- https://medium.com/unixification/how-to-setup-clangd-with-gcc-headers-and-neovim-lsp-for-competitive-programming-2f3f98425ae1
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

--------------------------------------------------------------------------------
-- Custom LSP server setups ----------------------------------------------------

-- Notes for clangd
-- Use bear to build a compilation database
    -- https://github.com/rizsotto/Bear
    -- make distclean -j$(nproc) && bear -- make -j$(nproc)
lspconfig.clangd.setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    cmd = {
        "clangd",

        -- allowlist (whitelist) binaries for execution & querying by clangd (see clangd --help)
        -- driver to execute still chosen by compile_commands.json
        '--query-driver="/usr/bin/g*,/usr/bin/arm-none-eabi-*,/usr/bin/clang*"',
        "--clang-tidy",
        "--background-index",
        "--all-scopes-completion",
        "--completion-style=bundled",
        "--header-insertion=never",
        "--limit-references=0",
        "-j=8",

        -- Debug
        "--log=info",
    },
    single_file_support = true,
}
