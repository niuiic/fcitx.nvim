# fcitx.nvim

Neovim plugin to automatically switch fcitx input method without delay.

[More neovim plugins](https://github.com/niuiic/awesome-neovim-plugins)

## Dependencies

- [niuiic/core.nvim](https://github.com/niuiic/core.nvim)

## Config

Default configuration here.

```lua
require("fcitx").setup({
	get_status = { cmd = "fcitx5-remote" },
	active_input_method = { cmd = "fcitx5-remote", args = { "-o" } },
	inactive_input_method = { cmd = "fcitx5-remote", args = { "-c" } },
})
```
