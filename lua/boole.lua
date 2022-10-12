local M = {}

M.run = function(direction)
  local under_cursor = vim.fn.expand('<cword>')

  local change_word = function(word1, word2)
    local match       = word1
    local replacement = word2

    if direction == 'decrement' then
      match       = word2
      replacement = word1
    end

    if under_cursor == match then
      return vim.cmd(':normal ciw' .. replacement)
    end
  end

  -- Proper booleans
  change_word('true',  'false')
  change_word('false', 'true')
  change_word('yes',   'no')
  change_word('no',    'yes')
  change_word('on',    'off')
  change_word('off',   'on')

  -- Days of the week
  change_word('monday',    'tuesday')
  change_word('tuesday',   'wednesday')
  change_word('wednesday', 'thursday')
  change_word('thursday',  'friday')
  change_word('friday',    'saturday')
  change_word('saturday',  'sunday')
  change_word('sunday',    'monday')

  change_word('Monday',    'Tuesday')
  change_word('Tuesday',   'Wednesday')
  change_word('Wednesday', 'Thursday')
  change_word('Thursday',  'Friday')
  change_word('Friday',    'Saturday')
  change_word('Saturday',  'Sunday')
  change_word('Sunday',    'Monday')

  change_word('mon', 'tue')
  change_word('tue', 'wed')
  change_word('wed', 'thu')
  change_word('thu', 'fri')
  change_word('fri', 'sat')
  change_word('sat', 'sun')
  change_word('sun', 'mon')

  change_word('Mon', 'Tue')
  change_word('Tue', 'Wed')
  change_word('Wed', 'Thu')
  change_word('Thu', 'Fri')
  change_word('Fri', 'Sat')
  change_word('Sat', 'Sun')
  change_word('Sun', 'Mon')

  -- Months of the year
  change_word('january',   'february')
  change_word('february',  'march')
  change_word('march',     'april')
  change_word('april',     'may')
  change_word('may',       'june')
  change_word('june',      'july')
  change_word('july',      'august')
  change_word('august',    'september')
  change_word('september', 'october')
  change_word('october',   'november')
  change_word('november',  'december')
  change_word('december',  'january')

  change_word('January',   'February')
  change_word('February',  'March')
  change_word('March',     'April')
  change_word('April',     'May')
  change_word('May',       'June')
  change_word('June',      'July')
  change_word('July',      'August')
  change_word('August',    'September')
  change_word('September', 'October')
  change_word('October',   'November')
  change_word('November',  'December')
  change_word('December',  'January')

  -- Colors
  change_word('red',    'orange')
  change_word('orange', 'yellow')
  change_word('yellow', 'green')
  change_word('green',  'blue')
  change_word('blue',   'indigo')
  change_word('indigo', 'violet')
  change_word('violet', 'red')

  change_word('Red',    'Orange')
  change_word('Orange', 'Yellow')
  change_word('Yellow', 'Green')
  change_word('Green',  'Blue')
  change_word('Blue',   'Indigo')
  change_word('Indigo', 'Violet')
  change_word('Violet', 'Red')

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
    {nargs = 1, complete = function() return {'increment', 'decrement'} end}
  )

  if options == nil then return 1 end

  if options.mappings.increment ~= nil then
    vim.keymap.set(
      {'n', 'v'},
      options.mappings.increment,
      '<Cmd>Boole increment<CR>'
    )
  end

  if options.mappings.decrement ~= nil then
    vim.keymap.set(
      {'n', 'v'},
      options.mappings.decrement,
      '<Cmd>Boole decrement<CR>'
    )
  end

  return 1
end

return M

