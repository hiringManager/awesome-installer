#!/bin/bash
# select_theme.sh — Set theme in rc.lua

set -e

AWESOME_CONFIG="$HOME/.config/awesome/rc.lua"

if [ ! -f "$AWESOME_CONFIG" ]; then
    echo "❌ rc.lua not found at $AWESOME_CONFIG"
    echo "👉 Please symlink ~/dotfiles/.config/awesome first!"
    exit 1
fi

echo ""
echo "🚀 Available themes:"
themes=(ephemeral mirage multicolor minimalist cyberpunk monochrome rice rose-pine)

select theme in "${themes[@]}"; do
    if [[ -n "$theme" ]]; then
        echo "✅ Setting theme to '$theme'..."
        sed -i "s|beautiful.init(gears.filesystem.get_configuration_dir().*|beautiful.init(gears.filesystem.get_configuration_dir() .. \"themes/$theme/theme.lua\")|" "$AWESOME_CONFIG"
        echo "✅ Theme set to '$theme'!"
        echo "👉 Reload AwesomeWM (Mod4 + Ctrl + R) to apply."
        break
    else
        echo "❌ Invalid selection. Try again."
    fi
done

