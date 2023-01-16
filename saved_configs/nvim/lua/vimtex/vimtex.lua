local cmd = vim.cmd
local vim = vim
local g = vim.g
local opt = vim.opt

-------------------------------------------------------------------------------
-- Оглавление
-------------------------------------------------------------------------------
g.vimtex_toc_config = {
    name = 'ToC',  -- имя окна с оглавлением
    show_help = 0, -- не показывать справку
    show_numbers = 0,
    hide_line_numbers = 'relativenumber', -- относительная нумерация строк
    tocdepth = 6, -- уровень развертки оглавления (6 - по subparagraph)
    split_width = 39,
    indent_levels = 1, -- отступы для различных разделов
    refresh_always = 0, -- автообновление оглавления
    layer_status = { label = 0 }, -- показывать ссылки (метки)
}

g.vimtex_toc_show_preamble = 0

-------------------------------------------------------------------------------
-- Общие настройки
-------------------------------------------------------------------------------
-- отключение отступа для перечисленных окружений
-- cmd([[
-- let g:vimtex_indent_ignored_envs = ['document', 'verbatim', 'lstlisting', 'frame', 'tabular', 'itemize', 'enumerate', 'table', 'NiceTabular']
-- ]])
g.vimtex_indent_ignored_envs = {
    'document', 'verbatim', 'lstlisting',
    'frame', 'tabular', 'itemize',
    'enumerate', 'table', 'NiceTabular'
}

opt.conceallevel = 0 -- маскировка элементов кода latex плагина vimtex
g.vimtex_syntax_conceal = {
    accents=1,
    math_bounds=1,
    math_delimiters=1,
    math_fracs=1,
    math_super_sub=0, -- надстрочные и подстрочные символы и т.п.
    math_symbols=1, -- симоволы (пересечение и т.п.)
-- \ 'ligatures': 1,
-- \ 'cites': 1,
-- \ 'fancy': 1,
-- \ 'greek': 1,
-- \ 'sections': 0,
-- \ 'styles': 1,
}
g.tex_conceal = 'abdmg'
g.vimtex_indent_enabled = 0
g.vimtex_indent_on_ampersands = 0
g.vimtex_syntax_enabled = 0
g.vimtex_imaps_enabled = 0

-------------------------------------------------------------------------------
-- Средства просмотра
-------------------------------------------------------------------------------
g.tex_flavor = 'latex'
g.vimtex_view_method = 'zathura' -- метод просмотра
g.vimtex_view_general_viewer  = 'zathura' -- главный просмотрщик
g.vimtex_view_general_options = '--unique \\@pdf\\#src:@tex:@line:@col'
