print("wiz config")

-- Mapleader must be set before lazy setup
-- (lazy.nvim may need it to be setup for mappings)
require("wizards.settings.initial_setup")

require("wizards.config.lazy")
require("wizards.config.lsp")

-- Generic settings
require("wizards.settings.options")
require("wizards.settings.mappings")
