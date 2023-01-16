local palette_colors = require('colors.colors')

local buf_colors = {
    bg = palette_colors.general.light_grey,
    fg = palette_colors.general.grey2,
    bg_sel = palette_colors.general.grey,
    fg_sel = palette_colors.general.fg,
    bg_vis = palette_colors.general.grey,
    fg_vis = palette_colors.general.grey3,
    bg_edit = palette_colors.general.light_grey3, -- маленькие разделители вкладок

    mod_sel = palette_colors.general.blue,
    mod_vis = palette_colors.general.blue,
    mod = palette_colors.general.blue,

    ind_sel = palette_colors.general.grey3,
    ind_vis = palette_colors.general.grey3,
}

require("bufferline").setup{
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        numbers = "ordinal",
        buffer_close_icon = "",
        modified_icon = '🆆',
        close_icon = "",
        separator_style = "thin",
        offsets = {
            {
                -- filetype = "NvimTree",
           }
        },
    },
    -- параметры тута брал
    -- https://github.com/akinsho/bufferline.nvim/blob/main/lua/bufferline/config.lua
    highlights = {
        -- всего три режима отображения: обычный, visible - выбранный, но
        -- неактивный, и selected - выбранный и активный.
        fill = {
            bg = buf_colors.bg,
        },
        close_button = {
            fg = buf_colors.fg, bg = buf_colors.bg,
        },
        close_button_visible = {
            fg = buf_colors.fg_vis, bg = buf_colors.bg_vis,
        },
        close_button_selected = {
            fg = buf_colors.fg_sel, bg = buf_colors.bg_sel,
        },
        buffer = {
            fg = buf_colors.fg, bg = buf_colors.bg, bold = true, italic = true,
        },
        buffer_visible = {
            fg = buf_colors.fg_vis, bg = buf_colors.bg_vis, bold = true, italic = true,
        },
        buffer_selected = {
            fg = buf_colors.fg_sel, bg = buf_colors.bg_sel, bold = true, italic = true,
        },
        background = {
            fg = buf_colors.fg, bg = buf_colors.bg,
        },
        numbers = {
            fg = buf_colors.fg, bg = buf_colors.bg,
        },
        numbers_visible = {
            fg = buf_colors.fg_sel, bg = buf_colors.bg_sel,
        },
        numbers_selected = {
            fg = buf_colors.fg_sel, bg = buf_colors.bg_sel, bold = true, italic = true,
        },
        modified = {
            fg = buf_colors.mod, bg = buf_colors.bg,
        },
        modified_visible = {
            fg = buf_colors.mod_vis, bg = buf_colors.bg_vis,
        },
        modified_selected = {
            fg = buf_colors.mod_sel, bg = buf_colors.bg_sel,
        },
        separator_selected = {
            bg = buf_colors.bg_sel,
            fg = buf_colors.bg,
        },
        separator_visible = {
            bg = buf_colors.bg_sel,
            fg = buf_colors.bg,
        },
        separator = {
            bg = buf_colors.bg,
            fg = buf_colors.bg_edit,
        },
        indicator_selected = {
            fg = buf_colors.ind_sel, bg = buf_colors.bg_sel,
        },
        indicator_visible = {
            fg = buf_colors.ind_vis, bg = buf_colors.bg_vis,
        },
        tab_close = {
            fg = buf_colors.fg,
            bg = buf_colors.bg,
        },
        tab = {
            fg = buf_colors.fg, bg = buf_colors.bg,
        },
        tab_selected = {
            fg = buf_colors.fg_sel,
            bg = buf_colors.bg_sel,
            sp = buf_colors.bg,
        },
        tab_separator = {
            fg = buf_colors.bg,
            bg = buf_colors.bg,
        },
        tab_separator_selected = {
            fg = buf_colors.bg,
            bg = buf_colors.bg_sel,
        },
    },
}
