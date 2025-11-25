-- TODO mappings
-- git
-- trouble
-- telescope
-- general usability from ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua

-- TODO split vim config into an options file, mappings file and main file
-- then require them individually in this nvim config

-- TODO telescope planets mapping

local map = vim.keymap.set

---------------------------------- Telescope -----------------------------------

-- TODO steal default maps from LazyVim
-- See ./lua/lazyvim/plugins/extras/editor/telescope.lua in LazyVim
local tele_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", tele_builtin.find_files)
vim.keymap.set("n", "<leader>fg", tele_builtin.live_grep)
vim.keymap.set("n", "<leader>fb", tele_builtin.buffers)
vim.keymap.set("n", "<leader>fh", tele_builtin.help_tags)
