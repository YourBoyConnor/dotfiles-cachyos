# CachyOS Configuration Backup

Personal CachyOS/Hyprland configuration backed up on 2026-02-03

## System Specs
- **OS**: CachyOS Linux
- **WM**: Hyprland
- **Shell**: Fish
- **Terminal**: Kitty
- **GPU**: Intel integrated + NVIDIA discrete (Optimus)

## Quick Restore

### 1. Install base system
Install CachyOS with basic packages.

### 2. Install packages
\`\`\`bash
# Install paru if not already installed
sudo pacman -S paru

# Restore official packages
paru -S --needed - < pkglist.txt

# Restore AUR packages
paru -S --needed - < aurlist.txt
\`\`\`

### 3. Install GNU Stow
\`\`\`bash
sudo pacman -S stow
\`\`\`

### 4. Restore configurations
\`\`\`bash
cd ~/dotfiles

# Stow individual configs (recommended - do one at a time)
stow hyprland
stow waybar
stow fish
stow kitty
# ... etc

# Or stow everything at once
stow */
\`\`\`

### 5. Restore system configs (requires sudo)
\`\`\`bash
# SDDM
sudo cp -r system/sddm.conf.d/* /etc/sddm.conf.d/

# Xorg/Nvidia
sudo cp -r system/xorg.conf.d/* /etc/X11/xorg.conf.d/

# GRUB (then run sudo grub-mkconfig -o /boot/grub/grub.cfg)
sudo cp system/grub /etc/default/grub
\`\`\`

### 6. Reboot
\`\`\`bash
sudo reboot
\`\`\`

## Notes
- GPU switching configured for Intel/NVIDIA Optimus
- SDDM configured to use Wayland with Hyprland
- Fish shell with custom functions and variables
- DisplayLink support for external monitors

## Backup Date
Tue Feb  3 12:16:40 AM EST 2026

