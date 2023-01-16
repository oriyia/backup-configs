require("toggleterm").setup{
    shade_terminals = false, -- более темное окно терминала
    open_mapping = [[<C-t>]],
    close_on_exit = false,
    highlights = {
        Normal = {
            -- guibg = "#eeeeee",
        },
    },
}

local Terminal  = require('toggleterm.terminal').Terminal
local python = Terminal:new({cmd = "ipython"})

function _python_toggle()
  python:toggle()
end


