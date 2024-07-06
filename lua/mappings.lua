require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- This breaks f backward and forward use
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- This is just unnecessary
-- map("i", "jk", "<ESC>")

map("n", "<leader>sw", "<Cmd>ClangdSwitchSourceHeader<CR>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
