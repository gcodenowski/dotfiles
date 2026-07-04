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

# Run Gemma
gemma() {
    local ctx=${2:-8192}
	case "$1" in
		cli) llama-cli       -hf yuxinlu1/gemma-4-12B-coder-fable5-composer2.5-v1-GGUF:Q4_K_M --ctx-size "$ctx" ;;
		server) llama-server -hf yuxinlu1/gemma-4-12B-coder-fable5-composer2.5-v1-GGUF:Q4_K_M --ctx-size "$ctx" ;;
		*) echo "Please pass cli|server [ctx-size]" ;;
        esac
}

# Run Granite 3
granite3() {
local ctx=${2:-8192}
    case "$1" in
        cli)    llama-cli    -hf unsloth/granite-3.3-8b-instruct-GGUF --ctx-size "$ctx" ;;
        server) llama-server -hf unsloth/granite-3.3-8b-instruct-GGUF --ctx-size "$ctx" ;;
        *)      echo "Please pass cli|server [ctx-size]" ;;
    esac
}

# Run Granite 4
granite4() {
local ctx=${2:-8192}
    case "$1" in
	cli)    llama-cli    -hf unsloth/granite-4.1-8b-GGUF:Q6_K --ctx-size "$ctx" ;;
        server) llama-server -hf unsloth/granite-4.1-8b-GGUF:Q6_K --ctx-size "$ctx" ;;
        *)      echo "Please pass cli|server [ctx-size]" ;;
    esac
}

# Run Qwen
qwen() {
local ctx=${2:-8192}
    case "$1" in
	cli)    llama-cli -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q4_K_XL --ctx-size "$ctx" ;;
        server) llama-server -hf unsloth/Qwen3-Coder-30B-A3B-Instruct-GGUF:UD-Q4_K_XL --ctx-size "$ctx" ;;
        *)      echo "Please pass cli|server [ctx-size]" ;;
    esac
}
