require "nvchad.mappings"

local map = vim.keymap.set

-- This breaks f backward and forward use
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- This is just unnecessary
-- map("i", "jk", "<ESC>")

map("n", "<leader>sw", "<Cmd>ClangdSwitchSourceHeader<CR>")

-- Toggle LSP diagnostic warnings
map("n", "<leader>dr",
    function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled);
    end
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
