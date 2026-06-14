# zmodload zsh/zprof # uncomment for loading time testing

# Path to my Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PICO_SDK_PATH="$HOME/pico-sdk"

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
# ZSH_THEME="obraun" -- that's my most recent
# ZSH_THEME="gallois"
# Theme is disabled now as I'm using starship anyway

# Autoupdate every 2 weeks
zstyle ':omz:update' frequency 14

# Plugins
plugins=(git colored-man-pages eza macos)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# ==Compilation flags==
# export ARCHFLAGS="-arch $(uname -m)"

# zsh plugins
# syntax highlighting:
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# zsh autosuggestions
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# zsh-vi-mode 
source "$(brew --prefix)/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh" 

# starship
eval "$(starship init zsh)"

# lazy-loading NVM, only sourcing it on the first call
export NVM_DIR="$HOME/.nvm"
nvm() {
  unfunction nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
  nvm "$@"
}
node() { nvm; node "$@"; }
npm()  { nvm; npm  "$@"; }
npx()  { nvm; npx  "$@"; }


# zprof # uncomment for loading time testing
