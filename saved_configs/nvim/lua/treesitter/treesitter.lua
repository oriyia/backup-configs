require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "markdown", "python", "latex", 'lua', 'toml', 'bash'},
    -- indent = {
    --     enable = true,
    -- },
    highlight = {
        enable = true,
        disable = {'markdown'},
    },
}

-- require('nvim-treesitter.highlight').set_custom_captures {
--     ['text.envmath'] = 'displayed_equation',
-- }
