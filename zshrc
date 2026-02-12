# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# ==Compilation flags==
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#


# ==Aliases==
alias zshconfig='nvim ~/.zshrc'
alias ohmyzsh='nano ~/.oh-my-zsh'
alias icloud='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
alias obsidian='cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Atlas"'
alias home='cd ~'
alias zshreload='exec zsh'
alias dotfiles='cd ~/dotfiles'

alias obs_push='cd "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Atlas" && git add . && git commit -m "Obsidian sync $(date +%d-%h-%Y_%H-%M-%S)" && git push origin main'
alias yabaiconfig='cd "$HOME/dotfiles/.config/yabai"'
alias skhdconfig='nvim ~/.config/skhd/skhdrc'
alias sketchybarconfig='cd "$HOME/dotfiles/.config/sketchybar"'
alias kittyconfig='cd "$HOME/dotfiles/.config/kitty"'
alias fastfetchconfig='cd "$HOME/dotfiles/.config/fastfetch"'
alias vim='nvim'
alias ls='ls -a'

# ==Functions==

# eza tree
eza_tree(){
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

# Push the currect branch of dotiles to my GitHub with a message and a date stamp
dot_push(){
	cd "$HOME/dotfiles"
	git add .
	local msg="$*"
	if [[ -z "$msg" ]]; then
		msg="Dotfiles sync $(date +%d-%h-%Y_%H-%M-%S)"
	fi
	git commit -m "$msg"
	git push 
}


# Plugins
# syntax highlighting:
plugins=( 
    # other plugins...
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# zsh-vi-mode 
source "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
