# dotfiles

This is my dotfiles configuration from my MBP. It is not stable by any means and only meant to be a demo configuration, use at your discretion. 

Built on macOS Tahoe 26.2

## Tools Used

| Title | Purpose | Link |
| ----- | ------- | ---- | 
| yabai | Tiling WM |  https://github.com/asmvik/yabai |
| skhd | key mapping for yabai | https://github.com/asmvik/skhd |
| SketchyBar | Custom menu bar | https://github.com/FelixKratz/SketchyBar |
| sketchybar-system-stats | Event provider for SkethyBar | https://github.com/joncrangle/sketchybar-system-stats |
| JankyBorders | Window Borders | https://github.com/FelixKratz/JankyBorders | 
| Nvim | Editor | https://github.com/neovim/neovim |
| Kickstart.nvim | Nvim config starting point | https://github.com/nvim-lua/kickstart.nvim |
| SketchyVim | Adds vim motions to macOS  | https://github.com/FelixKratz/SketchyVim |
| Kitty | Terminal Emulator | https://github.com/kovidgoyal/kitty |
| fastfetch | System Specs Fetch | https://github.com/fastfetch-cli/fastfetch |
| GNU Stow | Easy symlinking | https://www.gnu.org/software/stow/ |

---

### SketchyBar

Sketchybar uses SbarLua in this setup. Sketchybar stats provider is used to provide event subscription to system processes. If you are using an intel mac this will likely not work straight away as you install these dotfiles and you might have to change the path to the stats provider in the `sketchybarrc`. 

**Right Side:**
- CPU graph & percentage
- Memory usage percentage
- Battery (icon only, edit battery.sh and uncomment the percentage line if you want it), opens battery health on mouse click
- Calendar that opens the Calendar app on mouse click
- Clock (HH/MM/SS)

**Left Side:**
- Apple Menu with a dropdown menu on mouse click
- Currently selected app with icon & name

**General**
- Edit sketchybar/colors.sh for different colours 

### JankyBorders
- Bootstrapped process with Yabai (see /config/yabai/yabairc)

### Yabai
- SIP (System Integrity Protection) **doesn't** need to be disabled for this yabai config to work.
- Shortcuts managed in /config/skhd/skhdrc
- App exceptions, mouse bindings & default settings managed in /config/yabai/yabairc

---

# Acknowledgements

Sketchybar lua config inspired by FelixKratz's *dotfiles*
