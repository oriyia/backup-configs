local api = vim.api
local colors = require('colors.colors')

require("nvim-tree").setup({
  -- Все здесь
  -- https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
  sort_by = "case_sensitive",
  hijack_cursor = true, -- курсор на первом символе файла
  view = {
    adaptive_size = true, -- ширина окна дерева по самой длинной строке
    mappings = {
      list = {
        {key = "u",                               action = "dir_up"},
        {key = {"<C-j>", "o", "<2-LeftMouse>" },  action = "edit"},
        {key = "<C-h>",                           action = "close_node"},
        {key = {"<C-l>", "<2-RightMouse>" },      action = "cd"},
        {key = "<leader>dv",                      action = "vsplit"},
        {key = "<leader>ds",                      action = "split"},
        {key = "<leader>dn",                      action = "tabnew"},
      },
    },
  },
  renderer = {
    group_empty = true,
    -- highlight_opened_files = 'all', -- подсветка открытых файлов
    icons = {
        show = {
            folder_arrow = false, -- стрелочка напротив папок
        }
    },
    indent_markers = {
        enable = true,
    }
  },
  filters = {
    dotfiles = true,
  },
})
