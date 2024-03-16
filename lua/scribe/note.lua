
local M = {}

function M.get_length(marks)
    if marks == nil then
        marks = scribe.get_mark_config().notes
    end
    return table.maxn(marks)
end

function M.get_marked_file_name(idx, marks)
    local mark
    if marks ~= nil then
        mark = marks[idx]
    else
        mark = harpoon.get_mark_config().marks[idx]
    end
    log.trace("get_marked_file_name():", mark and mark.filename)
    return mark and mark.filename
end
