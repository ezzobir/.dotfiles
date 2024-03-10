#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

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
#terminal
# -----------------------------------------------------

alias c='clear'
alias e='exit'

# -----------------------------------------------------
# vim
# -----------------------------------------------------

alias v='vim'

# -----------------------------------------------------
# neovim
# -----------------------------------------------------

alias nv='nvim'

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

alias confq='vim ~/.config/qtile/config.py'
alias confi3='vim ~/.config/i3/conf'
alias confb='vim ~/.bashrc'

# -----------------------------------------------------
# Use Zathura For PDF
# -----------------------------------------------------

alias pdf='zathura'

# -----------------------------------------------------
# youtube-dlp
# -----------------------------------------------------

alias da='cd /home/ezzobir/Downloads/output_audio; yt-dlp -x --audio-format mp3' 
alias dap='cd /home/ezzobir/Downloads/output_audio; yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias dv='yt-dlp -f mp4'
alias dvp='yt-dlp -o "%(playlist_index)s_%(title)s.%(ext)s" -f mp4 --yes-playlist'

# -----------------------------------------------------
# Change wallpaper using feh
# -----------------------------------------------------

alias cw='DISPLAY=:0 feh --no-fehbg --bg-fill --randomize ~/Pictures/wallpapers/*.{png,jpg}'

# -----------------------------------------------------
# Use Vi Mode
# -----------------------------------------------------

set -o vi

# -----------------------------------------------------
# Use Starship
# -----------------------------------------------------

eval "$(starship init bash)"
