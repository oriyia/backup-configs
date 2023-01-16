return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- onedark
    use 'navarasu/onedark.nvim'
    -- простое комменитирование
    use 'numToStr/Comment.nvim'
    -- автоматические парные объекты
    -- use "windwp/nvim-autopairs" -- с xkbswitch перестал с ru раскладкой работать
    use 'jiangmiao/auto-pairs'
    -- выделение цветом цветового кода
    use 'norcalli/nvim-colorizer.lua'
    -- добавляет направляющие отступов
    use "lukas-reineke/indent-blankline.nvim"
    -- работа nvim через sudo
    use 'lambdalisue/suda.vim'
    -- иконки
    use 'nvim-tree/nvim-web-devicons'
    -- оценка времени запуска всего в vim
    use "dstein64/vim-startuptime"
    -- lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    -- xkb-switch
    use 'lyokha/vim-xkbswitch'
    -- vimtex
    use 'lervag/vimtex'
    --vim-surround
    use 'tpope/vim-surround'
    -- luasnip
    use 'L3MON4D3/LuaSnip'
    -- terminal
    use {
        "akinsho/toggleterm.nvim", tag = 'v2.*'
    }
    -- просмотр деревьев прямо в nvim
    use { "nvim-treesitter/playground"}
    -- ультра быстрые перемещения
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
    }

    -- подсказка для сопоставлений
    use { "folke/which-key.nvim", }

    -- расширение для telescope (подсказка для сниппетов)
    use {
        "benfowler/telescope-luasnip.nvim",
    }

    use {
        'lewis6991/gitsigns.nvim',
    }

    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    use {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'saadparwaiz1/cmp_luasnip',
    }
    -- значки в подсказке nvim-cmp
    use {
        'onsails/lspkind.nvim',
    }
    -- красивая диагностика lsp
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    -- красивое выравнивание
    use { "junegunn/vim-easy-align" }


   -- config = function()
   --    require('pretty-fold').setup()
   --    require('pretty-fold.preview').setup()
   -- end
    -- nvim-lsp-installer, nvim-lspconfig

end)
