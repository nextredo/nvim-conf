--[[
Remaps inspired by the following sources:
- Lazyvim
- NvChad
--]]

local map = vim.keymap.set

-- TODO make descriptions match the abbreviated word ordering of the remaps
-- TODO mappings
-- git
-- trouble
-- telescope
-- general usability from ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua

-- TODO split vim config into an options file, mappings file and main file
-- then require them individually in this nvim config

-- TODO telescope planets mapping
-- TODO fix lua lsp not fuckin doing anything
-- TODO autocomplete again pls
-- TODO spellcheck pls
-- TODO deselect current search on esc

-- Telescope -------------------------------------------------------------------
local t_builtin = require("telescope.builtin")

-- File finders
map("n", "<leader>ff", t_builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>gf", t_builtin.git_files, { desc = "Telescope git files (excl. gitignore'd files)" })
map("n", "<leader>fo", t_builtin.oldfiles, { desc = "Telescope oldfiles" })
map("n", "<leader>fg", t_builtin.live_grep, { desc = "Telescope live grep" })

-- Other finders
-- map("n", "<leader>fb", t_builtin.buffers, { desc = "Telescope buffers" })

-- Historical
map("n", "<leader>s/", t_builtin.search_history, { desc = "Telescope search history" })

-- LSP-esque
map("n", "<leader>sd", t_builtin.diagnostics, { desc = "Telescope LSP diagnostics" })
map("n", "<leader>sq", t_builtin.quickfix, { desc = "Telescope quickfix" })
map("n", "<leader>gr", t_builtin.lsp_references, { desc = "Telescope LSP references" })
map("n", "<leader>gi", t_builtin.lsp_incoming_calls, { desc = "Telescope LSP incoming calls" })
map("n", "<leader>go", t_builtin.lsp_outgoing_calls, { desc = "Telescope LSP outgoing calls" })
map("n", "<leader>gs", t_builtin.lsp_workspace_symbols, { desc = "Telescope LSP WS Syms" })
map("n", "<leader>gS", t_builtin.lsp_dynamic_workspace_symbols, { desc = "Telescope Dyn LSP WS Syms" })
-- map("n", "<leader>", t_builtin.spell_suggest, { desc = "Telescope spell suggest" })

-- Gitcore
map("n", "<leader>gt", t_builtin.git_status, { desc = "Telescope Git status" })

-- Other
-- Telescope planet mappings (see :help telescope.builtin.planets)
-- map("n", "<leader>pl", t_builtin.planets, { desc = "Telescope usage" })
map("n", "<leader>pl", function()
  require("telescope.builtin").planets({
    show_moon = true, show_pluto = true
  })
end, { desc = "Telescope usage" })

map("n", "<leader>fh", t_builtin.help_tags, { desc = "Telescope help tags" })
map("n", "<leader>cs", t_builtin.colorscheme, { desc = "Telescope colorscheme" })
map("n", "<leader>hl", t_builtin.highlights, { desc = "Telescope highlights" })


-- Tabluarize ------------------------------------------------------------------
map("n", "<leader>al,", [[<Cmd>Tab /,\zs/l0l1<CR>]], { desc = "Align commas" })
map("n", "<leader>al=", [[<Cmd>Tab /=<CR>]], { desc = "Align equals" })


-- Treesitter ------------------------------------------------------------------
map("n", "<leader>tsi", "<Cmd>TSInstallInfo<CR>", { desc = "Treesitter Installed Parsers" })


-- LSP -------------------------------------------------------------------------
map("n", "<leader>chl", "<Cmd>checkhealth vim.lsp<CR>", { desc = "Check Health LSP" })

-- So I don't forget it exists
map("n", "gro", function() end, { desc = "LSP Doc Symbol (use `gO` instead)" })


-- Misc ------------------------------------------------------------------------
map("n", "<leader>/", "gcc", { desc = "Toggle line comment", remap = true, silent = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true, silent = true })
