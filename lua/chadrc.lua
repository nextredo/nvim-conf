-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

-- local highlights = require("custom.highlights")

M.ui = {
    theme = "monekai",
    transparency = true,
    theme_toggle = { "monekai", "onedark" },

    statusline = {
        theme = "minimal",
        separator_style = "block",
        -- modules = {
        --     function()
        --         -- https://github.com/NvChad/starter/compare/main...limiu82214:NvChadStarter:main
        --         vim.cmd("highlight St_relativepath guifg=#626a83 guibg=#2a2b36")
        --     end
        -- }
    },

    lsp = {
        semantic_tokens = true,
        signature = true,
    },

    nvdash = {
        load_on_startup = true,
        header = {
            -- https://www.asciiart.eu/mythology/skeletons
            [[                           ,--.             ]],
            [[                          {    }            ]],
            [[                          K,   }            ]],
            [[                         /  `Y`             ]],
            [[                    _   /   /               ]],
            [[                   {_'-K.__/                ]],
            [[                     `/-.__L._              ]],
            [[                     /  ' /`\_}             ]],
            [[                    /  ' /     -ART BY ZEUS-]],
            [[            ____   /  ' /                   ]],
            [[     ,-'~~~~    ~~/  ' /_                   ]],
            [[   ,'             ``~~~%%',                 ]],
            [[  (                     %  Y                ]],
            [[ {                      %% I                ]],
            [[{      -                 %  `.              ]],
            [[|       ',                %  )              ]],
            [[|        |   ,..__      __. Y               ]],
            [[|    .,_./  Y ' / ^Y   J   )|               ]],
            [[\           |' /   |   |   ||               ]],
            [[ \          L_/    . _ (_,.'(               ]],
            [[  \,   ,      ^^""' / |      )              ]],
            [[    \_  \          /,L]     /               ]],
            [[      '-_`-,       ` `   ./`                ]],
            [[         `-(_            )                  ]],
            [[             ^^\..___,.--`                  ]],
        },
    },

    -- note need fonts that support bold AND italic + both at once
    -- Somewhat of an attempt at recreating the Monokai theme in vscode
    hl_override = {
        ["@keyword.repeat"] = {
            link = "@keyword",
        },
        -- ["@keyword.storage"] = {
        --     link = "@keyword",
        -- },
        -- ["@keyword.directive"] = {
        --     link = "@",
        -- },
        ["@attribute"] = {
            link = "@attribute.builtin",
        },
        ["@attribute.builtin"] = {
            underdotted = true,
        },
        ["@comment"] = {
            -- italic = true,
            -- bold = true,
            fg = { "grey_fg2", 14 },
        },
        ["@type.builtin"] = {
            underdotted = true,
        },
        Comment = {
            fg = { "grey_fg2", 20 },
            -- link = "@comment",
        },
        LineNr = {
            fg = { "grey_fg", 6 },
        },
    },
    lsp_semantic_tokens = true,

    -- hl_override = highlights.override,
    -- hl_add = highlights.add,
    -- hl_override = {
    --     Comment = {
    --         italic = true,
    --         bold = true,
    --     },
    -- },

    -- hl_override = {
    --     -- Comment = { italic = true },
    --     ["@comment"] = { italic = true },
    -- },

    -- hl_override = {
        -- Comment

        -- Normal = {
            -- fg = { "one_bg2", 20 },
            -- bg = { "white", 0 }
        -- },
        -- Pmenu = { bg = "white" },

        -- Comment = {
        --     -- if you want to lighten or darken color
        --     -- this will use the black color from nvchad theme & lighten it by 2x
        --     -- use a negative number to darken it
        --     -- bg = { "black", 2 },
        --     -- bg = { "white", 2 },
        --     -- bg = {  },
        --     -- fg = { "grey_fg2", 0 },
        --     -- fg = { "grey_fg2", 15 },
        --     -- fg = { "grey_fg", 20 },
        --     italic = true,
        -- },
        -- ["@comment"] = {
        --     fg = { "grey_fg", 15 },
        --     italic = true,
        --     -- bold = true,
        --     -- note need fonts that support bold AND italic + both at once
        -- },
    -- },
    -- todo update all groups in hl_override correctly
    -- just update grey_fg instead lmao

    -- hl_add = {
    --     Comment = {},
    --     ["@comment"] = {},
    -- }

    tabufline = {
        -- enabled = false,
        numbers = true,
        show_numbers = true,
        lazyload = false,
    },
}

return M
