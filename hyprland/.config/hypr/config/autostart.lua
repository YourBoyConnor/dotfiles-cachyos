-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("xhost +SI:localuser:root")
    hl.exec_cmd("discord")
    hl.exec_cmd("spotify")
    hl.exec_cmd("firefox")
    hl.exec_cmd("steam -silent")
    hl.exec_cmd("openrgb --startminimized --profile desktop")
    hl.exec_cmd("/home/cpymm/.local/bin/wp-hotplug")
end)
