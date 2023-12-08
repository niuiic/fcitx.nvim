# fcitx.nvim

Neovim plugin to automatically switch fcitx input method

## Usage

Avaiable functions here.

| Function                | Desc                                    |
| ----------------------- | --------------------------------------- |
| setup                   | set config                              |
| get_status              | return `actived` or `inactived`         |
| active_input_method     | active input method                     |
| inactive_input_method   | inactive input method                   |
| only_active_when_insert | only active input method in insert mode |

Call `require("fcitx").only_active_when_insert()` or define your own function.

## Dependencies

- [niuiic/core.nvim](https://github.com/niuiic/core.nvim)

## Config

Default configuration here.

```lua
require("fcitx").setup({
	get_status = "fcitx5-remote",
	active_input_method = "fcitx5-remote -o",
	inactive_input_method = "fcitx5-remote -c",
})
```
