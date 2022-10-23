local utils = require('boole.utils')

local M = {}

local replace_map = {
    increment = {},
    decrement = {},
}

local generate = function(loop_list, capitalize)
    local do_capitalize = capitalize or false
    for i = 1, #loop_list do
        local current = loop_list[i]
        local next = loop_list[i + 1] or loop_list[1]

        replace_map.increment[current] = next
        replace_map.decrement[next] = current

        if do_capitalize then
            local capitalized_current = utils.capitalize(current)
            local capitalized_next = utils.capitalize(next)

            replace_map.increment[capitalized_current] = capitalized_next
            replace_map.decrement[capitalized_next] = capitalized_current
        end
    end
end

local letters = {
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
}

for _, letter in ipairs(letters) do
    generate(
        {
            letter .. 0,
            letter .. 1,
            letter .. 2,
            letter .. 3,
            letter .. 4,
            letter .. 5,
            letter .. 6,
            letter .. 7,
            letter .. 8,
            letter .. 9
        },
        true
    )
end

-- Booleans {{{
generate({ 'true', 'false' }, true)
generate({ 'yes', 'no' }, true)
generate({ 'on', 'off' }, true)
-- }}}

-- Canonical hours {{{
generate(
    {
        'Matins',
        'Lauds',
        'Prime',
        'Terce',
        'Sext',
        'Nones',
        'Vespers',
        'Compline',
        'Vigil'
    }
)
-- }}}

-- Days of the week {{{
generate(
    {
        'monday',
        'tuesday',
        'wednesday',
        'thursday',
        'friday',
        'saturday',
        'sunday'
    },
    true
)
generate(
    {
        'mon',
        'tue',
        'wed',
        'thu',
        'fri',
        'sat',
        'sun'
    },
    true
)
-- }}}

-- Months of the year {{{
generate(
    {
        'january',
        'february',
        'march',
        'april',
        'may',
        'june',
        'july',
        'august',
        'september',
        'october',
        'november',
        'december'
    },
    true
)
-- }}}

-- Colors {{{
generate(
    {
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'indigo',
        'violet'
    })

generate(
    {
        'White',
        'Snow',
        'Ivory',
        'Linen',
        'AntiqueWhite',
        'Beige',
        'WhiteSmoke',
        'LavenderBlush',
        'OldLace',
        'AliceBlue',
        'SeaShell',
        'GhostWhite',
        'Honeydew',
        'FloralWhite',
        'Azure',
        'MintCream'
    }
)

generate(
    {
        'Black',
        'DarkSlateGray',
        'DimGray',
        'SlateGray',
        'Gray',
        'LightSlateGray',
        'Silver',
        'LightGray',
        'Gainsboro'
    }
)

generate(
    {
        'Pink',
        'LightPink',
        'HotPink',
        'PaleVioletRed',
        'DeepPink',
        'MediumVioletRed',
    }
)

generate(
    {
        'Indigo',
        'Purple',
        'DarkMagenta',
        'DarkViolet',
        'DarkSlateBlue',
        'BlueViolet',
        'DarkOrchid',
        'Fuchsia',
        'Magenta',
        'SlateBlue',
        'MediumSlateBlue',
        'MediumOrchid',
        'MediumPurple',
        'Orchid',
        'Violet',
        'Plum',
        'Thistle',
        'Lavender'
    }
)

generate(
    {
        'DarkRed',
        'Red',
        'Firebrick',
        'Crimson',
        'IndianRed',
        'LightCoral',
        'Salmon',
        'DarkSalmon',
        'LightSalmon'
    }
)

generate(
    {
        'OrangeRed',
        'Tomato',
        'DarkOrange',
        'Coral',
        'Orange'
    }
)

generate(
    {
        'DarkKhaki',
        'Gold',
        'Khaki',
        'PeachPuff',
        'Yellow',
        'PaleGoldenRod',
        'Moccasin',
        'PapayaWhip',
        'LightGoldenRodYellow',
        'LemonChiffon',
        'LightYellow'
    }
)

generate(
    {
        'MidnightBlue',
        'Navy',
        'DarkBlue',
        'MediumBlue',
        'Blue',
        'RoyalBlue',
        'SteelBlue',
        'DodgerBlue',
        'DeepSkyBlue',
        'CornflowerBlue',
        'SkyBlue',
        'LightSkyBlue',
        'LightSteelBlue',
        'LightBlue',
        'PowderBlue',
    }
)

generate(
    {
        'Maroon',
        'Brown',
        'SaddleBrown',
        'Sienna',
        'Chocolate',
        'DarkGoldenRod',
        'Peru',
        'RosyBrown',
        'GoldenRod',
        'SandyBrown',
        'Tan',
        'BurlyWood',
        'Wheat',
        'NavajoWhite',
        'Bisque',
        'BlanchedAlmond',
        'Cornsilk',
    }
)

generate(
    {
        'Teal',
        'DarkCyan',
        'LightSeaGreen',
        'CadetBlue',
        'DarkTurquoise',
        'MediumTurquoise',
        'Turquoise',
        'Aqua',
        'Cyan',
        'Aquamarine',
        'PaleTurquoise',
        'LightCyan',
    }
)

generate(
    {
        'DarkGreen',
        'Green',
        'DarkOliveGreen',
        'ForestGreen',
        'SeaGreen',
        'Olive',
        'OliveDrab',
        'MediumSeaGreen',
        'LimeGreen',
        'Lime',
        'SpringGreen',
        'MediumSpringGreen',
        'DarkSeaGreen',
        'MediumAquamarine',
        'YellowGreen',
        'LawnGreen',
        'Chartreuse',
        'LightGreen',
        'GreenYellow',
        'PaleGreen',
    }
)
-- }}}

M.run = function(direction)
    local under_cursor = vim.fn.expand('<cword>')

    local match = direction == 'decrement'
        and replace_map.decrement[under_cursor]
        or replace_map.increment[under_cursor]

    if match ~= nil then return vim.cmd('normal ciw' .. match) end

    -- <C-a> and <C-x> compatability
    if direction == 'increment' then return vim.cmd('normal!'..vim.v.count..'') end
    if direction == 'decrement' then return vim.cmd('normal!'..vim.v.count..'') end

    vim.api.nvim_cmd()
    return false
end

M.setup = function(options)
    vim.api.nvim_create_user_command(
        'Boole',
        function(args) M.run(args.args) end,
        {
            nargs = 1,
            complete = function() return { 'increment', 'decrement' } end
        }
    )

    if options == nil then return false end

    if options.additions ~= nil then
        for _, val in pairs(options.additions) do
            generate(val)
        end
    end

    if options.mappings.increment ~= nil then
        vim.keymap.set(
            { 'n', 'v' },
            options.mappings.increment,
            '<Cmd>Boole increment<CR>'
        )
    end

    if options.mappings.decrement ~= nil then
        vim.keymap.set(
            { 'n', 'v' },
            options.mappings.decrement,
            '<Cmd>Boole decrement<CR>'
        )
    end

    return true
end

return M
