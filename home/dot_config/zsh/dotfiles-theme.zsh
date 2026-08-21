# Switch the chezmoi-managed theme everywhere.
# Usage: dotfiles-theme            -> list themes + current
#        dotfiles-theme <name>     -> switch and apply
dotfiles-theme() {
    emulate -L zsh
    local src data
    src="$(command chezmoi source-path)" || return 1
    data="$src/.chezmoidata.yaml"

    if [[ -z $1 ]]; then
        echo "Available themes:"
        awk '/^themes:/{f=1; next} f && /^  [a-z]/{gsub(":", "", $1); print "  " $1} f && /^[^ #]/{f=0}' "$data"
        echo "Current: $(awk '/^theme:/{f=1; next} f && /^  name:/{print $2}' "$data")"
        return 0
    fi

    if ! grep -q "^  $1:" "$data"; then
        echo "No such theme: $1" >&2
        return 1
    fi

    sed -i.bak "s/^  name: .*/  name: $1/" "$data" && rm -f "$data.bak"
    command chezmoi apply --source "$src"
}
