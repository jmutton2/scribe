local Path = require("plenary.path")

local data_path = vim.fn.stdpath("data")
local cache_config = string.format("%s/scribe.json", data_path)

local M = {}

ScribeConfig = ScribeConfig or {}

function M.save()
	Path:new(cache_config):write(vim.fn.json_encode(ScribeConfig), "w")
end

return M
