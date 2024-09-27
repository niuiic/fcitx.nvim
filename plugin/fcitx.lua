local fcitx = require("fcitx")

local is_active_previously = false

vim.api.nvim_create_autocmd({ "ModeChanged" }, {
	pattern = { "*" },
	callback = function(args)
		if string.match(args.match, "[^i]:i") and is_active_previously then
			fcitx.active_input_method()
		elseif string.match(args.match, "i:[^i]") then
			fcitx.get_fcitx_status(function(is_active)
				is_active_previously = is_active
			end)
			fcitx.inactive_input_method()
		end
	end,
})
