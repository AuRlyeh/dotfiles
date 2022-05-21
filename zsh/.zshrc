# Commands aliases
source "$XDG_CONFIG_HOME/zsh/aliases"
# Vim navigation
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
# Autocomplete
autoload -U compinit; compinit
# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup
# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT
# Vi mode
bindkey -v
export KEYTIMEOUT=1
# Change cursor in INSERT mode
autoload -Uz cursor_mode && cursor_mode
# Use Neovim to edit command line
# v in NORMAL mode to open Neovim
# :wq to return to zsh with command edited in Neovim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
# Change to grand-parent directories
source ~/dotfiles/zsh/external/bd.zsh
# Custom scripts
source $DOTFILES/zsh/scripts.sh
# Application fzf
if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi
# Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Start X
if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
# Rebind Clear screen
bindkey -r '^l'
bindkey -r '^g'
bindkey '^g' .clear-screen
bindkey -M vicmd '^g' .clear-screen
