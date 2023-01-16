-------------------------------------------------------------------------------
-- Псевдонимы для команд и опций
-------------------------------------------------------------------------------
local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local o = vim.o
local wo = vim.wo
local opt = vim.opt             -- global/buffer/windows-scoped options
local vim = vim
local api = vim.api

opt.encoding = "utf-8"          -- кодировка файла
opt.swapfile = false            -- не создавать swap файлы
opt.scrolloff = 999               -- строка снизу от которой скролится экран
opt.mouse = 'a'

-- сопоставления
g.mapleader = ","
g.maplocalleader = "\\"

-- style folder
cmd[[
function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
]]


-- Не автокомментировать новые линии при переходе на новую строку
cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-------------------------------------------------------------------------------
-- Оформление
-------------------------------------------------------------------------------
opt.cursorline = true           -- подсветка строки курсора
opt.colorcolumn = '80'          -- столбец ограничитель в 80 символов
opt.title = true                -- в заголовке окна будет путь и имя файла
opt.number = true               -- нумерация строк
opt.relativenumber = true       -- относительная нумерация строк
o.termguicolors = true          -- использовать termguicolors
opt.textwidth = 80              -- автопернос текста

-- indent style
opt.list = true


-------------------------------------------------------------------------------
-- xkb-switch
-------------------------------------------------------------------------------
g.XkbSwitchLib = '/usr/local/lib/libxkbswitch.so'
g.XkbSwitchEnabled = 1
g.XkbSwitchIMappings = {'ru'}
g.XkbSwitchNLayout = 'us'

cmd [[
let g:XkbSwitchSkipIMappings = {
    \ 'tex': ['.', '>', ':', '{<CR>', '/*', '/*<CR>'],
    \ 'c': ['.', '>', ':', '{<CR>', '/*', '/*<CR>'],
    \ 'cpp': ['.', '>', ':', '{<CR>', '/*', '/*<CR>']
    \}
]]


-------------------------------------------------------------------------------
-- Табы и отступы
-------------------------------------------------------------------------------
-- определение типа файла, загрузка плагинов и отступов в соответствии с ним
cmd([[
filetype indent plugin on
syntax enable
]])

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- количество пробелов при автоотступе
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- автоотступ на новой строке

g.synmaxcol=256
g.regexpengine=1


cmd([[
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|tabular\|enumerate\|itemize'
]])

-------------------------------------------------------------------------------
-- Fold
-------------------------------------------------------------------------------
-- fold от vimtex
-- g.vimtex_fold_enable = 1
-- opt.foldmethod = "expr"
-- opt.foldexpr = "vimtex#fold#level(v:lnum)"
-- opt.foldtext = "vimtex#fold#text()"

-- cmd([[
-- autocmd FileType python setlocal foldmethod=indent
-- ]])


-- wo.foldmethod = "expr"
-- wo.foldexpr = "nvim_treesitter#foldexpr()"

-- local M = {}
-- -- function to create a list of commands and convert them to autocommands
-- -------- This function is taken from https://github.com/norcalli/nvim_utils
-- function M.nvim_create_augroups(definitions)
--     for group_name, definition in pairs(definitions) do
--         api.nvim_command('augroup '..group_name)
--         api.nvim_command('autocmd!')
--         for _, def in ipairs(definition) do
--             local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
--             api.nvim_command(command)
--         end
--         api.nvim_command('augroup END')
--     end
-- end
--
--
-- local autoCommands = {
--     -- other autocommands
--     open_folds = {
--         {"BufReadPost,FileReadPost", "*", "normal zR"}
--     }
-- }
--
-- M.nvim_create_augroups(autoCommands)


-------------------------------------------------------------------------------
-- Еще
-------------------------------------------------------------------------------
-- packer auto-compile
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
