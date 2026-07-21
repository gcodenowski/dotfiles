: <<'COMMENT'
███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
█████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
COMMENT
# ==Functions==

# eza tree
ezat() {
    if [[ $# -eq 0 ]]; then
        eza -a --tree -L 1
    else
        eza -a --tree "$@"
    fi
}

# Empty Downloads Folder
empty_downloads() {
    rm -r ~/Downloads/*
    echo "Files Deleted Successfully!"
}

# Empty the bin
empty_bin() {
    osascript -e 'tell application "Finder" to empty trash'
    echo "Files Deleted Succesfully!"
}

# Turn on/off low priority process throttling (good for time machine backups)
low_priority_throttling() {
    local v="${1:-0}" # default to 0 if no arg
    sudo sysctl debug.lowpri_throttle_enabled="$v"
    if [[ "$v" == "1" ]]; then
        echo "-==Throttling enabled==-"
    else
        echo "-==Throttling disabled==-"
    fi
}

# Push obsidian to GitHub
obs_push() {
    cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Atlas/"
    git add .
    local msg="$*"
    if [[ -z "$msg" ]]; then
        msg="Obsidian sync $(date +%d-%h-%Y_%H-%M-%S)"
    fi
    git commit -m "$msg"
    git push origin main
}

# Push the current branch of dotiles to my GitHub with a message and a date stamp
dot_push() {
    cd "$HOME/dotfiles"
    git add .
    local msg="$*"           # Variable capturing all positional parameters
    if [[ -z "$msg" ]]; then # Checking if string is zero-length
        msg="Dotfiles sync $(date +%d-%h-%Y_%H-%M-%S)"
    fi
    git commit -m "$msg"
    git push
}

# Copy working directory to clipboard
cwd() {
    echo "$PWD" | sed "s|^$HOME|~|; s/ /\\\\ /g" | tr -d '\n' | pbcopy
}

# Start Odysseus
odysseus() {
    cd "$HOME/Code/odysseus/"
    ./start-macos.sh
}

# Run local models via llama.cpp
llm() {
    local model="$1"
    local mode="$2"
    local ctx=${3:-32000}

    typeset -A MODELS
    MODELS=(
        gemma "yuxinlu1/gemma-4-12B-coder-fable5-composer2.5-v1-GGUF:Q4_K_M"
        granite3 "unsloth/granite-3.3-8b-instruct-GGUF"
        granite4 "unsloth/granite-4.1-8b-GGUF:Q6_K"
        qwen "unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q4_K_XL"
        gpt "unsloth/gpt-oss-20b-GGUF:Q4_K_M"
    )

    local repo="${MODELS[$model]}"
    if [[ -z "$repo" ]]; then
        echo "Unknown model: $model"
        echo "Available: ${(k)MODELS}"
        return 1
    fi

    case "$mode" in
    cli) llama-cli -hf "$repo" --ctx-size "$ctx" ;;
    server) llama-server -hf "$repo" --ctx-size "$ctx" ;;
    *)
        echo "Please pass <model> cli|server [ctx-size]"
        echo "Available models: ${(k)MODELS}"
        ;;
    esac
}

# Sync agentLearning HTML files to Obsidian vault
sync_lessons() {
    local src="$HOME/Code/agentLearning"
    local dest="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Atlas/002 Computer Science/Lessons/agentLearning"
    local copied=0 skipped=0 deleted=0 assets=0

    # Copy source files to dest, preserving structure
    while IFS= read -r file; do
        local rel="${file#$src/}"
        local dest_file="$dest/$rel"
        local dest_dir="${dest_file:h}"

        if [[ -f "$dest_file" ]]; then
            if [[ "$(stat -f%z "$file")" -eq "$(stat -f%z "$dest_file")" ]]; then
                skipped=$((skipped + 1))
                continue
            fi
        fi

        mkdir -p "$dest_dir"
        cp "$file" "$dest_file"
        copied=$((copied + 1))
    done < <(find "$src" -path "*/reference/*.html" -o -path "*/lessons/*.html" | sort)

    # Copy assets directories (CSS, JS)
    while IFS= read -r assets_dir; do
        local rel="${assets_dir#$src/}"
        mkdir -p "$dest/$rel"
        cp -r "$assets_dir"/* "$dest/$rel/" 2>/dev/null
        assets=$((assets + $(find "$assets_dir" -type f | wc -l | tr -d ' ')))
    done < <(find "$src" -type d -name "assets")

    # Delete orphaned files in dest
    while IFS= read -r file; do
        local rel="${file#$dest/}"
        if [[ ! -f "$src/$rel" ]]; then
            rm "$file"
            deleted=$((deleted + 1))
        fi
    done < <(find "$dest" -name "*.html" -type f)

    echo "Synced: $copied copied, $skipped skipped, $deleted deleted, $assets assets"
}
