-------------------------------------------------------------------------------
-- import
-------------------------------------------------------------------------------
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

-- keymap
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- ключ развоорачивания сниппета или прыжок
keymap({'i', 's'}, '<Tab>',function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, {silent = true})

-- сопоставляем наши переходы в режимах вставки и визуальном режиме
keymap("i", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
keymap("s", "<S-Tab>", "<cmd>lua require'luasnip'.jump(-1)<CR>", opts)
-- set keybinds for both insert and VISUAL
keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

-- настройки
ls.config.set_config({
    store_selection_keys = "<Tab>",  -- активация спиппета в визуальном режиме
    enable_autosnippets = true,  -- автоматическое разворачивание сниппета
    update_events = 'TextChanged,TextChangedI', -- обновление текста в повторяющихся узлах
})

-- подгрузка новых сниппетов перезаходя в vim
keymap('n', '<leader>pp', '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/luasnip/"})<CR>', {})

-- пользовательская функция создания сниппета
-- local function snp(extension, triger, name, type, body)
--     ls.add_snippets(extension, {
--         s({
--             trig = triger,
--             name = name,
--             snippetType = type,
--         }, body
--         ),
--     })
-- end

local snp = ls.add_snippets

-- функция для вставки выделенного текста
-- local function v(_, snip)
--     return snip.env.TM_SELECTED_TEXT[1] or {}
-- end

local v = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

-- функция возврата группы захвата
local rf = function(_, snip)
    return snip.captures[1]
end

-- добавление параллельного текста в фрагменте
local function p(args)
    return sn(nil, {
        i(1, args[1]),
    })
end

-- определение окружающей среды
local tex_utils = {}
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function()  -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name)  -- generic environment detection
    local is_inside = vim.fn['vimtex#env#is_inside'](name)
    return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function()  -- equation environment detection
    return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function()  -- itemize environment detection
    return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end

-- пример передачи значения в condition
-- { condition = tex_utils.in_tikz }

-- переменные типов файлов
local ext = {
    all = 'all',
    tex = 'tex',
    md = 'markdown',
}

-- local get_stroke_table = function(_,_, user_arg)
-- 	return user_arg
-- end
--
-- -- local function fn(
-- --   args,     -- text from i(2) in this example i.e. { { "456" } }
-- --   parent,   -- parent snippet or parent node
-- --   user_args -- user_args from opts.user_args
-- -- )
-- --     -- a = {}
-- --     -- a[#a+1] = user_args1 .. user_args2
-- --     -- a[#a+1] = user_args1 .. user_args2
-- --     structure_function = create_table_structure(4, 5)
-- --     return structure_function
-- -- end
--
-- -- snp(ext.tex, "fdd", "markdown_link", 'snippet', {
-- --   f(fn,  -- callback (args, parent, user_args) -> string
-- --     {1}, -- node indice(s) whose text is passed to fn, i.e. i(2)
-- --     { user_args = {"text ", "&" }}
-- --   ),
-- --   i(1)
-- -- })
--
-- -------------------------------------------------------------------------------
-- -- ALL snippets
-- -------------------------------------------------------------------------------
-- local date = function()
--     return {os.date('%Y-%m-%d')}
-- end
--
-- -- текущая дата
-- snp(ext.all, 'date', 'Date', 'snippet', f(date, {}))
--
-- -- сниппет для создания сниппета
-- snp(ext.all, 'snp', 'command create snippet', 'snippet', {
--     t({'snp(\''}), i(1, 'trigger'), t({'\', \''}), i(2, 'opisanie'), t({'\', {', ''}),
--     t('\t'), i(3, {'body snippet'}),
--     t({'', '})'}),
-- })
--
--
-- -------------------------------------------------------------------------------
-- -- MARKDOWN snippets
-- -------------------------------------------------------------------------------
--
-- -- создание ссылки
-- snp(ext.md, "ln", "markdown_link", 'snippet', {
--     t('['), i(1),
--     t(']('), f(v, {}), t(')'),
--     i(0),
-- })
--
-- -- table
-- snp(ext.md, "tb", "create table", 'snippet', {
--     t('| '), i(1), t(' | '), i(2), t(' | '), i(3), t({' |', ''}),
--     t({'| :---: | :---: | :---: |', ''}),
--     t('| '), i(4), t(' | '), i(5), t(' | '), i(6), t({' |', ''}),
--     i(0),
-- })
--
-- -------------------------------------------------------------------------------
-- -- TEST snippets
-- -------------------------------------------------------------------------------
-- local function my_test(arg_parent, node_ref, user_args)
--     return arg_parent[1][1] .. user_args
-- end
--
-- snp(ext.md, 'test', 'description', 'snippet', {
--     i(1, 'text1'), i(2, {'text2', 'text3', ''}),
--     c(3, {
--         t({"choice1"}),
--         i(nil, 'choice2'),
--     }),
-- })
--
--
-- local recursion_table = function()
-- 	return sn(
-- 		nil,
-- 		c(1, {
-- 			-- Order is important, sn(...) first would cause infinite loop of expansion.
-- 			t(""),
-- 			sn(nil, { f(create_rows, {}, {}),
--                 d(1, recursion_table, {})
--             }),
-- 		})
-- 	)
-- end
--
-- -- test
-- -- local test_function = function(args, parent, user_args)
-- --     return

local recursion_list = function()
	return sn(
		nil,
		c(1, {
			t({""}),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, recursion_list, {}) }),
		})
	)
end

-- -- function create_table_structure (row_count, column_count)
-- --     local text_object = {t({'asdfa'})}
-- --     return text_object
-- -- end
--
--
-------------------------------------------------------------------------------
-- LATEX snippets
-------------------------------------------------------------------------------
-- document env
snp(ext.tex, {
    s({ trig = 'DOC', name = 'document env', snippetType = 'autosnippet' },
    {
        t({"\\begin{document}", ''}),
        i(1),
        t({"", "\\end{document}", ''}), i(0),
    })
})


-- -- verb||
-- -- snp(ext.tex, "VVS", 'verb', 'autosnippet', {
-- -- 	t({"\\vb|"}), f(v, {}), i(1),
-- -- 	t({"|"}), i(0),
-- -- })
--
-- -- verbatim env
-- -- snp(ext.tex, "VVV", 'verbatim environment', 'autosnippet', {
-- -- 	t({"\\begin{verbatim}", ""}),
-- --     f(v, {}), i(1),
-- -- 	t({"", "\\end{verbatim}", ''}), i(0),
-- -- })
--
-- -------------------------------------------------------------------------------
-- -- Listings
-- -------------------------------------------------------------------------------
snp(ext.tex, {
    s({ trig = 'VVS', name = 'lstinline command', snippetType = 'autosnippet' },
    {
        t({"\\lstinline{"}), d(1, v), i(2), t({"}"}), i(0),
    })
})

snp(ext.tex, {
    s({ trig = 'VVV', name = 'lstlisting environment', snippetType = 'autosnippet' },
    {
        t({"\\begin{lstlisting}[style="}), i(1, "defb"), t({']', ''}),
        d(2, v), i(3),
        t({"", "\\end{lstlisting}"}), i(0),
    })
})


-------------------------------------------------------------------------------
-- списки
-------------------------------------------------------------------------------
-- пронумерованный список
snp(ext.tex, {
    s({ trig = 'AAS', name = 'enumerate env', snippetType = 'autosnippet' },
    {
        t({ "\\begin{enumerate}", "\\item " }),
        d(1, v),
        d(2, recursion_list, {}),
        t({ "", "\\end{enumerate}" }),
    })
})

snp(ext.tex, {
    s({ trig = 'AAA', name = 'itemize env', snippetType = 'autosnippet' },
    {
        t({ "\\begin{itemize}", "\\item " }),
        d(1, v),
        d(2, recursion_list, {}),
        t({ "", "\\end{itemize}" }),
    })
})


-------------------------------------------------------------------------------
-- выделение текста
-------------------------------------------------------------------------------
snp(ext.tex, {s(
    {trig = ';ii', dscr = 'itshape text', snippetType = 'autosnippet'},
    fmta(
        [[\itt{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';tt', dscr = 'code text', snippetType = 'autosnippet'},
    fmta(
        [[\ct{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';bb', dscr = 'bold text', snippetType = 'autosnippet'},
    fmta(
        [[\bt{<>}]],
        {
            d(1, v),
        }
    )
)})

-------------------------------------------------------------------------------
-- секционирование
-------------------------------------------------------------------------------
snp(ext.tex, {s(
    {trig = 'SSS', dscr = 'chapter', snippetType = 'autosnippet'},
    fmta(
        [[\chapter{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'SSD', dscr = 'part', snippetType = 'autosnippet'},
    fmta(
        [[\part{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'SDD', dscr = 'section', snippetType = 'autosnippet'},
    fmta(
        [[\section{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'SDS', dscr = 'subsection', snippetType = 'autosnippet'},
    fmta(
        [[\subsection{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'DDD', dscr = 'subsubsection', snippetType = 'autosnippet'},
    fmta(
        [[\subsubsection{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'DDS', dscr = 'paragraph', snippetType = 'autosnippet'},
    fmta(
        [[\paragraph{<>}]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'DSD', dscr = 'subparagraph', snippetType = 'autosnippet'},
    fmta(
        [[\subparagraph{<>}]],
        {
            d(1, v),
        }
    )
)})

-- -- свободно еще DSS
--
-- snp(ext.tex, "ASS", "url link", 'snippet', {
--     t({'\\url{'}),
--     f(v, {}), i(1), t({'}'}), i(0),
-- })

snp(ext.tex, {s(
    {trig = 'ENV', dscr = 'default env', snippetType = 'autosnippet'},
    fmta(
        [[
            \begin{<>}
            <>
            \end{<>}
        ]],
        {
            i(1), d(2, v), rep(1)
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'ERE', dscr = 'varwidth env', snippetType = 'autosnippet'},
    fmta(
        [[
            \begin{varwidth}{<>}
            <>
            \end{varwidth}
        ]],
        {
            i(1), d(2, v)
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';ff', dscr = 'Block table command', snippetType = 'autosnippet'},
    fmta(
        [[\Block[<>]{<>}{<>}]],
        {
            i(1), i(2), d(3, v)
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';fd', dscr = 'Block table command', snippetType = 'autosnippet'},
    fmta(
        [[\toprule]],
        {
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';fs', dscr = 'Block table command', snippetType = 'autosnippet'},
    fmta(
        [[\midrule]],
        {
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';fa', dscr = 'Block table command', snippetType = 'autosnippet'},
    fmta(
        [[\bottomrule]],
        {
        }
    )
)})

snp(ext.tex, {s(
    {trig = ';fk', dscr = 'Row style table command', snippetType = 'autosnippet'},
    fmta(
        [[\Rowstyle[nb-rows=<>,rowcolor=<>]{<>}]],
        {
            i(1, '1'), i(2, 'tbgr'), i(3, '\\mfptsansn')
        }
    )
)})


-------------------------------------------------------------------------------
-- выравнивание текста
-------------------------------------------------------------------------------
snp(ext.tex, {s(
    {trig = 'ASA', dscr = 'center env', snippetType = 'autosnippet'},
    fmta(
        [[
            \begin{center}
            <>
            \end{center}
        ]],
        {
            d(1, v),
        }
    )
)})


-------------------------------------------------------------------------------
-- Mathematics LATEX
-------------------------------------------------------------------------------
snp(ext.tex, {s(
    {trig = 'FFF', dscr = 'math env', snippetType = 'autosnippet'},
    fmta(
        [[\(<>\)]],
        {
            d(1, v),
        }
    )
)})

snp(ext.tex, {s(
    {trig = 'FFD', dscr = 'displaymath env', snippetType = 'autosnippet'},
    fmta(
        [=[\[ <> \]]=],
        {
            d(1, v),
        }
    )
)})

-- -- окружение equation
-- snp(ext.tex, 'FDD', 'equation env', 'autosnippet', {
--     t({"\\begin{equation}", ""}),
--     f(v, {}), i(1),
--     t({"", "\\end{equation}"}), i(0)
-- })
--
-- -- окружение array
-- snp(ext.tex, 'DDF', 'array env', 'autosnippet', {
--     t({"\\begin{array}{"}), i(1), t({'}', ''}),
--     f(v, {}), i(2),
--     t({"", "\\end{array}"}), i(0)
-- })
--
-- -- окружение eqnarray*
-- snp(ext.tex, 'ERR', 'eqnarray* env', 'autosnippet', {
--     t({"\\begin{eqnarray*}", ''}),
--     f(v, {}), i(1),
--     t({"", "\\end{eqnarray*}"}), i(0)
-- })

snp(ext.tex, {s(
    {trig = 'FFR', dscr = 'frac', snippetType = 'autosnippet'},
    fmta(
        [[\frac{<>}{<>}]],
        {
            i(1), i(2)
        }
    )
)})
--
-- -- sqrt 2
-- snp(ext.tex, 'FDF', 'sqrt', 'autosnippet', {
--     t({'\\sqrt{'}), i(1), t({'}'}), i(0)
-- })
--
-- -- sqrt n
-- snp(ext.tex, 'DFD', 'sqrtN', 'autosnippet', {
--     t({'\\sqrt['}), i(1, 'n'), t({']{'}), i(2), t({'}'}), i(0)
-- })
--
-- -- vec
-- snp(ext.tex, 'DFF', 'vector', 'autosnippet', {
--     t({'\\vec{'}), i(1), t({'}'}), i(0)
-- })
--
-- -- окружение cases
-- snp(ext.tex, 'RRE', 'cases env', 'autosnippet', {
--     t({"\\begin{cases}{"}), i(1), t({'}', ''}),
--     f(v, {}), i(2),
--     t({"", "\\end{cases}"}), i(0)
-- })

snp(ext.tex, {s(
    {trig = 'REE', dscr = 'index command', snippetType = 'autosnippet'},
    fmta(
        [[ \<>_{<>}^{<>} ]],
        {
            i(1), i(2), i(3)
        }
    )
)})

snp(ext.tex, {s(
    { trig = ';cc', name = 'command \\_{}', snippetType = 'autosnippet' },
    fmta(
        [[\<>{<>}]],
        {i(1), d(2, v)}
    )
)})

snp(ext.tex, {s(
    { trig = ';qt', name = 'qta command', snippetType = 'autosnippet' },
    fmta(
        [[\qta{<>}]],
        {d(1, v)}
    )
)})

-- -- \command{}
-- snp(ext.tex, 'RRR', 'default command', 'autosnippet', {
--     t({'\\'}), i(1), t({"{"}), i(2), t({'}'}), i(0)
-- })
--
-- -- \{ \}
-- snp(ext.tex, 'EEE', 'bracket', 'autosnippet', {
--     t({'\\left('}), i(1), t({"\\right)"}), i(0)
-- })
--
-- -- \left( \right)
-- snp(ext.tex, 'ERE', 'bracket', 'autosnippet', {
--     t({'\\left('}), i(1), t({"\\right)"}), i(0)
-- })
--
-- -- -- up symbol
-- -- snp(ext.tex, 'DFF', 'up symbol', 'autosnippet', {
-- --     t({'\\stackrel{'}), i(1), t({'}{'}), i(2), t({'}'}), i(0)
-- -- })
-- --
-- -- -- underline
-- -- snp(ext.tex, 'DFF', 'underline', 'autosnippet', {
-- --     t({'\\underline{'}), i(1), t({'}'}), i(0)
-- -- })
-- --
-- -- -- overline
-- -- snp(ext.tex, 'DFF', 'overline', 'autosnippet', {
-- --     t({'\\overline{'}), i(1), t({'}'}), i(0)
-- -- })
--
-- -- -- underbrace
-- -- snp(ext.tex, 'DFF', 'underline', 'autosnippet', {
-- --     t({'\\underbrace{'}), i(1), t({'}'}), i(0)
-- -- })
--
-- -- -- overbrace
-- -- snp(ext.tex, 'DFF', 'overbrace', 'autosnippet', {
-- --     t({'\\overbrace{'}), i(1), t({'}'}), i(0)
-- -- })
--
-- -- -- under index
-- -- snp(ext.tex, '__', 'under index', 'autosnippet', {
-- --     t({'\\_{'}), i(1), t({'}'}), i(0)
-- -- })
--
-- -- -- over index
-- -- snp(ext.tex, '^', 'over index', 'autosnippet', {
-- --     t({'\\^{'}), i(1), t({'}'}), i(0)
-- -- })

local utils = require "nvim-treesitter-playground.utils"
local bufnr = vim.api.nvim_get_current_buf()
local row, col = unpack(vim.api.nvim_win_get_cursor(0))
local highlighter = require "vim.treesitter.highlighter"
local ts_utils = require "nvim-treesitter.ts_utils"
local parsers = require "nvim-treesitter.parsers"

-- фунцию определения математического окружения
-- local env_var = {}
-- env_var.math_env = function(_,_)
local myf = function(_,_)
    -- row = row - 1
    -- local results = utils.get_hl_groups_at_position(bufnr, row, col)
    -- local new = ts_utils.get_node_at_cursor(0)
    -- local group_hl = 'false'
    -- local m_table = {}
    -- local new = vim.treesitter.get_captures_at_cursor(bufnr)
    -- local results = vim.treesitter.get_captures_at_pos(bufnr, row, col)
    -- local group_hl = 'false'
    -- for i, hl in pairs(new) do
    -- -- for i, hl in pairs(new) do
    --     local results = hl.capture
    -- --     -- m_table[#m_table+1] = hl.capture
    -- --     -- if i  then
    -- --     --     return table.concat(results)
    -- --     -- end
    --     m, l = string.find(group_hl, "math")
    --     -- local result_find = string.sub(hl, m, l)
    --     if m ~= nil then
    --         group_hl = 'true'
    --         return group_hl
    --     end
    --     return results
    -- end
    -- m_table = table.concat(m_table)
    -- return m_table
    -- group_hl = results
    if tex_utils.in_mathzone == true then
        return 'true'
    else
        return 'false'
    end
end

snp(ext.tex, {s(
    { trig = 'TRT', name = 'alpha symbol', snippetType = 'autosnippet' },
    fmta(
        [[<>]], {
            i(1, 'RRR')
        }
    )
)})
snp(ext.tex, {s(
    { trig = ';al', name = 'alpha symbol', snippetType = 'autosnippet' },
    fmta(
        [[\alpha]], {}
    )
)})

snp(ext.tex, {s(
    { trig = ';be', name = 'beta symbol', snippetType = 'autosnippet' },
    fmta(
        [[\beta]], {}
    )
)})

snp(ext.tex, {s(
    { trig = ';ga', name = 'gamma symbol', snippetType = 'autosnippet' },
    fmta(
        [[\gamma]], {}
    )
)})

-- создание наполнения таблицы
local function create_table_structure(args, snip)
    local num_cell = 1
    local column_separator = ' & '
    local end_line = ' \\\\'
    local count_column = tonumber(snip.captures[1])
    local row_table = {}

    for i = 1, count_column do
        if i == count_column then
            row_table[#row_table+1] = num_cell
            row_table[#row_table+1] = end_line
            row_table = table.concat(row_table)
            return row_table
        else
            row_table[#row_table+1] = num_cell
            row_table[#row_table+1] = column_separator
            num_cell = num_cell + 1
        end
    end
    return row_table
end

-- создать преамбулу для таблицы
local get_preamble_table = function(_, snip)
    local count_row = tonumber(snip.captures[1])
    local indicator = 'c'
    local preamble = ''
    for i = 1, count_row do
        preamble = preamble .. indicator
    end
    return preamble
end


-------------------------------------------------------------------------------
-- table
-------------------------------------------------------------------------------
snp(ext.tex, {
    s({trig = '([%d])SSA', dscr = 'NiceTabular environment', snippetType = 'autosnippet',
        regTrig = true, wordTrig = false},
        fmta(
        [[
            \begin{table}[H]
            \centering\small \caption{<>} \label{<>}
            \begin{NiceTabular}{<>}
            \toprule
            \RowStyle[nb-rows=1,rowcolor=tbgr]{\mfptsansn}
            <>
            \midrule
            <>
            \bottomrule
            \end{NiceTabular}
            \end{table}
        ]],
        {
            i(1, 'Name table'), i(2, 'name ref'),
            f(get_preamble_table),
            f(create_table_structure),
            f(create_table_structure),
        }
      )
    )
})


-------------------------------------------------------------------------------
-- figure
-------------------------------------------------------------------------------
snp(ext.tex, {
    s({trig = 'RER', dscr = 'figure env', snippetType = 'autosnippet'},
        fmta(
            [[
            \begin{figure}[H]
            \centering \incfig{<>}
            \caption{<>} \label{<>}
            \end{figure}
            ]],
        {
            i(1, 'name_image'),
            i(2, 'name_figure'),
            i(3, 'label_figure'),
        })
    )
})
