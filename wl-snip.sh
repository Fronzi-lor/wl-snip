#!/bin/sh

# 1. Defaults
QUALITY=0
MODE="clipboard"
SAVE_DIR="$HOME/Pictures"
NOTIFY_TIMEOUT=1000
FILENAME_FORMAT="%Y-%m-%d_%H-%M-%S"

# 2. Load user config (if it exists)
[ -f "$HOME/.config/snip/config" ] && . "$HOME/.config/snip/config"

# 3. Flags override config
case "$1" in
  --file) MODE="file" ;;
  --clipboard) MODE="clipboard" ;;
  --color) MODE="color" ;;
esac

# 4. Actual action
selection="$(slurp)" || exit 1

if [ "$MODE" = "file" ]; then
    filename="$(date +"$FILENAME_FORMAT").png"
    grim -l "$QUALITY" -g "$selection" "$SAVE_DIR/$filename" &&
    notify-send -t "$NOTIFY_TIMEOUT" "Saved to $SAVE_DIR/$filename. Tot ziens!"
else
    grim -l "$QUALITY" -g "$selection" - | wl-copy &&
    notify-send -t "$NOTIFY_TIMEOUT" "Screenshot copied to wl-copy! Tot ziens!"
fi
