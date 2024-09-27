local config = {
	get_status = { cmd = "fcitx5-remote" },
	active_input_method = { cmd = "fcitx5-remote", args = { "-o" } },
	inactive_input_method = { cmd = "fcitx5-remote", args = { "-c" } },
}

return {
	config = config,
}
