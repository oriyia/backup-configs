-- Цвета и переменные:
-- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/highlights.lua

-- onedark theme
-- https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua

local vim = vim
local api = vim.api
local palette_colors = require('colors.colors')

local colors = {
    bg = palette_colors.general.bg,
    fg = palette_colors.general.fg,
    fg_comment = palette_colors.general.grey3,
    cursor_line = palette_colors.general.light_grey,
    visual_area = palette_colors.general.grey,
    hop_unmatched = palette_colors.general.light_grey2,
    color_column = palette_colors.general.bg,
    column_number = palette_colors.general.grey3,
    column_number_cursor = palette_colors.general.light_pink,
    line_indent = palette_colors.general.grey,
    bg_search = palette_colors.general.yellow,
    fg_folded = '#E09864',
    bg_folded = '#3E4355',
    fg_match_paren = palette_colors.general.fg, -- выделение парных объектов
    bg_match_paren = palette_colors.general.grey, -- выделение парных объектов
    fg_red = palette_colors.general.red,
    fg_orange = palette_colors.general.orange,
    fg_yellow = palette_colors.general.yellow,
    fg_green = palette_colors.general.green,
    blue = palette_colors.general.blue,
    fg_cyan =  palette_colors.general.cyan,
    fg_purple = palette_colors.general.purple,
    light_blue = palette_colors.general.blue,

    -- git
    bg_diff_delete = '#483F63',
    bg_diff_change = '#3C4463',
    bg_diff_add = '#304B54',

    -- nvim-tree
    tree_folder = palette_colors.general.blue,
    tree_root = palette_colors.general.orange,
    tree_indent_marker = palette_colors.general.grey,
    tree_icon_folder = palette_colors.general.light_grey,

    -- telescope
    -- telescope new
    ts_border_bg = palette_colors.general.cornflower,
    ts_border_fg = '#9C9BF0',
    ts_results_select_line_fg = palette_colors.general.fg,
    ts_results_select_line_bg = palette_colors.general.grey,
    ts_results_caret = palette_colors.general.light_pink,
    ts_results_bg = palette_colors.general.light_grey,
    ts_results_fg = palette_colors.general.light_grey2,

    ts_preview_bg = palette_colors.general.white,
    ts_preview_line_bg = palette_colors.general.light_grey,

    ts_prompt_fg = palette_colors.general.light_grey,
    ts_prompt_bg = palette_colors.general.cornflower,
    ts_prompt_prefix = palette_colors.general.light_yellow,
    ts_operator = palette_colors.general.cyan,

    -- vimtex
    -- latex_math_env = '#7D8CAD',
    -- latex_math_env_short_fg = '#7E8CC2',
    -- latex_math_env_short_bg = '#474D62',
    -- latex_math_env_name = '#E9B374',
    -- latex_math_degree = '#89BC81',
    -- latex_math_operator = '#D56BAA',
    -- latex_math_bracket = '#ED5B5B',
    latex_math_degree_text = palette_colors.general.orange,

    -- latex_bracket = palette_colors.general.purple,
    latex_item = palette_colors.general.light_grey2,
    latex_cmd = palette_colors.general.purple,
    -- latex_arguments = '#6E8EFF',
    -- latex_options = '#D56BAA',
    -- latex_cmd_arguments = '#6e8eff',
    -- latex_cmd_verb = '#7193DE',
    -- latex_usepackage = '#ED5B5B',

    latex_title = palette_colors.general.green,
    latex_env = palette_colors.general.cyan,
    latex_env_name = palette_colors.general.blue,
    latex_section = palette_colors.general.yellow,
    latex_verbatim_env_text = palette_colors.general.pink,

    code_repeat = '#ED5B5B',
}

require('onedark').setup {
    style = 'darker',
    colors = {
        green = palette_colors.general.green,
        red =   palette_colors.general.red,
        blue =  palette_colors.general.blue,
        yellow = palette_colors.general.yellow,
        cyan =  palette_colors.general.cyan,
        orange = palette_colors.general.orange,
        purple = palette_colors.general.purple,
        light_grey = palette_colors.general.fg,
        grey = palette_colors.general.grey3,
        fg = palette_colors.general.fg,
        black = palette_colors.general.fg,
        bg0 = palette_colors.general.bg, -- fg current line подсказка в EX команде
        -- (символы отсутствующих строк (малый файл))
		bg1 = palette_colors.general.light_grey, -- bg еще одни в lualine level3
		bg2 = palette_colors.general.light_grey,
		bg3 = palette_colors.general.light_grey,
		bg_d = palette_colors.general.light_grey, -- vline tree, симвылы пустой строки
		bg_blue = palette_colors.general.blue, -- current line в подсказке в EX команде
    },
    highlights = {
        Normal = {
            fg = colors.fg,
            bg = colors.bg,
        },
        -- меню подксказка в командной строке и подсказска nvim-cmp
        Pmenu = {
            -- fg = colors.bg,
            bg = palette_colors.general.light_grey,
        },
        -- диагностика lsp
        DiagnosticVirtualTextError = {
            fg = colors.fg_red,
        },
        DiagnosticVirtualTextWarn = {
            fg = colors.fg_orange,
        },
        DiagnosticVirtualTextInfo = {
            fg = colors.fg_cyan,
        },
        DiagnosticVirtualTextHint = {
            fg = colors.fg_purple,
        },

        EndOfBuffer = {
            bg = colors.bg, -- bg части файла где нет текста
        },
        Comment = {
            fg = colors.fg_comment,
        },
        CursorLine = {
            bg = colors.cursor_line,
        },
        ColorColumn = {
            bg = palette_colors.general.light_grey, -- стобец в 80 символов
        },
        CursorLineNr = {
            fg = colors.column_number_cursor, -- Номер текущей строки в стобце
        },
        Visual = {
            bg = colors.visual_area,
        },
        VertSplit = {
            fg = colors.color_column,
        },
        ToolbarLine = {
            fg = colors.column_number,
        },
        Cursor = {
            fmt = "reverse",
        },
        LineNr = {
            fg = colors.column_number, -- столбец с номерами строк
        },
        MatchParen = {
            -- fg = colors.fg_match_paren, -- выделение парных объектов
            bg = colors.bg_match_paren, -- выделение парных объектов
        },
        -- Statement = {
        --     fg = colors.fg_red, -- цвет def
        -- },
        Directory = {
            fg = colors.tree_folder,  -- цвет имени директории которая открыта
        },
        Folded = {
            fg = colors.fg_folded, -- сворачиваемые папки в коде
            bg = colors.bg_folded,
        },
        DiffDelete = {
            bg = colors.bg_diff_delete,
        },
        DiffChange = {
            bg = colors.bg_diff_change,
        },
        DiffAdd = {
            bg = colors.bg_diff_add,
        },

        TelescopePreviewNormal = {
            bg = colors.ts_preview_bg,
        },
        TelescopePreviewTitle = {
            fg = colors.ts_border_fg,
            bg = colors.ts_border_bg,
        },
        TelescopePreviewBorder = {
            fg = colors.ts_border_bg,
            bg = colors.ts_preview_bg,
            fmt = 'bold',
        },
        TelescopePreviewLine = {
            -- fg = colors.bg,
            bg = colors.visual_area,  -- Подсветка строки вхождения
        },

        TelescopeResultsNormal = {
            fg = colors.ts_results_fg,
            bg = colors.ts_results_bg,
        },
        TelescopeResultsTitle = {
            fg = colors.ts_results_bg,
            bg = colors.ts_results_bg,
        },
        TelescopeResultsBorder = {
            fg = colors.ts_border_bg,
            bg = colors.ts_results_bg,
            fmt = 'bold',
        },
        TelescopeMatching = {
            fg = colors.fg_orange,
            fmt = 'bold',
        },
        TelescopeSelectionCaret = {
            fg = colors.ts_results_caret,  -- указатель текущей строки
            bg = colors.ts_results_bg,
            fmt = 'bold',
        },
        TelescopeSelection = { -- текущая строка в results
            fg = colors.ts_results_select_line_fg,
            bg = colors.ts_results_select_line_bg,
        },

        TelescopePromptNormal = {
            fg = colors.ts_prompt_fg,
            bg = colors.ts_prompt_bg,
        },
        TelescopePromptPrefix = {
            fg = colors.ts_prompt_prefix,
            bg = colors.ts_prompt_bg,
            fmt = 'bold',
        },
        TelescopePromptBorder = {
            fg = colors.ts_prompt_bg,
            bg = colors.ts_prompt_bg,
            fmt = 'bold',
        },
        TelescopePromptCounter = {
            fg = colors.ts_prompt_fg,
            fmt = 'bold',
        },
        TelescopePromptTitle = {
            fg = colors.ts_prompt_bg,
            bg = colors.ts_prompt_bg,
        },

        Search = {
            -- fg = colors.fg_search,
            bg = colors.fg_yellow,
        },
        IndentBlanklineIndent = {
            fg = colors.line_indent,
            fmt = 'nocombine',
        },
        Conceal = {
            fg = 'none',
            bg = 'none',
            fmt = 'bold',
        },
        NvimTreeNormal = {
            fg = colors.fg,
            bg = colors.bg,
        },
        NvimTreeImageFile = {
            fg = colors.fg_purple,
        },
        NvimTreeRootFolder = {
            fg = colors.tree_root,
            fmt = "bold"
        },
        NvimTreeVertSplit = {
            bg = colors.bg,
        },
        NvimTreeEndOfBuffer = {
            bg = colors.bg,
        },
        NvimTreeIndentMarker = {
            fg = colors.tree_indent_marker,
        },
        NvimTreeFolderName = {
            fg = colors.tree_folder, fmt = 'bold'
        },

        -- настройка цвета для treesitter
        ["@variable"] = {
            fg = colors.fg,  -- переменные, которые определил пользователь
        },
        ["@punctuation.delimiter"] = {
            fg = colors.fg_orange,  -- разделители . : ; и т.п.
            fmt = 'bold',
        },
        ["@field"] = {
            fg = colors.blue, -- переменные
        },
        ["@function.builtin"] = {
            fg = colors.fg_red, -- встроенные функции (require)
        },
        ["@operator"] = {
            fg = colors.ts_operator, -- знаки = ^ | +
        },
        ["@punctuation.bracket"] = {
            fg = colors.latex_cmd, -- скобки ()
        },
        ["@text.environment"] = {
            fg = colors.latex_env, -- \BEGIN ... \END
        },
        ["@text.environment.name"] = {
            fg = colors.latex_env_name, -- \begin{NAME} ... \end{NAME}
        },
        ["@namespace"] = {
            fg = colors.latex_section, -- \SECTION
        },
        ["@text.title"] = {
            fg = colors.latex_title, -- \section{NAME}
        },
        ["@include"] = {
            fg = colors.latex_cmd, -- \usepackage \includegrahics
        },
        ["@parameter"] = {
            fg = colors.blue, -- -f путь до файлов bash | параметры в определении функций python | latex [PARAMS] параметры в квадратных скобках
        },
        ["@repeat"] = {
            fg = colors.code_repeat, -- \usepackage \includegrahics
        },
        ["@punctuation.special"] = {
            fg = colors.latex_item, -- \ITEM или $ bash
        },
        ["@function"] = {
            fg = colors.latex_cmd, -- \CMD latex; python name_function
        },
        ["@keyword.function"] = {
            fg = colors.fg_red, -- def python;
        },
        ["@text.math"] = {
            fg = colors.latex_math_degree_text, -- math
        },
        ["@text.listing"] = {
            fg = colors.latex_verbatim_env_text, -- \begin{lstlisting} CODE
        },
        ["@text.verbatim"] = {
            fg = colors.latex_verbatim_env_text, -- \begin{verbatim} CODE
        },

        -- hop
        HopNextKey1 = {
            fg = colors.blue,
            fmt = "bold",
        },
        HopNextKey2 = {
            fg = colors.blue,
        },
        HopUnmatched = {
            fg = colors.hop_unmatched,
        },


    },
    code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'bold',
        strings = 'none',
        variables = 'bold'
    },
}

require('onedark').load()
-- параметры брал отсюда
-- https://github.com/lervag/vimtex/blob/master/doc/vimtex.txt

-- api.nvim_set_hl(0, "texMathDelim", {  -- () в формеле
--     fg=colors.latex_math_bracket,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathDelimZoneLD", {  -- \[ \]
--     fg=colors.latex_math_env_short_fg,
--     bg=colors.latex_math_env_short_bg,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathDelimZoneLI", {  -- \( \)
--     fg=colors.latex_math_env_short_fg,
--     bg=colors.latex_math_env_short_bg,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathDelimZoneTI", {  -- $
--     fg=colors.latex_math_env_short_fg,
--     bg=colors.latex_math_env_short_bg,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathDelimZoneTD", {  -- $$
--     fg=colors.latex_math_env_short_fg,
--     bg=colors.latex_math_env_short_bg,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texCmdMathEnv", { -- \BEGIN \END math
--     fg=colors.latex_math_env,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathEnvArgName", { -- \begin{EQUATION} math
--     fg=colors.latex_math_env_name,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathOper", { -- * + =
--     fg=colors.latex_math_operator,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathZoneEnv", { --  \begin{menv}  HERE \end{menv}
--     fg=colors.fg,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texMathZoneLI", { -- \( HERE \)
--     fg=colors.fg,
--     bold=true,
-- })
--
-- api.nvim_set_hl(0, "texMathZoneLD", { --  \[ HERE \]
--     fg=colors.fg,
--     bold=true,
-- })
--
-- api.nvim_set_hl(0, "texMathZoneTI", { --  $ HERE $
--     fg=colors.fg,
--     bold=true,
-- })
--
-- api.nvim_set_hl(0, "texMathZoneTD", { --  $$ HERE $$
--     fg=colors.fg,
--     bold=True
-- })
--
-- api.nvim_set_hl(0, "texMathZone", { --  степени и индексы и обычный текст в дробях
--     fg=colors.latex_math_degree_text,
--     bold=True
-- })
--
-- api.nvim_set_hl(0, "texMathSuperSub", { --  ^, _ {} относящиеся к степеням
--     fg=colors.latex_math_degree,
--     bold=True
-- })
--
-- api.nvim_set_hl(0, "texSpecialChar", { -- \S, \P, \$, \;, ...
--     fg=colors.ts_prompt_prefix,
-- })
--
-- api.nvim_set_hl(0, "texCmd", { -- \CMD
--     fg=colors.latex_cmd,
--     bold=True,
-- })
--
-- api.nvim_set_hl(0, "texOpt", { -- \cmd[OPT]
--     fg=colors.latex_cmd_arguments,
--     bold=True,
-- })
--
-- api.nvim_set_hl(0, "texArg", { -- \cmd[...]{ARG}
--     fg=colors.fg_red,
--     bold=True,
-- })
--
-- api.nvim_set_hl(0, "texDelim", { -- {, }, [, and ]
--     fg=colors.latex_bracket,
-- })
--
-- api.nvim_set_hl(0, "texDefParm", { -- {, }, [, and ]
--     fg=colors.fg_red,
-- })
--
-- api.nvim_set_hl(0, "texVerbZone", { -- \begin{verbatim} VERB TEXT \end{verbatim}
--     fg=colors.latex_verbatim_env_text,
--     bold=True
-- })
--
-- api.nvim_set_hl(0, "texCmdVerb", { -- \VERB
--     fg=colors.latex_cmd_verb,
--     bold=True
-- })
--
-- api.nvim_set_hl(0, "texVerbZoneInline", { -- \verb+VERB TEXT+
--     fg=colors.latex_verbatim_env_text,
--     bold=True
-- })
--
-- api.nvim_set_hl(0, "texCmdItem", { -- \item
--     fg=colors.latex_item,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texCmdClass", { -- \DOCUMENTCLASS
--     fg=colors.fg_green,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texFileOpt", { -- \documentclass[CLASS OPTIONS]
--     fg=colors.latex_options,
--     italic=true
-- })
--
-- api.nvim_set_hl(0, "texCmdPackage", { -- \USEPACKAGE
--     fg=colors.latex_usepackage,
--     bold=true,
-- })
--
-- api.nvim_set_hl(0, "texFilesArg", { -- \usepackage[...]{PACKAGE1, PACKAGE2}
--     fg=colors.latex_arguments,
-- })
--
-- api.nvim_set_hl(0, "texCmdEnv", { -- \BEGIN; \END
--     fg=colors.latex_env,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texEnvArgName", { -- \begin{ENVNAME}
--     fg=colors.latex_env_name,
--     bold=true
-- })
--
-- api.nvim_set_hl(0, "texPartArgTitle", { -- \begin{ENVNAME}
--     fg=colors.fg_green,
--     bold=true,
--     underline=true,
--     -- italic=true,
-- })
--
-- -- Все параметры тут:
-- -- https://github.com/kyazdani42/nvim-tree.lua/blob/master/lua/nvim-tree/colors.lua
api.nvim_set_hl(0, "NvimTreeFolderIcon", { -- icon folder nvim-tree
    fg=colors.tree_icon_folder,
})
--
return colors
