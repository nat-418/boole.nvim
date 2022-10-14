local M = {}

local replace_map = {
    increment = {},
    decrement = {},
}

local generate_hashmaps = function(from, to)
    replace_map.increment[from] = to
    replace_map.decrement[to]   = from
end

-- Proper booleans
generate_hashmaps('true',  'false')
generate_hashmaps('false', 'true')
generate_hashmaps('yes',   'no')
generate_hashmaps('no',    'yes')
generate_hashmaps('on',    'off')
generate_hashmaps('off',   'on')

generate_hashmaps('True',  'False')
generate_hashmaps('False', 'True')
generate_hashmaps('Yes',   'No')
generate_hashmaps('No',    'Yes')
generate_hashmaps('On',    'Off')
generate_hashmaps('Off',   'On')

-- Canonical hours
generate_hashmaps('Matins',   'Lauds')
generate_hashmaps('Lauds',    'Prime')
generate_hashmaps('Prime',    'Terce')
generate_hashmaps('Terce',    'Sext')
generate_hashmaps('Sext',     'Nones')
generate_hashmaps('Nones',    'Vespers')
generate_hashmaps('Vespers',  'Compline')
generate_hashmaps('Compline', 'Vigil')
generate_hashmaps('Vigil',    'Matins')

-- Days of the week
generate_hashmaps('monday',    'tuesday')
generate_hashmaps('tuesday',   'wednesday')
generate_hashmaps('wednesday', 'thursday')
generate_hashmaps('thursday',  'friday')
generate_hashmaps('friday',    'saturday')
generate_hashmaps('saturday',  'sunday')
generate_hashmaps('sunday',    'monday')

generate_hashmaps('Monday',    'Tuesday')
generate_hashmaps('Tuesday',   'Wednesday')
generate_hashmaps('Wednesday', 'Thursday')
generate_hashmaps('Thursday',  'Friday')
generate_hashmaps('Friday',    'Saturday')
generate_hashmaps('Saturday',  'Sunday')
generate_hashmaps('Sunday',    'Monday')

generate_hashmaps('mon', 'tue')
generate_hashmaps('tue', 'wed')
generate_hashmaps('wed', 'thu')
generate_hashmaps('thu', 'fri')
generate_hashmaps('fri', 'sat')
generate_hashmaps('sat', 'sun')
generate_hashmaps('sun', 'mon')

generate_hashmaps('Mon', 'Tue')
generate_hashmaps('Tue', 'Wed')
generate_hashmaps('Wed', 'Thu')
generate_hashmaps('Thu', 'Fri')
generate_hashmaps('Fri', 'Sat')
generate_hashmaps('Sat', 'Sun')
generate_hashmaps('Sun', 'Mon')

-- Months of the year
generate_hashmaps('january',   'february')
generate_hashmaps('february',  'march')
generate_hashmaps('march',     'april')
generate_hashmaps('april',     'may')
generate_hashmaps('may',       'june')
generate_hashmaps('june',      'july')
generate_hashmaps('july',      'august')
generate_hashmaps('august',    'september')
generate_hashmaps('september', 'october')
generate_hashmaps('october',   'november')
generate_hashmaps('november',  'december')
generate_hashmaps('december',  'january')

generate_hashmaps('January',   'February')
generate_hashmaps('February',  'March')
generate_hashmaps('March',     'April')
generate_hashmaps('April',     'May')
generate_hashmaps('May',       'June')
generate_hashmaps('June',      'July')
generate_hashmaps('July',      'August')
generate_hashmaps('August',    'September')
generate_hashmaps('September', 'October')
generate_hashmaps('October',   'November')
generate_hashmaps('November',  'December')
generate_hashmaps('December',  'January')

-- Colors
generate_hashmaps('red',    'orange')
generate_hashmaps('orange', 'yellow')
generate_hashmaps('yellow', 'green')
generate_hashmaps('green',  'blue')
generate_hashmaps('blue',   'indigo')
generate_hashmaps('indigo', 'violet')
generate_hashmaps('violet', 'red')

generate_hashmaps('White',         'Snow')
generate_hashmaps('Snow',          'Ivory')
generate_hashmaps('Ivory',         'Linen')
generate_hashmaps('Linen',         'AntiqueWhite')
generate_hashmaps('AntiqueWhite',  'Beige')
generate_hashmaps('Beige',         'WhiteSmoke')
generate_hashmaps('WhiteSmoke',    'LavenderBlush')
generate_hashmaps('LavenderBlush', 'OldLace')
generate_hashmaps('OldLace',       'AliceBlue')
generate_hashmaps('AliceBlue',     'SeaShell')
generate_hashmaps('SeaShell',      'GhostWhite')
generate_hashmaps('GhostWhite',    'Honeydew')
generate_hashmaps('Honeydew',      'FloralWhite')
generate_hashmaps('FloralWhite',   'Azure')
generate_hashmaps('Azure',         'MintCream')
generate_hashmaps('MintCream',     'White')

generate_hashmaps('Black',          'DarkSlateGray')
generate_hashmaps('DarkSlateGray',  'DimGray')
generate_hashmaps('DimGray',        'SlateGray')
generate_hashmaps('SlateGray',      'Gray')
generate_hashmaps('Gray',           'LightSlateGray')
generate_hashmaps('LightSlateGray', 'DarkGray')
generate_hashmaps('Silver',         'LightGray')
generate_hashmaps('LightGray',      'Gainsboro')
generate_hashmaps('Gainsboro',      'Black')

generate_hashmaps('Pink',            'LightPink')
generate_hashmaps('LightPink',       'HotPink')
generate_hashmaps('HotPink',         'PaleVioletRed')
generate_hashmaps('PaleVioletRed',   'DeepPink')
generate_hashmaps('DeepPink',        'MediumVioletRed')
generate_hashmaps('MediumVioletRed', 'LightPink')
generate_hashmaps('LightPink',       'Pink')

generate_hashmaps('Indigo',          'Purple')
generate_hashmaps('Purple',          'DarkMagenta')
generate_hashmaps('DarkMagenta',     'DarkViolet')
generate_hashmaps('DarkViolet',      'DarkSlateBlue')
generate_hashmaps('DarkSlateBlue',   'BlueViolet')
generate_hashmaps('BlueViolet',      'DarkOrchid')
generate_hashmaps('DarkOrchid',      'Fuchsia')
generate_hashmaps('Fuchsia',         'Magenta')
generate_hashmaps('Magenta',         'SlateBlue')
generate_hashmaps('SlateBlue',       'MediumSlateBlue')
generate_hashmaps('MediumSlateBlue', 'MediumOrchid')
generate_hashmaps('MediumOrchid',    'MediumPurple')
generate_hashmaps('MediumPurple',    'Orchid')
generate_hashmaps('Orchid',          'Violet')
generate_hashmaps('Violet',          'Plum')
generate_hashmaps('Plum',            'Thistle')
generate_hashmaps('Thistle',         'Lavender')
generate_hashmaps('Lavender',        'Indigo')

generate_hashmaps('DarkRed',     'Red')
generate_hashmaps('Red',         'Firebrick')
generate_hashmaps('Firebrick',   'Crimson')
generate_hashmaps('Crimson',     'IndianRed')
generate_hashmaps('IndianRed',   'LightCoral')
generate_hashmaps('LightCoral',  'Salmon')
generate_hashmaps('Salmon',      'DarkSalmon')
generate_hashmaps('DarkSalmon',  'LightSalmon')
generate_hashmaps('LightSalmon', 'DarkRed')

generate_hashmaps('OrangeRed',  'Tomato')
generate_hashmaps('Tomato',     'DarkOrange')
generate_hashmaps('DarkOrange', 'Coral')
generate_hashmaps('Coral',      'Orange')
generate_hashmaps('Orange',     'OrangeRed')

generate_hashmaps('DarkKhaki',            'Gold')
generate_hashmaps('Gold',                 'Khaki')
generate_hashmaps('Khaki',                'PeachPuff')
generate_hashmaps('PeachPuff',            'Yellow')
generate_hashmaps('Yellow',               'PaleGoldenRod')
generate_hashmaps('PaleGoldenRod',        'Moccasin')
generate_hashmaps('Moccasin',             'PapayaWhip')
generate_hashmaps('PapayaWhip',           'LightGoldenRodYellow')
generate_hashmaps('LightGoldenRodYellow', 'LemonChiffon')
generate_hashmaps('LemonChiffon',         'LightYellow')
generate_hashmaps('LightYellow',          'DarkKhaki')

generate_hashmaps('MidnightBlue',   'Navy')
generate_hashmaps('Navy',           'DarkBlue')
generate_hashmaps('DarkBlue',       'MediumBlue')
generate_hashmaps('MediumBlue',     'Blue')
generate_hashmaps('Blue',           'RoyalBlue')
generate_hashmaps('RoyalBlue',      'SteelBlue')
generate_hashmaps('SteelBlue',      'DodgerBlue')
generate_hashmaps('DodgerBlue',     'DeepSkyBlue')
generate_hashmaps('DeepSkyBlue',    'CornflowerBlue')
generate_hashmaps('CornflowerBlue', 'SkyBlue')
generate_hashmaps('SkyBlue',        'LightSkyBlue')
generate_hashmaps('LightSkyBlue',   'LightSteelBlue')
generate_hashmaps('LightSteelBlue', 'LightBlue')
generate_hashmaps('LightBlue',      'PowderBlue')
generate_hashmaps('PowderBlue',     'MidnightBlue')

generate_hashmaps('Maroon',         'Brown')
generate_hashmaps('Brown',          'SaddleBrown')
generate_hashmaps('SaddleBrown',    'Sienna')
generate_hashmaps('Sienna',         'Chocolate')
generate_hashmaps('Chocolate',      'DarkGoldenRod')
generate_hashmaps('DarkGoldenRod',  'Peru')
generate_hashmaps('Peru',           'RosyBrown')
generate_hashmaps('RosyBrown',      'GoldenRod')
generate_hashmaps('GoldenRod',      'SandyBrown')
generate_hashmaps('SandyBrown',     'Tan')
generate_hashmaps('Tan',            'BurlyWood')
generate_hashmaps('BurlyWood',      'Wheat')
generate_hashmaps('Wheat',          'NavajoWhite')
generate_hashmaps('NavajoWhite',    'Bisque')
generate_hashmaps('Bisque',         'BlanchedAlmond')
generate_hashmaps('BlanchedAlmond', 'Cornsilk')
generate_hashmaps('Cornsilk',       'Maroon')

generate_hashmaps('Teal',            'DarkCyan')
generate_hashmaps('DarkCyan',        'LightSeaGreen')
generate_hashmaps('LightSeaGreen',   'CadetBlue')
generate_hashmaps('CadetBlue',       'DarkTurquoise')
generate_hashmaps('DarkTurquoise',   'MediumTurquoise')
generate_hashmaps('MediumTurquoise', 'Turquoise')
generate_hashmaps('Turquoise',       'Aqua')
generate_hashmaps('Aqua',            'Cyan')
generate_hashmaps('Cyan',            'Aquamarine')
generate_hashmaps('Aquamarine',      'PaleTurquoise')
generate_hashmaps('PaleTurquoise',   'LightCyan')
generate_hashmaps('LightCyan',       'Teal')

generate_hashmaps('DarkGreen',         'Green')
generate_hashmaps('Green',             'DarkOliveGreen')
generate_hashmaps('DarkOliveGreen',    'ForestGreen')
generate_hashmaps('ForestGreen',       'SeaGreen')
generate_hashmaps('SeaGreen',          'Olive')
generate_hashmaps('Olive',             'OliveDrab')
generate_hashmaps('OliveDrab',         'MediumSeaGreen')
generate_hashmaps('MediumSeaGreen',    'LimeGreen')
generate_hashmaps('LimeGreen',         'Lime')
generate_hashmaps('Lime',              'SpringGreen')
generate_hashmaps('SpringGreen',       'MediumSpringGreen')
generate_hashmaps('MediumSpringGreen', 'DarkSeaGreen')
generate_hashmaps('DarkSeaGreen',      'MediumAquamarine')
generate_hashmaps('MediumAquamarine',  'YellowGreen')
generate_hashmaps('YellowGreen',       'LawnGreen')
generate_hashmaps('LawnGreen',         'Chartreuse')
generate_hashmaps('Chartreuse',        'LightGreen')
generate_hashmaps('LightGreen',        'GreenYellow')
generate_hashmaps('GreenYellow',       'PaleGreen')
generate_hashmaps('PaleGreen',         'DarkGreen')

-- Number + letter 'words'
local letters = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
  'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
  'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
}

for _, letter in ipairs(letters) do
  generate_hashmaps(letter .. 1, letter .. 2)
  generate_hashmaps(letter .. 2, letter .. 3)
  generate_hashmaps(letter .. 3, letter .. 4)
  generate_hashmaps(letter .. 4, letter .. 5)
  generate_hashmaps(letter .. 5, letter .. 6)
  generate_hashmaps(letter .. 6, letter .. 7)
  generate_hashmaps(letter .. 7, letter .. 8)
  generate_hashmaps(letter .. 8, letter .. 9)
  generate_hashmaps(letter .. 9, letter .. 0)
  generate_hashmaps(letter .. 0, letter .. 1)
end

M.run = function(direction)
    local under_cursor = vim.fn.expand('<cword>')

    print(under_cursor)

    local match = direction == 'decrement'
                  and replace_map.decrement[under_cursor]
                  or replace_map.increment[under_cursor]

    if match ~= nil then
        return vim.cmd(':normal ciw' .. match)
    end

    -- <C-a> and <C-x> compatability
    if direction == 'increment' then
        if type(tonumber(under_cursor)) == 'number' then
            return vim.cmd(':normal!')
        end
    end

    if direction == 'decrement' then
        if type(tonumber(under_cursor)) == 'number' then
            return vim.cmd(':normal!')
        end
    end

    return 0
end

-- Logical operators
generate_hashmaps('and', 'or')
generate_hashmaps('&&',  '||')
generate_hashmaps('==',  '!=')

M.setup = function(options)
    vim.api.nvim_create_user_command(
        'Boole',
        function(args) M.run(args.args) end,
        {
          nargs = 1,
          complete = function() return { 'increment', 'decrement' } end
        }
    )

    if options == nil then return 1 end

    if options.pair_additions ~= nil then
        for key,val in pairs(options.pair_additions) do
            generate_hashmaps(key, val)
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

    return 1
end

return M
