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

# Run aider with qwen
aiderq() {
aider --model ollama/qwen3-coder:latest --openai-api-base http://localhost:11434
}
