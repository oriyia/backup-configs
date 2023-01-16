-- local map = vim.api.nvim_set_keymap
-- local default_opts = {noremap = true, silent = true}
local function map(mode, shortcut, command)
    vim.keymap.set(mode, shortcut, command, {noremap = true, silent = true})
end

local function nmap(shortcut, command)
    map('n', shortcut, command)
end

local function imap(shortcut, command)
    map('i', shortcut, command)
end

local function nimap(shortcut, command)
    map({'n', 'i'}, shortcut, command)
end

local function nvmap(shortcut, command)
    map({'n', 'v'}, shortcut, command)
end

local function vmap(shortcut, command)
    map('v', shortcut, command)
end

local function tmap(shortcut, command)
    map('t', shortcut, command)
end

-- Копирование
vmap('<leader>aa', '"+y') -- копирование в clipboard
nmap('<leader>aa', '"+yy') -- копирование строки в clipboard (normal mode)

nmap('<leader>as', '"hyy') -- копирование в регистр h
vmap('<leader>as', '"hy') -- копирование в регистр h
nvmap('<leader>ah', '"hp') -- вставка из регистра h

nmap('<leader>ad', '"jyy') -- копирование в регистр j
vmap('<leader>ad', '"jy') -- копирование в регистр j
nvmap('<leader>aj', '"jp') -- вставка из регистра j

nmap('<leader>af', '"kyy') -- копирование в регистр k
vmap('<leader>af', '"ky') -- копирование в регистр k
nvmap('<leader>ak', '"kp') -- вставка из регистра k

nmap('<leader>ag', '"lyy') -- копирование в регистр l
vmap('<leader>ag', '"ly') -- копирование в регистр l
nvmap('<leader>al', '"lp') -- вставка из регистр l

-- Снять выделение
nmap('<leader><Space>', ':nohl<CR>')
-- Пролистнуть на страницу вниз / вверх
nvmap('<Space>', '<PageDown> zz')
nvmap('<C-Space>', '<PageUp> zz')
-- Сохранение по CTRL-s , как в нормальном, так и в insert режиме
nimap('<C-s>', '<esc>:w<CR>')

-- перемещение
nvmap('<C-h>', '^')  -- Перейти к первому непустому символу строки
nvmap('<C-k>', '5k')
nvmap('<C-j>', '5j')
-- <F3> перечитать конфигурацию nvim Может не работать, если echo $TERM  xterm-256color
-- nmap('<C-w>', ':so ~/.config/nvim/init.lua<CR>:so ~/.config/nvim/lua/plugins.lua<CR>:so ~/.config/nvim/lua/option.lua<CR>:so ~/.config/nvim/lua/keymaps.lua<CR>')
-- <S-F3> Открыть всю nvim конфигурацию для редактирования
-- nmap('<C-S-w>', ':e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/option.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>')


-------------------------------------------------------------------------------
-- Nvim-Tree
-------------------------------------------------------------------------------
nmap('<leader>dd', ':NvimTreeFocus<CR>')
nmap('<leader>dt', ':NvimTreeToggle<CR>')
nmap('<leader>dc', ':NvimTreeClose<CR>')
nmap('<leader>df', ':NvimTreeFindFile<CR>')
-- свернуть дерево, открыты лишь каталоги с открытыми файлами
nmap('<leader>ds', ':NvimTreeCollapseKeepBuffers<CR>')
-- обновить дерево
nmap('<leader>dr', ':NvimTreeRefresh<CR>')


-------------------------------------------------------------------------------
-- Bufferline
-------------------------------------------------------------------------------
-- перемещенеи к определенному видимому буферу
nmap('<leader>1', '<Cmd>BufferLineGoToBuffer 1<CR>')
nmap('<leader>2', '<Cmd>BufferLineGoToBuffer 2<CR>')
nmap('<leader>3', '<Cmd>BufferLineGoToBuffer 3<CR>')
nmap('<leader>4', '<Cmd>BufferLineGoToBuffer 4<CR>')
nmap('<leader>5', '<Cmd>BufferLineGoToBuffer 5<CR>')
nmap('<leader>6', '<Cmd>BufferLineGoToBuffer 6<CR>')
nmap('<leader>7', '<Cmd>BufferLineGoToBuffer 7<CR>')
nmap('<leader>8', '<Cmd>BufferLineGoToBuffer 8<CR>')
nmap('<leader>9', '<Cmd>BufferLineGoToBuffer 9<CR>')

-- закрытие буфера или вкладки
nmap('<leader>bb', '<Cmd>BufferLinePickClose<CR>')
nmap('<leader>bt', ':tabclose<CR>')

-- Переключение между вкладками
nmap('<S-l>', ':BufferLineCycleNext<CR>')
nmap('<S-h>', ':BufferLineCyclePrev<CR>')


-------------------------------------------------------------------------------
-- Telescope
-------------------------------------------------------------------------------
-- документация по командам (и все остальное)
nmap('<leader>fg', ':Telescope find_files<CR>')
nmap('<leader>fa', ':lua require("telescope.builtin").live_grep({glob_pattern={"!*.aux", "!*.toc", "!*.log", "!*.out", "!*.fdb_latexmk", "!*.fls"}, })<CR>')
nmap('<leader>fz', ':Telescope live_grep<CR>')
nmap('<leader>ff', ':Telescope current_buffer_fuzzy_find<CR>')

nmap('<leader>fc', ':Telescope commands<CR>')
nmap('<leader>fv', ':Telescope command_history<CR>')
nmap('<leader>fm', ':Telescope man_pages<CR>')
nmap('<leader>fd', ':Telescope marks<CR>')
nmap('<leader>fq', ':Telescope quickfix<CR>')
nmap('<leader>fw', ':Telescope quickfixhistory<CR>')
nmap('<leader>fs', ':Telescope jumplist<CR>')
nmap('<leader>fp', ':Telescope spell_suggest<CR>') -- список вариантов правописания
nmap('<leader>fl', ':Telescope buffers<CR>')
nmap('<leader>fk', ':Telescope keymaps<CR>')
nmap('<leader>fj', ':Telescope current_buffer_tags<CR>')
nmap('<leader>fh', ':Telescope tags<CR>')
nmap('<leader>fo', ':Telescope oldfiles<CR>')
nmap('<leader>fr', ':Telescope registers<CR>')
nmap('<leader>fm', ':Telescope luasnip<CR>')

nmap('<leader>fee', ':Telescope git_commits<CR>')
nmap('<leader>few', ':Telescope git_bcommits<CR>') -- коммиты текущего файла
nmap('<leader>feq', ':Telescope git_branches<CR>')
nmap('<leader>fea', ':Telescope git_status<CR>')


-------------------------------------------------------------------------------
-- Terminal
-------------------------------------------------------------------------------
tmap('<leader>j', [[<C-\><C-n>]])
tmap('<leader>k', [[<C-\><C-n><C-W>k]])

nmap('<leader>tjj', ':ToggleTermSendCurrentLine<CR>')
nmap('<leader>tj2', ':ToggleTermSendCurrentLine 2')
nmap('<leader>tj3', ':ToggleTermSendCurrentLine 3<CR>')
nmap('<leader>tj4', ':ToggleTermSendCurrentLine 4<CR>')
nmap('<leader>tj5', ':ToggleTermSendCurrentLine 5<CR>')

vmap('<leader>tkk', ':ToggleTermSendVisualLines<CR>')
vmap('<leader>tk2', ':ToggleTermSendVisualLines 2<CR>')
vmap('<leader>tk3', ':ToggleTermSendVisualLines 3<CR>')
vmap('<leader>tk4', ':ToggleTermSendVisualLines 4<CR>')
vmap('<leader>tk5', ':ToggleTermSendVisualLines 5<CR>')

nmap('<leader>t1', '<Cmd>lua _python_toggle()<CR>')
nmap('<leader>t2', ':ToggleTerm 2<CR>')
nmap('<leader>t3', ':ToggleTerm 3<CR>')
nmap('<leader>t4', ':ToggleTerm 4<CR>')
nmap('<leader>t5', ':ToggleTerm 5<CR>')

nmap('<leader>tc', '<Esc>:ToggleTermToggleAll<CR>')


-- local Terminal = require('toggleterm.terminal').Terminal
-- local python = Terminal:new({cmd = 'python', hidden = true})
--
-- function _PYTHON_TOGGLE()
--     python:toggle()
-- end

-- function _G.set_terminal_keymaps()
--     local opts = {noremap = true}
--     vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-t><C-n>]], opt)
--     vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-t><C-n>]], opt)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-t><C-n><C-W>h]], opt)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-t><C-n><C-W>j]], opt)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-t><C-n><C-W>k]], opt)
--     vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-t><C-n><C-W>l]], opt)
-- end


-------------------------------------------------------------------------------
-- Trouble
-------------------------------------------------------------------------------
nmap('<leader>ll', '<cmd>TroubleToggle<CR>')


-------------------------------------------------------------------------------
-- Hop
-------------------------------------------------------------------------------
nvmap('mm', '<cmd>HopWordMW<CR>')
nvmap('ma', '<cmd>HopChar1MW<CR>')
nvmap('mf', '<cmd>HopChar1CurrentLine<CR>')
nmap('<S-m>f', 'v<cmd>HopChar1CurrentLine<CR>')
nvmap('md', '<cmd>HopChar2MW<CR>')


-- " Start interactive EasyAlign in visual mode (e.g. vipga)
nvmap('ga', '<Plug>(EasyAlign)')

-------------------------------------------------------------------------------
-- Latex
-------------------------------------------------------------------------------
-- vimtex
-- table of contents
nmap('<leader>cc', ':VimtexTocToggle<CR><C-w>h')
-- абзац
nmap('gn', 'vipgq')
-- вставка item в списках
nvmap('gm', '0i\\item <Esc>gqqj')
-- команды
nmap('<leader>cf', ':VimtexCompile<CR>')
nmap('<leader>ca', ':VimtexStop<CR>')
nmap('<leader>co', ':VimtexView<CR>')
nmap('<leader>cz', 'viWs||<Esc>P')
vmap('<leader>cz', 's||<Esc>P')
nmap('<leader>cv', 'viWs\\(\\)<Esc>hP')
vmap('<leader>cv', 's\\(\\)<Esc>hP')
-- редактирование конца строки с переносом слова
nmap('<leader>cj', '$x<S-j>xgqq')
