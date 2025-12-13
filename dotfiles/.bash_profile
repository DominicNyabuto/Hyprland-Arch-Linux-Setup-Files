#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start Hyprland automatically if logged into tty1
if [ -z "$DISPLAY" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec Hyprland
fi
