
local M = {}

function M.get_length(marks)
    if marks == nil then
        marks = scribe.get_mark_config().notes
    end
    return table.maxn(marks)
end
