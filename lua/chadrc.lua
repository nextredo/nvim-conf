-- See https://nvchad.com/docs/config/nvchad_ui

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "monekai",
    transparency = true,
    theme_toggle = { "monekai", "onedark" },

    statusline = {
        theme = "minimal",
        separator_style = "block",
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
    },
    lsp_semantic_tokens = true,

    tabufline = {
        -- enabled = false,
        numbers = true,
        show_numbers = true,
        lazyload = false,
    },
}

return M
