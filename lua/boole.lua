local M = {}

local replace_map = {
  increment = {},
  decrement = {},
}

M.generate = function(loop_list, allow_caps)
  for i = 1, #loop_list do
    local current = loop_list[i]
    local next    = loop_list[i + 1] or loop_list[1]

    replace_map.increment[current] = next
    replace_map.decrement[next]    = current

    if allow_caps then
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
    M.generate(
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
M.generate({'true',    'false'},    true)
M.generate({'yes',     'no'},       true)
M.generate({'on',      'off'},      true)
M.generate({'enable',  'disable'},  true)
M.generate({'enabled', 'disabled'}, true)

-- Canonical hours
M.generate(
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
M.generate(
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
M.generate(
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
M.generate(
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
M.generate(
    {
        'red',
        'orange',
        'yellow',
        'green',
        'blue',
        'indigo',
        'violet'
    })

M.generate(
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

M.generate(
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

M.generate(
    {
        'Pink',
        'LightPink',
        'HotPink',
        'PaleVioletRed',
        'DeepPink',
        'MediumVioletRed',
    }
)

M.generate(
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

M.generate(
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

M.generate(
    {
        'OrangeRed',
        'Tomato',
        'DarkOrange',
        'Coral',
        'Orange'
    }
)

M.generate(
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

M.generate(
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

M.generate(
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

M.generate(
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

M.generate(
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

  -- Tail-recursive function to match and replace.
  local function tryMatch(last_position)
    local line             = vim.api.nvim_get_current_line()
    local cword            = vim.fn.expand('<cword>')
    local current_position = vim.api.nvim_win_get_cursor(0)
    local current_column   = current_position[2]

    -- C-a and C-x already handle numbers, no need to try and
    -- match them to out added values.
    if tonumber(cword) ~= nil then
      return false
    end

    -- Limit matches to the original line.
    if last_position[1] < current_position[1] then
      vim.api.nvim_win_set_cursor(0, start_position)
      vim.cmd('normal! wb')
      return false
    end

    -- If current is space go next word
    if(line:sub(current_column + 1, current_column + 1)==" ")then
        vim.cmd('normal! w')
        return tryMatch(current_position)
    end
    -- Do we have a match?
    local match = direction == 'decrement'
          and replace_map.decrement[cword]
          or  replace_map.increment[cword]

    if match then
      -- Are we at the end of the line? If so, jump back.
      -- Jump back with next recursion.
      if (current_column + 1) == vim.fn.strlen(line) then
        --return vim.cmd('normal! b')
        vim.cmd('normal! b')
        return tryMatch(current_position)
      -- Are we on the first character of the word? If not, move there.
      elseif cword:sub(1, 1) ~= line:sub(current_column + 1, current_column + 1) then
        --vim.cmd('normal! l')
        vim.cmd('normal! b')
        return tryMatch(current_position)
      end
      -- Replace the word and put the cursor on the beginning of replacement.
      vim.cmd('normal! ciw' .. match)
      vim.cmd('normal! b')
      return true
    else
      -- Are we at the end of the line? If so, give up.
      if (current_column + 1) == vim.fn.strlen(line) then
        vim.api.nvim_win_set_cursor(0, start_position)
        return false
      end
      -- Try the next word to see if it matches.
      vim.cmd('normal! w')
      return tryMatch(current_position)
    end
  end

  -- Fallback to original <C-a> and <C-x> functions for numbers.
  if not tryMatch(start_position) then
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

    if options.allow_caps_additions ~= nil then
       for _, val in pairs(options.allow_caps_additions) do
           M.generate(val, true)
       end
    end

    if options.additions ~= nil then
        for _, val in pairs(options.additions) do
            M.generate(val)
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
