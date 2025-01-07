require "nvchad.mappings"

local map = vim.keymap.set

-- Unmappings ------------------------------------------------------------------

-- This breaks f backward and forward use
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- This is just unnecessary
-- map("i", "jk", "<ESC>")

-- I do this too much accidentally when using nvim inbuilt terminal
-- Combat default nvchad mapping
vim.keymap.del("n", "<C-c>")

-- Fix CTRL-I mapping (linked to <Tab> mapping, see :h CTRL-I)
-- Since terminal interprets CTRL-I as tab, and sends the tab character
vim.keymap.del("n", "<Tab>")
vim.keymap.del("n", "<S-Tab>")

-- Not needed
vim.keymap.del("n", "<leader>b")

-- Mappings --------------------------------------------------------------------
-- Git time
-- map("n", "<leader>gs", "<Cmd>Telescope git_stash<CR>")
map("n", "<leader>gb", "<Cmd>Gitsigns blame_line<CR>")
map("n", "<leader>ph", "<Cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>pi", "<Cmd>Gitsigns preview_hunk_inline<CR>")
map("n", "<leader>rh", "<Cmd>Gitsigns reset_hunk<CR>")
map("n", "<leader>fh", "<Cmd>Gitsigns next_hunk<CR>")
map("n", "<leader>bh", "<Cmd>Gitsigns prev_hunk<CR>")

-- LSP client time
map("n", "<leader>sw", "<Cmd>ClangdSwitchSourceHeader<CR>")
map("n", "<leader>dc", "<Cmd>LspInfo<CR>")

-- Tabluarize time
map("n", "<leader>al", [[<Cmd>Tab /,\zs /l0<CR>]])

-- Toggle diagnostics
map("n", "<leader>dr",
    function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()); end,
    { desc = "toggle diagnostics" }
)

map("n", "<leader>dk",
    function() vim.diagnostic.open_float(); end,
    { desc = "open floating diagnostics" }
)

-- Navigate diagnostics
map("n", "<leader>df",
    function() vim.diagnostic.goto_next(); end,
    { desc = "next diagnostic" }
)
map("n", "<leader>db",
    function() vim.diagnostic.goto_prev(); end,
    { desc = "prev diagnostic" }
)

-- Print diagnostics (verbose) (so I can see check codes)
map("n", "<leader>dv",
    function()
        local diags_table_str     = vim.inspect(vim.diagnostic.get(0))
        local diags_table_str_set = vim.split(diags_table_str, "\n")

        vim.cmd("new")
        local win_handle = vim.api.nvim_tabpage_get_win(0) -- get the window handler
        local buf_handle = vim.api.nvim_win_get_buf(0)     -- get the buffer handler

        vim.api.nvim_buf_set_lines(buf_handle, 0, -1, false, diags_table_str_set)

        vim.cmd("setlocal ro")
        vim.cmd(":set filetype=json")
    end,
    { desc = "verbose print diagnostics" }
)

map("n", "<leader>bc", "<Cmd>Bclose<CR>")

-- From NvChad mappings.lua
map("n", "<leader>k", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<leader>j", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
