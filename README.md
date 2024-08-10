# scribe.nvim

A tool to quickly record notes from anywhere.

### The Problem

1. You find yourself needing to take notes that shouldn't stick around for long, maybe a to-do list for work, jot down meeting notes or a ... shopping list?
2. You want a quicker way to create a new file without needing to open another terminal or tmux window.

### The Solution

1. Create a new window to overlay your work, allowing you to rapidly start taking notes.
2. Leave that note with no commitment and it'll save itself temporarily.
3. Decided you want to save it? You can!

### Installation

```lua
use "jmutton2/scribe"
```

### Getting Started

##### Basic Setup

```lua
local ui = require("scribe.ui")

vim.keymap.set("n", "<leader>n", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>s", ui.save_cwd)
```

###  Usage

```lua
ui.toggle_quick_menu -- will toggle scribe
q -- wil close scribe
esc -- will close scribe

ui.save_cwd -- will prompt you to name the file. You can also change the file path here too.
```

![Peek 2024-08-10 09-21](https://github.com/user-attachments/assets/47c2f20c-2d72-4395-b1ab-d49265e3caa4)
