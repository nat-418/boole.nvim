boole.nvim
==========

![A bust of George Boole](./boole.jpg)

Boole is a simple Neovim plugin that extends the default increment and
decrement functionality of CTRL-A and CTRL-X to allow for toggling
boolean values as well as cycling through days of the week, months
of the year, and ROYGBIV color names. This plugin ships one command:

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
`setup` function:

```lua
require('boole').setup({
  mapping = {
    increment = '<C-a>',
    decrement = '<C-x>'
  }
})
```
