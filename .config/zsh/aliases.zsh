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
alias nvimconfig='cd $HOME/dotfiles/.config/nvim"'
alias wallpapers='cd "$HOME/Documents/Graphics/Wallpapers"'
alias downloads='cd "$HOME/Downloads"'
alias graphics='cd "$HOME/Documents/Graphics/"'

# Edit File
alias zshconfig='nvim ~/.zshrc'
alias ohmyzshconfig='nvim ~/.oh-my-zsh'
alias skhdconfig='nvim ~/.config/skhd/skhdrc'
alias zshaliases='nvim ~/dotfiles/.config/zsh/aliases.zsh'
alias zshfunc='nvim ~/dotfiles/.config/zsh/functions.zsh'

# QoL
alias vim='nvim'
alias timer="timr-tui"

# Misc
alias zshreload='exec zsh' # This sources zshrc and creates new zsh instance
