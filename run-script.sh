#!/bin/bash

SCRIPTS_DIR="$HOME/dotfiles/script-manager/.config/script-manager"

chosen=$(ls "$SCRIPTS_DIR" | rofi -dmenu -p "▶ Run script")
[ -z "$chosen" ] && exit 0

script="$SCRIPTS_DIR/$chosen"
chmod +x "$script"

# i3-sensible-terminal tự chọn terminal bạn đang dùng
i3-sensible-terminal -e bash -c "$script; echo; read -rp 'touch Enter to close tab...'"
