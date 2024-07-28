require "nvchad.mappings"

local map = vim.keymap.set

-- This breaks f backward and forward use
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- This is just unnecessary
-- map("i", "jk", "<ESC>")

map("n", "<leader>sw", "<Cmd>ClangdSwitchSourceHeader<CR>")

-- Toggle diagnostics
map("n", "<leader>dr",
    function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled());
    end,
    { desc = "toggle diagnostics" }
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
    end,
    { desc = "verbose print diagnostics" }
)



-- Fix CTRL-I mapping (linked to <Tab> mapping, see :h CTRL-I)
-- Since terminal interprets CTRL-I as tab, and sends the tab character
vim.keymap.del("n", "<Tab>")
vim.keymap.del("n", "<S-Tab>")

-- From NvChad mappings.lua
map("n", "<leader>k", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<leader>j", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
