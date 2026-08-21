# Chezmoi Handover

How your dotfiles work now. Local-only, git-excluded.

## The model (30 seconds)

- `~/.local/share/chezmoi` → symlink to `~/dotfiles`. Your repo **is** the chezmoi source.
- `home/` in the repo is the source state. Files named `dot_foo` deploy as `.foo`, e.g.
  `home/dot_config/kitty` → `~/.config/kitty`.
- Files ending `.tmpl` are templates: they're rendered with data from
  `home/.chezmoidata.yaml` before being written.
- Deployed files are real files now (no symlinks). **Editing `~/.zshrc` directly is wrong** —
  edit the source in `~/dotfiles`, then apply.

## Day-to-day

```sh
chezmoi cd              # jump to ~/dotfiles (source)
chezmoi diff            # what would change on apply
chezmoi apply           # render templates + write everything to $HOME + run scripts
dot_push "msg"          # commit & push (as before)
```

Edit → apply → done. If you only edited plain (non-.tmpl) files, nothing else is needed
until you want them re-deployed.

## Themes

One central place: `home/.chezmoidata.yaml`. Active theme = `theme.name`.

```sh
dotfiles-theme          # list themes + current
dotfiles-theme vesper   # switch everything, everywhere
```

It edits `.chezmoidata.yaml`, runs `chezmoi apply`; a script then updates borders colour,
spicetify scheme, wallpaper and reloads sketchybar. Per-theme values (starship variant,
herdr name, nvim colorscheme) are in the `themes:` table — add a new theme by adding one
line there plus `home/dot_config/starship/starship-<name>.toml`.

What replaced the old system:

| Before | Now |
| --- | --- |
| `os_theme <t>` (sed herdr config, write .theme files) | `dotfiles-theme <t>` |
| `starship_theme <t>` (symlink into repo) | part of `dotfiles-theme` (`~/.config/starship.toml` is generated) |
| `~/.config/sketchybar/.theme` hand-written | generated from `theme.name` |
| wallpaper path `~/dotfiles/wallpapers/` | `~/.local/share/wallpapers/` |

## What changed structurally

| Old | New |
| --- | --- |
| `shell/.zshrc` | `home/dot_zshrc.tmpl` |
| `zsh/.config/zsh/os_theme.zsh` | gone → `dotfiles-theme.zsh` |
| `starship/.config/*.toml` | `home/dot_config/starship/*.toml` (+ generated `~/.config/starship.toml`) |
| `superfile/superfile` | `home/dot_config/superfile/` (deploys to `~/.config/superfile`;
  macOS path is symlinked to it by a run-once script) |
| `wallpapers/` | `home/dot_local/share/wallpapers/` |
| `kitty/.config/kitty/theme.conf` broken symlink | `home/dot_config/kitty/theme.conf.tmpl`
  (`theme.kitty` in chezmoidata picks the vendored kitty-themes file) |

macOS-only apps (yabai, skhd, sketchybar, svim, herdr, spicetify) are excluded on Linux via
`home/.chezmoiignore`. Shared core (kitty, nvim, zsh, starship, fastfetch, git, tmux,
superfile) deploys everywhere; zshrc/functions have `{{ if eq .chezmoi.os "darwin" }}` blocks.

Git identity lives in `.chezmoidata.yaml` (`git.name/email`) — not hardcoded anymore.

## New things to learn

1. **Never edit deployed files** (`~/.config/...`, `~/.zshrc`). They get overwritten.
   Edit under `~/dotfiles/home/...` instead. If you accidentally edit a deployed file,
   `chezmoi diff` shows it; `chezmoi apply --force` discards your drift (careful).
2. **Templates**: `{{ .git.email }}` style Go templating, guarded by OS conditionals.
   Any file can become one by adding `.tmpl`.
3. **Scripts**: `home/.chezmoiscripts/run_onchange_after_apply-theme.sh.tmpl` re-runs when
   its content changes (that's how theme changes trigger side effects). Same pattern for
   future post-apply hooks.
4. **Fresh machine**: `./install.sh` (installs CLT/Homebrew/Brewfile/chezmoi, then
   `chezmoi init --apply`). Brewfile has manual-install notes for herdr/SbarLua/stats_provider.

## Gotchas hit during migration (for reference)

- With `.chezmoiroot`, all meta files (`.chezmoidata.yaml`, `.chezmoiignore`,
  `.chezmoiscripts/`) must live inside `home/`.
- Source names starting with `.` are ignored — hidden targets need `dot_` prefix
  (e.g. `dot_theme.tmpl` → `.theme`).
- `chezmoi apply` prompts (needs a TTY) if a managed file changed outside chezmoi;
  use `--force` deliberately.
- Old stow symlinks were removed by apply; `~/Library/Application Support/superfile`
  was manually relinked to `~/.config/superfile`.

## Verify / troubleshoot

```sh
chezmoi diff                    # empty = $HOME matches source
chezmoi managed                 # everything chezmoi owns
chezmoi execute-template < home/dot_zshrc.tmpl   # preview a template render
chezmoi doctor                  # diagnose setup issues
```

Rollback: `git checkout main` restores the stow layout, then re-stow.
