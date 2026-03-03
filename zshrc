# Path to my Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Sourcing the modular config files
for config in ~/dotfiles/.config/zsh/*.zsh(N); do
	# (N) ensures that an empty list is returned if there are no matching files
	# instead of throwing an error
	source "$config"
done
unset config # Remove the variable after use

# Autocomplete Plugin (has to be at the top of the file)
source "$(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

# Lua path
export LUA_CPATH="$HOME/.local/share/sketchybar_lua/?.so;$HOME/.local/share/sketchybar_lua/?/init.so;;"

# Path
path=(
	$HOME/bin
	$HOME/.local/bin
	$HOME/Library/Python/3.12/bin # Python executables
	/usr/local/bin
	$path
)

# == Themes ==
# ZSH_THEME="xiong-chiamiov-plus"
# ZSH_THEME="obraun"
# ZSH_THEME="alanpeabody"
ZSH_THEME="gallois"

# Autoupdate every 2 weeks
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages eza macos)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# ==Compilation flags==
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.


: <<'COMMENT'
█████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
███████║██║     ██║███████║███████╗█████╗  ███████╗
██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
██║  ██║███████╗██║██║  ██║███████║███████╗███████║
╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
COMMENT
# ==Aliases==

# Dirs
alias icloud='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
alias obsidian='cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Atlas"'
alias home='cd ~'
alias dotfiles='cd ~/dotfiles'
alias yabaiconfig='cd "$HOME/dotfiles/.config/yabai"'
alias kittyconfig='cd "$HOME/dotfiles/.config/kitty"'
alias fastfetchconfig='cd "$HOME/dotfiles/.config/fastfetch"'
alias sketchybarconfig='cd "$HOME/dotfiles/.config/sketchybar"'

# Edit File
alias zshconfig='nvim ~/.zshrc'
alias ohmyzshconfig='nvim ~/.oh-my-zsh'
alias skhdconfig='nvim ~/.config/skhd/skhdrc'

# QoL
alias vim='nvim'
alias ls='ls -a' # Make ls show hidden files by default
alias timer="timr-tui"

# Misc
alias zshreload='exec zsh' # This sources zshrc and creates new zsh instance


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
	local depth="${1:--L 1}"
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

# zsh plugins
# syntax highlighting:
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-vi-mode 
source "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" 
