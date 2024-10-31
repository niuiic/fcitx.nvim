local static = require("fcitx.static")

---@param cb fun(is_active: boolean)
local function get_fcitx_status(cb)
	vim.system({ static.config.get_status.cmd, static.config.get_status.args }, nil, function(res)
		cb(string.find(res.stdout, "1") == nil)
	end)
end

local function active_input_method()
	vim.system(vim.list_extend({ static.config.active_input_method.cmd }, static.config.active_input_method.args))
end

local function inactive_input_method()
	vim.system(vim.list_extend({ static.config.inactive_input_method.cmd }, static.config.inactive_input_method.args))
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
