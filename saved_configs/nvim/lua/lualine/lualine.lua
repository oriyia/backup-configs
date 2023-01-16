local palette_colors = require('colors.colors')

local lualine_colors = {
    add = palette_colors.general.grey3,
    change = palette_colors.general.grey3,
    delete = palette_colors.general.grey3,
    error = palette_colors.general.red,
    warn = palette_colors.general.orange,
    info = palette_colors.general.blue,

    fg_level1 = palette_colors.general.fg,
    bg_level1 = palette_colors.general.grey,
    fg_level2 = palette_colors.general.grey3,
    bg_level2 = palette_colors.general.light_grey,
    fg_level3 = palette_colors.general.fg,
    bg_level3 = palette_colors.general.light_grey,
}

require('lualine').setup{
    options = {
        icons_enabled = true,
        -- theme = 'lualine_mytheme_onedark',
        component_separators = { left = '', right = ''},
        section_separators = {left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {
            {
                'mode',
                right_padding = 2,
                fmt = function(str) return str:sub(1,1) end, -- N,V,I mode
                separator = {right = ''},
                color = {
                    fg = lualine_colors.fg_level1,
                    bg = lualine_colors.bg_level1,
                    gui='italic,bold'
                },
                -- color = function(section)
                --     return {
                --         bg = lualine_colors.bg_level1,
                --         fg = vim.bo.modified and lualine_colors.fg_level1 or lualine_colors.level1,
                --         gui='bold'
                --     }
                -- end,
            },
        },
        lualine_b = {
            {
                'branch',
                separator = {right = ''},
                color = {
                    fg = lualine_colors.fg_level2,
                    bg = lualine_colors.bg_level2,
                    gui='italic,bold'
                },
            },
            {
                'diff',
                separator = {right = ''},
                diff_color = {
                    added = {fg = lualine_colors.add},
                    modified = {fg = lualine_colors.change},
                    removed = {fg = lualine_colors.delete},
                },
                color = {
                    fg = lualine_colors.fg_level2,
                    bg = lualine_colors.bg_level2,
                    gui='italic,bold'
                },
            },

            {
                'diagnostics',
                colored = false,
                separator = {right = ''},
                color = {
                    fg = lualine_colors.fg_level2,
                    bg = lualine_colors.bg_level2,
                    gui='italic,bold'
                },
                symbols = {error = ' ', warn = ' ', info = ' '},
                diagnostics_color = {
                    color_error = {fg = lualine_colors.error},
                    color_warn = {fg = lualine_colors.warn},
                    color_info = {fg = lualine_colors.info},
                },
            },
        },
        lualine_c = {
            {
                'filesize',
                color = {
                    fg = lualine_colors.fg_level3,
                    bg = lualine_colors.bg_level3,
                    gui='italic,bold'
                },
            },
            {
                'filetype',
                colored = false,
                icon_only = true,
                color = {
                    fg = lualine_colors.fg_level3,
                    bg = lualine_colors.bg_level3,
                    gui='italic,bold'
                },
            },
            {
                'filename',
                symbols = {
                    modified = ' 🆆 ',
                    readonly = '  ',
                    unnamed = '[No Name]',
                },
                color = {
                    fg = lualine_colors.fg_level3,
                    bg = lualine_colors.bg_level3,
                    gui='italic,bold'
                },
            },
        },

        lualine_x = {
            {
                'encoding',
                separator = {left = ''},
                color = {
                    fg = lualine_colors.fg_level2,
                    bg = lualine_colors.bg_level2,
                    gui='italic,bold'
                },
            },
            {
                'fileformat',
                separator = {left = ''},
                color = {
                    fg = lualine_colors.fg_level2,
                    bg = lualine_colors.bg_level2,
                    gui='italic,bold'
                },
            },

        },
        lualine_y = {},
        lualine_z = {
            {
                '%l:%v:%L',
                separator = {left = ''},
                color = {
                    fg = lualine_colors.fg_level1,
                    bg = lualine_colors.bg_level1,
                    gui='italic,bold'
                },
                left_padding = 2
            },
        }
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
