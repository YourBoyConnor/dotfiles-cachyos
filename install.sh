#!/usr/bin/env bash

echo "🚀 CachyOS Configuration Restore Script"
echo ""

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo "📦 Installing GNU Stow..."
    sudo pacman -S --needed stow
fi

cd ~/dotfiles

echo "📁 Available configurations:"
for dir in */; do
    if [ -d "$dir" ] && [ "$dir" != "system/" ]; then
        echo "  - ${dir%/}"
    fi
done

echo ""
read -p "Stow all configurations? (y/n): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "🔧 Stowing all configurations..."
    for dir in */; do
        if [ -d "$dir" ] && [ "$dir" != "system/" ]; then
            stow "${dir%/}" && echo "  ✓ Stowed ${dir%/}" || echo "  ✗ Failed to stow ${dir%/}"
        fi
    done
else
    echo "To manually stow configs, run: stow <config-name>"
    echo "Example: stow hyprland"
fi

echo ""
echo "⚠️  Remember to restore system configs manually with sudo!"
echo "See README.md for details."

