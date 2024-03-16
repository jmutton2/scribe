local popup = require("plenary.popup")
local scribe = require('scribe')
local M = {}

Scribe_win_id = nil
Scribe_bufh = nil

local function close_menu(force_save)
	scribe.save()

    vim.api.nvim_win_close(Scribe_win_id, true)

    Scribe_win_id = nil
    Scribe_bufh = nil
end

local function create_window()
    local width = 120
    local height = 50
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
    local bufnr = vim.api.nvim_create_buf(false, false)

    local Scribe_win_id, win = popup.create(bufnr, {
        title = "Scribe Note",
        highlight = "ScribeWindow",
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
    })

    vim.api.nvim_win_set_option(
        win.border.win_id,
        "winhl",
        "Normal:ScribeBorder"
    )

    return {
        bufnr = bufnr,
        win_id = Scribe_win_id,
    }
end

function M.toggle_quick_menu()
	if Scribe_win_id ~= nil and vim.api.nvim_win_is_valid(Scribe_win_id) then
		close_menu()
		return
	end

	local win_info = create_window()
	local contents = {}

	Scribe_win_id = win_info.win_id
	Scribe_bufh = win_info.bufnr

	-- TODO: get the contents from a file
	-- TODO: save contents to a file
    vim.api.nvim_win_set_option(Scribe_win_id, "number", true)
    vim.api.nvim_buf_set_name(Scribe_bufh, "scribe-menu")
    vim.api.nvim_buf_set_lines(Scribe_bufh, 0, #contents, false, contents)
    vim.api.nvim_buf_set_option(Scribe_bufh, "filetype", "scribe")
    vim.api.nvim_buf_set_option(Scribe_bufh, "buftype", "acwrite")
    vim.api.nvim_buf_set_option(Scribe_bufh, "bufhidden", "delete")
    vim.api.nvim_buf_set_keymap(
        Scribe_bufh,
        "n",
        "q",
        "<Cmd>lua require('scribe.ui').toggle_quick_menu()<CR>",
        { silent = true }
    )
    vim.api.nvim_buf_set_keymap(
        Scribe_bufh,
        "n",
        "<ESC>",
        "<Cmd>lua require('scribe.ui').toggle_quick_menu()<CR>",
        { silent = true }
    )
    vim.cmd(
        string.format(
            "autocmd BufModifiedSet <buffer=%s> set nomodified",
            Scribe_bufh
        )
    )
    vim.cmd(
        "autocmd BufLeave <buffer> ++nested ++once silent lua require('scribe.ui').toggle_quick_menu()"
    )
end

return M
