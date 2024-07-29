local Path = require("plenary.path")
local uv = vim.loop

local data_path = vim.fn.stdpath("data")
local cache_config = string.format("%s/scribe.txt", data_path)

local M = {}

function M.save(--[[required]]content, --[[optional]]save_directory)
	if not save_directory then
		save_directory = cache_config --default
	end

	Path:new(save_directory):write(content or '', "w")
end

function M.load()
	local data = Path:new(cache_config):read()

	return data
end

return M
