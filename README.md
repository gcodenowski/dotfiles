# dotfiles

This is my main dotfiles configuration.
It is not stable by any means. Use at your own risk.

Managed with [chezmoi](https://www.chezmoi.io/), works on macOS (arm/x86) and Linux.

Built on macOS Tahoe 26.3

![Desktop](assets/screenRec.gif)

## Install

On a fresh machine:

```sh
sh -c "$(curl -fsSL raw.githubusercontent.com/gcodenowski/dotfiles/main/install.sh)"
```

or clone and run locally:

```sh
git clone git@github.com:gcodenowski/dotfiles.git && cd dotfiles
./install.sh
```

The script installs Homebrew (macOS), the packages from the `Brewfile`,
chezmoi, and then applies the configuration with `chezmoi init --apply`.
On Linux, install your distribution's equivalents of the core tools
(the script prints them) — only the shared cross-platform configs are deployed.

Everyday usage after install:

```sh
chezmoi cd          # edit the source state (this repo)
chezmoi diff        # preview changes
chezmoi apply       # apply changes to $HOME
dot_push message    # commit & push
```

## Tools Used

| Title | Purpose |
| ----- | ------- |
| [chezmoi](https://www.chezmoi.io/) | Dotfile management |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System Specs Fetch |
| [JankyBorders](https://github.com/FelixKratz/JankyBorders) | Window Borders |
| [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) | Nvim config starting point |
| [Kitty](https://github.com/kovidgoyal/kitty) | Terminal Emulator |
| [Nvim](https://github.com/neovim/neovim) | Editor |
| [Opencode](https://github.com/anomalyco/opencode) | Agentic AI |
| [skhd](https://github.com/asmvik/skhd) | Hotkey daemon |
| [SketchyBar](https://github.com/FelixKratz/SketchyBar) | Custom menu bar |
| [sketchybar-system-stats](https://github.com/joncrangle/sketchybar-system-stats) | Event provider for SketchyBar |
| [Starship](https://github.com/starship/starship) | Custom prompt |
| [Superfile](https://github.com/yorukot/superfile) | TUI File Explorer |
| [Herdr](https://github.com/ogulcancelik/herdr) | Terminal Mutliplexer |
| [yabai](https://github.com/asmvik/yabai) | Tiling WM |

---

### Neovim

This neovim configuration contains everything that can be
found in kickstart.nvim, with the addition of the following:

| Title | Purpose |
| ----- | ------- |
| [alpha](https://github.com/goolord/alpha-nvim) | Dashboard |
| [dadbod](https://github.com/tpope/vim-dadbod) | DB work |
| [opencode](https://github.com/nickjvandyke/opencode.nvim) | Opencode Integration |
| [snacks](https://github.com/folke/snacks.nvim) | Collection of QoL tools |
| [dooing](https://github.com/atiladefreitas/dooing) | To Do list |
| [typescript-tools](https://github.com/pmizio/typescript-tools.nvim) | Typescript all-in-one plugin |
| [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | File explorer |
| [orgmode](https://github.com/nvim-orgmode/orgmode) | Emacs orgmode in nvim |
| [transparent](https://github.com/xiyaowong/transparent.nvim) | Transparency in every colorscheme |

---

### SketchyBar

Sketchybar uses SbarLua in this setup.
Sketchybar stats provider is used to provide event subscription to system processes.
If you are using an intel mac this will likely not work straight away
as you install these dotfiles and you might have to change the path
to the stats provider in the `sketchybarrc`.

[sketchybar-system-stats](https://github.com/joncrangle/sketchybar-system-stats)
is being used as an easy way to
provide system events to sketchybar.
This can be used to create cpu graphs etc.

- Edit .config/sketchybar/colors.lua for different colours

### JankyBorders

- Bootstrapped process with Yabai (see /config/yabai/yabairc)
Provides coloured borders around windows.

### Yabai

- SIP (System Integrity Protection) **doesn't** need to be disabled
for this yabai config to work.
- Shortcuts managed in .config/skhd/skhdrc
- App exceptions, mouse bindings & default settings managed in .config/yabai/yabairc
- Instant space switching is achieved via [this tool](https://github.com/jurplel/InstantSpaceSwitcher)

### skhd

skhd with [hyperkey](https://hyperkey.app) is used to add shortcuts for managing
applications

---

## Custom Scripts

| Name | Args | Purpose |
| --- | --- | --- |
| dotfiles-theme | themename | Switch theme everywhere (starship, nvim, herdr, sketchybar, wallpaper, spicetify) via chezmoi |

Themes live in `home/.chezmoidata.yaml`. `dotfiles-theme <name>` updates the
active theme and runs `chezmoi apply`, which regenerates every themed file.

---

## Acknowledgements

Sketchybar config inspired by FelixKratz's [dotfiles](https://github.com/FelixKratz/dotfiles)

[Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
is a great way to get into neovim, and was a starting point
for this neovim config.  

If you're after making your first config I'd recommend using kickstart and not
using a pre-made configuration like this one.

I would like to sincerely thank all developers that built the tools I use
day-to-day!
