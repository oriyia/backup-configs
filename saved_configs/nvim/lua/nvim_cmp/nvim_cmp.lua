local cmp = require'cmp'
local lspkind = require('lspkind')

cmp.setup({
    -- completion = {
    --     autocomplete = false,
    -- },

    -- для включения значков в вслпывающем меню
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            }),

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
              return vim_item
            end
        })
    },

    snippet = {
        -- Здесь обязательно указываем механизм фрагментов
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },


    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

    --     ["<Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_next_item()
    --         elseif luasnip.expand_or_jumpable() then
    --             luasnip.expand_or_jump()
    --         elseif has_words_before() then
    --             cmp.complete()
    --         else
    --             fallback()
    --         end
    --     end, { "i", "s" }),
    --
    --     ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --             cmp.select_prev_item()
    --         elseif luasnip.jumpable(-1) then
    --             luasnip.jump(-1)
    --         else
    --             fallback()
    --         end
    --     end, { "i", "s" }),
    }),

    -- настройка источников для nvim-cmp
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        {
            -- https://github.com/saadparwaiz1/cmp_luasnip
            name = 'luasnip',
            option = {
                -- use_show_condition = true,
                -- show_autosnippets = true,
            },
        },
        {
            name = 'buffer',
            option = {
            }
        },
        {
            name = 'path',
            option = {
            },
        },
    })
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = 'buffer' },
--     })
-- })

-- Завершения для /поиска на основе текущего буфера
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Дополнения для командного режима
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

