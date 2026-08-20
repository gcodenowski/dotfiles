# For changing os themes
os_theme() {
    if [[ -z $1 ]]; then
        local d=~/.config/sketchybar/themes
        local active_theme
        if [[ -f ~/.config/sketchybar/.theme ]]; then
            active_theme=$(<~/.config/sketchybar/.theme)
        fi
        local -a themes=()
        for f in "$d"/*.lua; do
            [[ -e $f ]] || continue
            local t="${f:t:r}"
            if [[ "$t" == "$active_theme" ]]; then
                themes+=("*$t")
            else
                themes+=("$t")
            fi
        done
        echo "Available themes: ${(j: :)themes}"
        return 0
    fi

    local theme_file=~/.config/sketchybar/themes/$1.lua
    if [[ ! -f $theme_file ]]; then
        echo "No such sketchybar theme: $1" >&2
        return 1
    fi

    printf '%s\n' "$1" >~/.config/sketchybar/.theme

    # Update JankyBorders to the accent colour
    # grep called explicitly since ripgrep breaks on -oE
    local -l accent
    accent=$(command grep -oE 'accent[[:space:]]*=[[:space:]]*0x[0-9a-fA-F]+' "$theme_file" |
        command grep -oE '0x[0-9a-fA-F]+')
    [[ -n $accent ]] && borders active_color="$accent"

    # Derive the starship prompt theme: use the same name when a
    # matching starship-<name>.toml exists
    local ship_toml=~/dotfiles/starship/.config/starship-$1.toml
    [[ -f $ship_toml ]] && starship_theme "$1"

    # Sync the herdr theme
    typeset -A HERDR_FOR=(
        vesper vesper
        aurora one-dark
        hacker terminal
        garden solarized
        tokyonight tokyo-night
        monochrome terminal
        paper gruvbox-light
        spill one-light
    )

    local herdr_name="${HERDR_FOR[$1]}"
    if [[ -n $herdr_name ]]; then
        local herdr_cfg=~/dotfiles/herdr/.config/herdr/config.toml
        sed -i '' "s/^name = \".*\"/name = \"$herdr_name\"/" "$herdr_cfg"
    fi

    # Sync the neovim colorscheme (line 10 of theme.lua; explicit mapping)
    typeset -A NVIM_FOR=(
        vesper randomhue
        aurora lunaperche
        hacker koehler
        garden habamax
        tokyonight tokyonight
        monochrome quiet
        paper minisummer
        spill pablo
    )
    local nvim_name="${NVIM_FOR[$1]}"
    if [[ -n $nvim_name ]]; then
        local nvim_cfg=~/.config/nvim/lua/plugins/theme.lua
        sed -i '' '10s/vim.cmd.colorscheme("[^"]*")/vim.cmd.colorscheme("'"$nvim_name"'")/' "$nvim_cfg"
    fi

    # Set the desktop wallpaper (all screens; skip if no asset for this theme)
    local wp_dir=~/dotfiles/wallpapers
    local wp_img=""
    for ext in jpg jpeg png heic; do
        if [[ -f "$wp_dir/$1.$ext" ]]; then
            wp_img="$wp_dir/$1.$ext"
            break
        fi
    done
    if [[ -n $wp_img ]] && command -v wallpaper >/dev/null 2>&1; then
        wallpaper set "$wp_img" --screen all
    fi

    sketchybar --reload
}

# Switch between starship themes
starship_theme() {
    local dir="$HOME/dotfiles/starship/.config"
    if [[ -z $1 ]]; then
        ls "$dir" | grep '^starship-.*\.toml$' | sed 's/^starship-//;s/\.toml$//'
        return 1
    fi
    local tgt="$dir/starship-$1.toml"
    if [[ ! -f $tgt ]]; then
        echo "No such starship theme: $1" >&2
        return 1
    fi
    ln -sf "$tgt" "$HOME/.config/starship.toml"
}
