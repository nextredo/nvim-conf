-- See https://nvchad.com/docs/config/nvchad_ui
-- TODO update to something sane
-- "nothing is more permanent than a temporary solution"
local function script_path()
   return debug.getinfo(1, "S").source:match("@?(.*/)")
end

local orig_path = package.path
package.path = script_path() .. "?.lua;" .. package.path
local ascii_picker = require("custom.ascii_art")
package.path = orig_path

---@type ChadrcConfig
local M = {}

M = {
    base46 = {
        theme = "monekai",
        transparency = true,
        theme_toggle = { "monekai", "onedark" },

        -- NOTE
        -- Need fonts that support bold AND italic + both at once
        -- Somewhat of an attempt at recreating the Monokai theme in vscode
        hl_override = {
            ["@keyword.repeat"] = {
                link = "@keyword",
            },
            ["@attribute"] = {
                link = "@attribute.builtin",
            },
            ["@attribute.builtin"] = {
                underdotted = true,
            },
            ["@comment"] = {
                fg = { "grey_fg2", 14 },
            },
            ["@type.builtin"] = {
                underdotted = true,
            },
            Comment = {
                fg = { "grey_fg2", 20 },
            },
            LineNr = {
                fg = { "grey_fg", 12 },
            },
            NvDashButtons = {
                fg = { "grey_fg", 52 },
            },
        },
    },

    ui = {
        statusline = {
            theme = "minimal",
            separator_style = "block",
        },
    },

    lsp = {
        semantic_tokens = true,
        signature = true,

        tabufline = {
            -- enabled = false,
            numbers = true,
            show_numbers = true,
            lazyload = false,
        },
    },

    nvdash = {
        load_on_startup = true,
        header = ascii_picker.get_art(),
    },
}

return M
