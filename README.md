# dotfiles

This is my dotfiles configuration from my MBP. It is not stable by any means and only meant to be a demo configuration, use at your discretion. 

Built on macOS Tahoe 26.2

## Tools Used

- Yabai
- SketchyBar
- JankyBorders
- nvim
- Kitty
- fastfetch
- skhd
- svim
- oh-my-zsh
- eza
- GNU stow

---

### SketchyBar

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
