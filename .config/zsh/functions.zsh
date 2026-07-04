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
ezat(){
	if [[ $# -eq 0 ]]; then
		eza -a --tree -L 1
	else
		eza -a --tree "$@"
	fi
}

# Empty Downloads Folder
empty_downloads(){
	rm -r ~/Downloads/*
	echo "Files Deleted Successfully!"
}

# Empty the bin
empty_bin(){
	osascript -e 'tell application "Finder" to empty trash'
	echo "Files Deleted Succesfully!" 
}

# Turn on/off low priority process throttling (good for time machine backups)
low_priority_throttling(){
	local v="${1:-0}"	# default to 0 if no arg
	sudo sysctl debug.lowpri_throttle_enabled="$v"
	if [[ "$v" == "1" ]];  then
		echo "-==Throttling enabled==-"
	else 
		echo "-==Throttling disabled==-"
	fi
}

# Push obsidian to GitHub
obs_push(){
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
dot_push(){
    cd "$HOME/dotfiles"
    git add .
    local msg="$*" # Variable capturing all positional parameters
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
odysseus(){
    cd "$HOME/Documents/Programming/odysseus/"
    ./start-macos.sh
}

# Run local models via llama.cpp
llm() {
    local model="$1"
    local mode="$2"
    local ctx=${3:-8192}

    declare -A MODELS=(
        [gemma]="yuxinlu1/gemma-4-12B-coder-fable5-composer2.5-v1-GGUF:Q4_K_M"
        [granite3]="unsloth/granite-3.3-8b-instruct-GGUF"
        [granite4]="unsloth/granite-4.1-8b-GGUF:Q6_K"
        [qwen]="unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q4_K_XL"
    )

    local repo="${MODELS[$model]}"
    if [[ -z "$repo" ]]; then
        echo "Unknown model: $model"
        echo "Available: ${!MODELS[@]}"
        return 1
    fi

    case "$mode" in
        cli)    llama-cli    -hf "$repo" --ctx-size "$ctx" ;;
        server) llama-server -hf "$repo" --ctx-size "$ctx" ;;
        *)      echo "Please pass <model> cli|server [ctx-size]"; echo "Available models: ${!MODELS[@]}" ;;
    esac
}
