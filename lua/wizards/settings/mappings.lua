-- TODO mappings
-- git
-- trouble
-- telescope
-- general usability from ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua

-- TODO split vim config into an options file, mappings file and main file
-- then require them individually in this nvim config

local map = vim.keymap.set

---------------------------------- Telescope -----------------------------------
local telescope = require("telescope")
telescope.setup({
  -- TODO change? defaulted for now
})
