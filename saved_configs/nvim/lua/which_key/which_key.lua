require("which-key").setup{
    popup_mappings = {
        scroll_down = '<Space>', -- binding to scroll down inside the popup
        scroll_up = '<C-Space>', -- binding to scroll up inside the popup
    },
    window = {
        border = "double",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0
    },
}
