local M = {}

M.replace_map = {
    increment = {},
    decrement = {},
}

local generate_hashmaps = function(from, to)
    M.replace_map.increment[from] = to
    M.replace_map.decrement[to] = from
end

-- Proper booleans
generate_hashmaps('true', 'false')
generate_hashmaps('false', 'true')
generate_hashmaps('yes', 'no')
generate_hashmaps('no', 'yes')
generate_hashmaps('on', 'off')
generate_hashmaps('off', 'on')

-- Days of the week
generate_hashmaps('monday', 'tuesday')
generate_hashmaps('tuesday', 'wednesday')
generate_hashmaps('wednesday', 'thursday')
generate_hashmaps('thursday', 'friday')
generate_hashmaps('friday', 'saturday')
generate_hashmaps('saturday', 'sunday')
generate_hashmaps('sunday', 'monday')

generate_hashmaps('Monday', 'Tuesday')
generate_hashmaps('Tuesday', 'Wednesday')
generate_hashmaps('Wednesday', 'Thursday')
generate_hashmaps('Thursday', 'Friday')
generate_hashmaps('Friday', 'Saturday')
generate_hashmaps('Saturday', 'Sunday')
generate_hashmaps('Sunday', 'Monday')

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
generate_hashmaps('january', 'february')
generate_hashmaps('february', 'march')
generate_hashmaps('march', 'april')
generate_hashmaps('april', 'may')
generate_hashmaps('may', 'june')
generate_hashmaps('june', 'july')
generate_hashmaps('july', 'august')
generate_hashmaps('august', 'september')
generate_hashmaps('september', 'october')
generate_hashmaps('october', 'november')
generate_hashmaps('november', 'december')
generate_hashmaps('december', 'january')

generate_hashmaps('January', 'February')
generate_hashmaps('February', 'March')
generate_hashmaps('March', 'April')
generate_hashmaps('April', 'May')
generate_hashmaps('May', 'June')
generate_hashmaps('June', 'July')
generate_hashmaps('July', 'August')
generate_hashmaps('August', 'September')
generate_hashmaps('September', 'October')
generate_hashmaps('October', 'November')
generate_hashmaps('November', 'December')
generate_hashmaps('December', 'January')

-- Colors
generate_hashmaps('red', 'orange')
generate_hashmaps('orange', 'yellow')
generate_hashmaps('yellow', 'green')
generate_hashmaps('green', 'blue')
generate_hashmaps('blue', 'indigo')
generate_hashmaps('indigo', 'violet')
generate_hashmaps('violet', 'red')

generate_hashmaps('Red', 'Orange')
generate_hashmaps('Orange', 'Yellow')
generate_hashmaps('Yellow', 'Green')
generate_hashmaps('Green', 'Blue')
generate_hashmaps('Blue', 'Indigo')
generate_hashmaps('Indigo', 'Violet')
generate_hashmaps('Violet', 'Red')

M.run = function(direction)
    local under_cursor = vim.fn.expand('<cword>')

    local match = direction == 'decrement' and M.replace_map.decrement[under_cursor] or
        M.replace_map.increment[under_cursor]

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

M.setup = function(options)
    vim.api.nvim_create_user_command(
        'Boole',
        function(args) M.run(args.args) end,
        { nargs = 1, complete = function() return { 'increment', 'decrement' } end }
    )

    if options == nil then return 1 end

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
