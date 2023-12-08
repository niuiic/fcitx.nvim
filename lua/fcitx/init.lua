local static = require("fcitx.static")
local core = require("core")

local get_status = function()
	local result = vim.api.nvim_exec2("silent !" .. static.config.get_status, { output = true })
	local arr = core.lua.string.split(result.output, "\n")
	if arr[#arr] == "1" then
		return "inactived"
	else
		return "actived"
	end
end

local setup = function(new_config)
	static.config = vim.tbl_deep_extend("force", static.config, new_config or {})
end

local active_input_method = function()
	vim.cmd("silent !" .. static.config.active_input_method)
end

local inactive_input_method = function()
	vim.cmd("silent !" .. static.config.inactive_input_method)
end

local only_active_when_insert = function()
	local status_in_prev_insert

	vim.api.nvim_create_autocmd({ "ModeChanged" }, {
		pattern = { "*" },
		callback = function(args)
			local modes = core.lua.string.split(args.match, ":")

			if modes[1] == "i" then
				status_in_prev_insert = get_status()
				inactive_input_method()
				return
			end

			if modes[2] == "i" and status_in_prev_insert == "actived" then
				active_input_method()
			end
		end,
	})
end

return {
	setup = setup,
	get_status = get_status,
	active_input_method = active_input_method,
	inactive_input_method = inactive_input_method,
	only_active_when_insert = only_active_when_insert,
}
