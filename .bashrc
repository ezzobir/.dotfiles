#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# -----------------------------------------------------
# favorite editor
# -----------------------------------------------------

export EDITOR=vim

# -----------------------------------------------------
# This for rofi
# -----------------------------------------------------

export LC_ALL=C.UTF-8

# -----------------------------------------------------
# pacman
# -----------------------------------------------------

alias u='sudo pacman -Syu'
alias i='sudo pacman -S'
alias q='sudo pacman -Ss'
alias r='sudo pacman -Rns'

# -----------------------------------------------------
# yay
# -----------------------------------------------------

alias yu='yay -Syu'
alias yi='yay -S'
alias yq='yay -Ss'
alias yr='yay -Rns'

# -----------------------------------------------------
# paru
# -----------------------------------------------------

alias pu='paru -Sua'
alias pi='paru -S'
alias pq='paru -Ss'
alias pr='paru -Rns'

# -----------------------------------------------------
#terminal
# -----------------------------------------------------

alias c='clear'
alias e='exit'

# -----------------------------------------------------
# vim
# -----------------------------------------------------

alias vi='vim'

# -----------------------------------------------------
# neovim
# -----------------------------------------------------

alias v='nvim'

# -----------------------------------------------------
# emacs
# -----------------------------------------------------

alias em='emacs -nw'

# -----------------------------------------------------
# tty-clock
# -----------------------------------------------------

alias clock='tty-clock -c'

# -----------------------------------------------------
#see content
# -----------------------------------------------------

alias ll='ls -Fl'
alias la='ls -FAl'

# -----------------------------------------------------
# EDIT CONFIG FILES
# -----------------------------------------------------

alias confa='vim ~/.config/alacritty/alacritty.toml'
alias confb='vim ~/.bashrc'
alias confi3='vim ~/.config/i3/config'
alias confp='vim ~/.config/picom/picom.conf'

# -----------------------------------------------------
# Use Sioyek For PDF
# -----------------------------------------------------

alias pdf='sioyek --new-window'

# -----------------------------------------------------
# youtube-dlp
# -----------------------------------------------------

alias da='yt-dlp -x --audio-format mp3' 
alias dap='yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias dac='yt-dlp --extract-audio --audio-format mp3 --ignore-errors'
alias dv='yt-dlp -f mp4'
alias dvp='yt-dlp -o "%(playlist_index)s_%(title)s.%(ext)s" -f mp4 --yes-playlist'

# -----------------------------------------------------
# ytfzf
# -----------------------------------------------------

alias yt='ytfzf -t'

# -----------------------------------------------------
# Change wallpaper using feh
# -----------------------------------------------------

alias cw='DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/*.{jpg,png}'

# -----------------------------------------------------
# Use Vi Mode
# -----------------------------------------------------

set -o vi

# -----------------------------------------------------
# To Let yazi file manager change the directory 
# -----------------------------------------------------
function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# -----------------------------------------------------
# Use Starship
# -----------------------------------------------------

eval "$(starship init bash)"
