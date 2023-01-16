local pallete = {
    light = {
        fg1 = '#767676', -- 243
        bg1 = '#ffffff', -- 15
        light_grey = '#eeeeee',
        light_grey2 = '#c6c6c6',
        light_grey3 = '#E4E4E4',
        grey = '#dadada',
        grey2 = '#b2b2b2',
        grey3 = '#a8a8a8',
        dark_grey = '#363A49',
        blue = '#5fafff', -- 33
        yellow = '#ffaf00', -- 214
        light_yellow = '#FFD787',
        orange = '#FF5F00', -- 202
        red = '#FF5F87', -- 204
        green = '#5FAF5F', -- 71
        white = '#ffffff', -- 15
        -- cyan =  '#00afff', -- 81
        -- cyan =  '#5fd7ff', -- 81
        -- cyan =  '#87d7ff', -- 81
        cyan = '#00d7ff', -- 81
        purple = '#875FFF', -- 99
        pink = '#FF5FAF',
        light_pink = '#D787D7',
        cornflower = '#87AFD7',
    },
    dark = {
        grey = '#78849E',
        dark_grey = '#363A49',
        light_grey = '#AAB7D5',
        blue = '#6E8EFF',
        yellow = '#E4945B',
        orange = '#F57842',
        red = '#ed5b5b',
        green = '#89BC81',
        white = '#aab7d5',
        cyan =  '#4ED1D1',
        purple = '#A981FF',
    },
}

local color_option = pallete.light

return {
	general = {
        bg = color_option.bg1,
        fg = color_option.fg1,
        blue = color_option.blue,
        cornflower = color_option.cornflower,
        yellow = color_option.yellow,
        light_yellow = color_option.light_yellow,
        orange = color_option.orange,
        red = color_option.red,
        green = color_option.green,
        white = color_option.white,
        cyan =  color_option.cyan,
        purple = color_option.purple,
        pink = color_option.pink,
        light_pink = color_option.light_pink,
        grey = color_option.grey,
        grey2 = color_option.grey2,
        grey3 = color_option.grey3,
        light_grey = color_option.light_grey,
        light_grey2 = color_option.light_grey2,
        light_grey3 = color_option.light_grey3,
	},
    icons = {
        blue = color_option.blue,
        yellow = color_option.yellow,
        orange = color_option.orange,
        red = color_option.red,
        green = color_option.green,
        white = color_option.white,
        cyan =  color_option.cyan,
        purple = color_option.purple,
        grey = color_option.grey,
    },
}
-- local color_option = pallete.light
--
-- return {
-- 	general = {
--         bg = color_option.dark_grey,
--         fg = color_option.light_grey,
--         blue = '#6E8EFF',
--         yellow = '#E4945B',
--         orange = '#F57842',
--         red = '#ED5B5B',
--         green = '#89BC81',
--         white = '#aab7d5',
--         cyan =  '#4ED1D1',
--         purple = '#A981FF',
--         grey = '#78849E',
-- 	},
--     icons = {
--         blue = color_option.blue,
--         yellow = color_option.yellow,
--         orange = color_option.orange,
--         red = color_option.red,
--         green = color_option.green,
--         white = color_option.white,
--         cyan =  color_option.cyan,
--         purple = color_option.purple,
--         grey = color_option.grey,
--     },
-- }
