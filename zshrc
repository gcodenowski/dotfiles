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
ZSH_THEME="obraun"
# ZSH_THEME="gallois"

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

# zsh plugins
# syntax highlighting:
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-vi-mode 
source "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" 
