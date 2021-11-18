#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
   startx
fi
