local static = require("fcitx.static")
local core = require("core")

---@param cb fun(is_active: boolean)
local function get_fcitx_status(cb)
	local output
	local ok = true
	core.job.spawn(static.config.get_status.cmd, static.config.get_status.args, {}, function()
		if not ok then
			return
		end
		cb(output)
	end, function()
		ok = false
	end, function(_, data)
		output = data
	end)
end

local function active_input_method()
	core.job.spawn(
		static.config.active_input_method.cmd,
		static.config.active_input_method.args,
		{},
		function() end,
		function() end,
		function() end
	)
end

local function inactive_input_method()
	core.job.spawn(
		static.config.inactive_input_method.cmd,
		static.config.inactive_input_method.args,
		{},
		function() end,
		function() end,
		function() end
	)
end

local function setup(new_config)
	static.config = vim.tbl_deep_extend("force", static.config, new_config or {})
end

return {
	setup = setup,
	get_fcitx_status = get_fcitx_status,
	active_input_method = active_input_method,
	inactive_input_method = inactive_input_method,
}
