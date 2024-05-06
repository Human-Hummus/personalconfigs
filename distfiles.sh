doas echo "has permissions"

if [ $# -eq 1 ]; then
	doas chown -R user /home/user
	doas chown -R user /configs
	doas chmod +x /configs/rofi_scripts/special_chars.py
	doas usermod --shell /bin/bash user
	doas cp doas.conf /etc/doas.conf
fi

rm /home/user/.config/hypr/hyprland.conf
mkdir -p /home/user/.config/hypr/
cp /configs/hyprland.conf /home/user/.config/hypr/hyprland.conf 


rm /home/user/.config/waybar -r
cp waybar /home/user/.config/ -r


mkdir -p /home/user/.config/fish
cp config.fish /home/user/.config/fish/

doas mkdir -p /etc/portage
doas cp make.conf /etc/portage

