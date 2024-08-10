# scribe.nvim

A tool to quickly record notes from anywhere.

#### The Problem

1. You find yourself needing to take notes that shouldn't stick around for long, maybe a to-do list for work, jot down meeting notes or a ... shopping list?
2. You want a quicker way to create a new file without the hassle of managing another terminal instance and the mental gymnastics of deciding what to call it and where to stash it.

#### The Solution

1. Create a new window to overlay your work, allowing you to rapidly start taking notes.
2. Leave that note with no commitment and it'll automatically save itself elsewhere, leaving your work clean and untouched.
3. Decided you want to save it? You can!

![Peek 2024-08-10 09-21](https://github.com/user-attachments/assets/47c2f20c-2d72-4395-b1ab-d49265e3caa4)

### Getting Started

### Required dependencies

- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) is required.

#### Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use "jmutton2/scribe"
```

##### Usage

Using Lua

```lua
vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>s", ui.save_cwd)
```

## Contributing

All contributions are welcome! Just open a pull request. 
