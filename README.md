# dotfiles

This is my main dotfiles configuration.
It is not stable by any means. Use at your own risk.

Built on macOS Tahoe 26.3

## Tools Used

| Title | Purpose |
| ----- | ------- |
| [yabai](https://github.com/asmvik/yabai) | Tiling WM |
| [skhd](https://github.com/asmvik/skhd) | Hotkey daemon |
| [SketchyBar](https://github.com/FelixKratz/SketchyBar) | Custom menu bar |
| [sketchybar-system-stats](https://github.com/joncrangle/sketchybar-system-stats) | Event provider for SketchyBar |
| [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Window Borders |
| [Nvim](https://github.com/neovim/neovim) | Editor |
| [Kickstart](https://github.com/nvim-lua/kickstart.nvim) | Nvim config starting point |
| [SketchyVim](https://github.com/FelixKratz/SketchyVim) | Adds vim motions to macOS |
| [Kitty](https://github.com/kovidgoyal/kitty) | Terminal Emulator |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System Specs Fetch |
| [GNU](https://www.gnu.org/software/stow/) | Easy symlinking |
| [Starship](https://github.com/starship/starship) | Custom prompt |

---

### Neovim

This neovim configuration contains everything that can be
found in kickstart.nvim, with the addition of [dadbod](https://github.com/tpope/vim-dadbod)
for database work, python linting and a custom greeter.

---

### SketchyBar

Sketchybar uses SbarLua in this setup.
Sketchybar stats provider is used to provide event subscription to system processes.
If you are using an intel mac this will likely not work straight away
as you install these dotfiles and you might have to change the path
to the stats provider in the `sketchybarrc`.

sketchybar-system-stats is being used as an easy way to
provide system events to sketchybar.
This can be used to create cpu graphs etc.

- Edit .config/sketchybar/colors.lua for different colours

### JankyBorders

- Bootstrapped process with Yabai (see /config/yabai/yabairc)
Provides coloured borders around windows.

### Yabai

- SIP (System Integrity Protection) **doesn't** need to be disabled
for this yabai config to work.
- Shortcuts managed in /.config/skhd/skhdrc
- App exceptions, mouse bindings & default settings managed in /.config/yabai/yabairc

---

## Acknowledgements

Sketchybar config inspired by FelixKratz's [dotfiles](https://github.com/FelixKratz/dotfiles)

Kickstart.nvim is a great way to get into neovim and was a starting point
for this neovim config.
If you're after making your first config I'd recommend using kickstart and not
using a pre-made configuration like this one.
