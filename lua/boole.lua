local M = {}

local replace_map = {
  increment = {},
  decrement = {},
}

local generate = function(loop_list, case_insensitive)
  for i = 1, #loop_list do
    local current = loop_list[i]
    local next    = loop_list[i + 1] or loop_list[1]

    replace_map.increment[current] = next
    replace_map.decrement[next]    = current

    if case_insensitive then
      local capitalized_current = string.gsub(current, "^%l", string.upper)
      local capitalized_next    = string.gsub(next,    "^%l", string.upper)
      local all_caps_current    = string.upper(current)
      local all_caps_next       = string.upper(next)

      replace_map.increment[capitalized_current] = capitalized_next
      replace_map.decrement[capitalized_next]    = capitalized_current
      replace_map.increment[all_caps_current]    = all_caps_next
      replace_map.decrement[all_caps_next]       = all_caps_current
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

-- Booleans
generate({'true', 'false'}, true)
generate({'yes',  'no' },   true)
generate({'on',   'off' },  true)

-- Canonical hours
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

-- Days of the week
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

-- Months of the year
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

-- Colors
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

M.run = function(direction)
  local start_position = vim.api.nvim_win_get_cursor(0)

  local function tryMatch(last_position)
    local line             = vim.api.nvim_get_current_line()
    local cword            = vim.fn.expand('<cword>')
    local current_position = vim.api.nvim_win_get_cursor(0)
    local last_column      = last_position[2]
    local current_column   = current_position[2]

    if cword:sub(1, 1) ~= line:sub(current_column, current_column) then
      vim.cmd('normal! l')
      return tryMatch(current_position)
    end

    if last_column > current_column then
      vim.api.nvim_win_set_cursor(0, start_position)
      return false
    end

    if current_column == vim.fn.strlen(line) then return false end

    if cword:sub(1, 1) ~= line:sub(current_column, current_column) then
      vim.cmd('normal! l')
      return tryMatch(current_position)
    end

    local match = direction == 'decrement'
          and replace_map.decrement[cword]
          or  replace_map.increment[cword]

    if match then
      vim.cmd('normal! ciw' .. match)
      vim.cmd('normal! b')
      return true
    else
      vim.cmd('normal! w')
      return tryMatch(current_position)
    end
  end

  if not tryMatch(start_position) then
    -- Original <C-a> and <C-x> functionality
    if vim.v.count ~= nil and vim.v.count > 0 then
        if direction == 'increment' then
            return vim.cmd('normal!' .. vim.v.count .. '')
        end
        if direction == 'decrement' then
            return vim.cmd('normal!' .. vim.v.count .. '')
        end
    else
        if direction == 'increment' then return vim.cmd('normal!' .. '') end
        if direction == 'decrement' then return vim.cmd('normal!' .. '') end
    end
  end
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
