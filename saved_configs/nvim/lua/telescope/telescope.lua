-- Большее количество параметров
-- https://github.com/nvim-telescope/telescope.nvim/blob/39b12d84e86f5054e2ed98829b367598ae53ab41/plugin/telescope.lua#L11-L91
--
require('telescope').setup{
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
                ['<C-f>'] = "select_vertical",
                ['<C-Space>'] = "preview_scrolling_up",
                ['<Space>'] = "preview_scrolling_down",
            },
            n = {
                -- функция смены рабочей директории
                ["cd"] = function(prompt_bufnr)
                    local selection = require("telescope.actions.state").get_selected_entry()
                    local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                    require("telescope.actions").close(prompt_bufnr)
                    -- Depending on what you want put `cd`, `lcd`, `tcd`
                    vim.cmd(string.format("silent lcd %s", dir))
                end,
            },
        },
        borderchars = {
            prompt = { "█", " ", " ", " ", "█", "█", " ", " " },
            results = { " ", "▐", " ", "▌", "▌", "▐", "▐", "▌" },
            preview = { "█", "▐", " ", "▌", "█", "█", "▐", "▌" },
            -- prompt = { "█", " ", " ", " ", "█", "█", " ", " " },
            -- results = { "█", "▐", " ", "▌", "█", "█", "▐", "▌" },
            -- preview = { "█", "▐", "▄", "▌", "█", "█", "▟", "▙" },
        },
          -- prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
          -- results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          -- preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    pickers = {
        live_grep = {
            mappings = {
                n = {
                    -- функция смены рабочей директории
                    ["cd"] = function(prompt_bufnr)
                        local selection = require("telescope.actions.state").get_selected_entry()
                        local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                        require("telescope.actions").close(prompt_bufnr)
                        -- Depending on what you want put `cd`, `lcd`, `tcd`
                        vim.cmd(string.format("silent lcd %s", dir))
                    end,
                },
                i = {
                    ['<C-f>'] = "select_vertical",
                    ['<C-Space>'] = "preview_scrolling_up",
                    ['<Space>'] = "preview_scrolling_down",
                },
            }
        },
    },
}

require('telescope').load_extension('luasnip')
