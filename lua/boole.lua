local M = {}

M.run = function(direction)
  local under_cursor = vim.fn.expand('<cword>')

  local change_word = function(match, replacement)
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
  if direction == 'increment' then
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
  end

  if direction == 'decrement' then
    change_word('monday',    'sunday')
    change_word('tuesday',   'monday')
    change_word('wednesday', 'tuesday')
    change_word('thursday',  'wednesday')
    change_word('friday',    'thursday')
    change_word('saturday',  'friday')
    change_word('sunday',    'saturday')

    change_word('Monday',    'Sunday')
    change_word('Tuesday',   'Monday')
    change_word('Wednesday', 'Tuesday')
    change_word('Thursday',  'Wednesday')
    change_word('Friday',    'Thursday')
    change_word('Saturday',  'Friday')
    change_word('Sunday',    'Saturday')

    change_word('mon', 'sun')
    change_word('tue', 'mon')
    change_word('wed', 'tue')
    change_word('thu', 'wed')
    change_word('fri', 'thu')
    change_word('sat', 'fri')
    change_word('sun', 'sat')

    change_word('Mon', 'Sun')
    change_word('Tue', 'Mon')
    change_word('Wed', 'Tue')
    change_word('Thu', 'Wed')
    change_word('Fri', 'Thu')
    change_word('Sat', 'Fri')
    change_word('Sun', 'Sat')
  end

  -- Months of the year
  if direction == 'increment' then
    change_word('january',   'december')
    change_word('february',  'january')
    change_word('march',     'february')
    change_word('april',     'march')
    change_word('may',       'april')
    change_word('june',      'may')
    change_word('july',      'june')
    change_word('august',    'july')
    change_word('september', 'august')
    change_word('october',   'september')
    change_word('november',  'october')
    change_word('december',  'november')

    change_word('January',   'December')
    change_word('February',  'January')
    change_word('March',     'February')
    change_word('April',     'March')
    change_word('May',       'April')
    change_word('June',      'May')
    change_word('July',      'June')
    change_word('August',    'July')
    change_word('September', 'August')
    change_word('October',   'September')
    change_word('November',  'October')
    change_word('December',  'November')

    change_word('jan',   'dec')
    change_word('feb',   'jan')
    change_word('march', 'feb')
    change_word('sept',  'aug')
    change_word('oct',   'sept')
    change_word('nov',   'oct')
    change_word('dec',   'nov')

    change_word('Jan',   'Dec')
    change_word('Feb',   'Jan')
    change_word('March', 'Feb')
    change_word('Sept',  'Aug')
    change_word('Oct',   'Sept')
    change_word('Nov',   'Oct')
    change_word('Dec',   'Nov')
  end

  if direction == 'decrement' then
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

    change_word('jan',   'feb')
    change_word('feb',   'march')
    change_word('aug',   'sept')
    change_word('sept',  'oct')
    change_word('oct',   'nov')
    change_word('nov',   'dec')
    change_word('dec',   'jan')

    change_word('Jan',   'Feb')
    change_word('Feb',   'March')
    change_word('Aug',   'Sept')
    change_word('Sept',  'Oct')
    change_word('Oct',   'Nov')
    change_word('Nov',   'Dec')
    change_word('Dec',   'Jan')
  end

  -- Colors
  if direction == 'increment' then
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
  end

  if direction == 'decrement' then
    change_word('red',    'violet')
    change_word('orange', 'red')
    change_word('yellow', 'orange')
    change_word('green',  'yellow')
    change_word('blue',   'green')
    change_word('indigo', 'blue')
    change_word('violet', 'indigo')

    change_word('Red',    'Violet')
    change_word('Orange', 'Red')
    change_word('Yellow', 'Orange')
    change_word('Green',  'Yellow')
    change_word('Blue',   'Green')
    change_word('Indigo', 'Blue')
    change_word('Violet', 'Indigo')
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

