boole.nvim
==========

![A bust of George Boole](./boole.jpg)

Boole is a simple Neovim plugin that extends the default increment and
decrement functionality of CTRL-A and CTRL-X to allow for toggling
boolean values like `on`, `yes`, and `true` as well as cycling through:

* Days of the week and their abbreviations (e.g., `Monday` → `Tuesday`)
* Months of the year and their abbreviations (e.g., `Jan` → `Feb`)
* X11 / Web color names (e.g., `Orange` → `OrangeRed`)
* Canonical hours (e.g., `Compline` → `Vigil`)
* Letter + number "words" (e.g., `F1` → `F2`)
* Logical operators (e.g., `and` → `or`)

This plugin ships one command:

* `:Boole {increment|decrement}`

This command can be safely mapped to CTRL-A and CTRL-X. See the
configuration section below for an example.

Installation
------------

Using [Packer](https://github.com/wbthomason/packer.nvim):
```lua
use({
  'https://github.com/nat-418/boole.nvim',
  config = function()
    require('boole').setup()
  end
})
```

Configuration
-------------

Boole can be mapped to a key by passing a configuration table to the 
`setup` function. You can also add any paris of words you would like.
Feel free to submit an issue and pull request with additions you
think would make good defaults.

```lua
require('boole').setup({
  mappings = {
    increment = '<C-a>',
    decrement = '<C-x>'
  },
  -- Key value pairs of additional replacements
  -- increment: (key => value)
  -- decrement: (value => key)
  pair_additions = {
    ['Foo'] = 'Bar',
    ['Bar'] = 'Foo'
  },
})
```
