local map = vim.keymap.set

-- TODO mappings
-- git
-- trouble
-- telescope
-- general usability from ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua

-- TODO split vim config into an options file, mappings file and main file
-- then require them individually in this nvim config

-- TODO telescope planets mapping

-- Telescope -------------------------------------------------------------------

-- TODO steal default maps from LazyVim
-- See ./lua/lazyvim/plugins/extras/editor/telescope.lua in LazyVim
local t_builtin = require("telescope.builtin")
map("n", "<leader>ff", t_builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", t_builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", t_builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", t_builtin.help_tags, { desc = "Telescope help tags" })


-- Tabluarize ------------------------------------------------------------------
map("n", "<leader>al,", [[<Cmd>Tab /,\zs/l0l1<CR>]], { desc = "Align commas" })
map("n", "<leader>al=", [[<Cmd>Tab /=<CR>]], { desc = "Align equals" })
