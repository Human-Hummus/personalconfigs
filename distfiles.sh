doas echo "has permissions"

if [ $# -eq 1 ]; then
	echo "doing non-routine tasks"
	echo "changing ownerhip of /home/user to user"
	doas chown -R user /home/user
	echo "changing ownership of /configs to user"
	doas chown -R user /configs
	echo "making user's default shell bash"
	doas usermod --shell /bin/bash user
fi

echo "distributing routine files"


echo "distributing doas config file"
doas cp doas.conf /etc/doas.conf


echo "distributing hyprland config file"
rm /home/user/.config/hypr/hyprland.conf
mkdir -p /home/user/.config/hypr/
cp /configs/hyprland.conf /home/user/.config/hypr/hyprland.conf 

echo "distributing waybar config"
rm /home/user/.config/waybar -r
cp waybar /home/user/.config/ -r

echo "distributing fish config"
mkdir -p /home/user/.config/fish
cp config.fish /home/user/.config/fish/


echo "distributing portage files"
echo "distributing make.conf"
doas mkdir -p /etc/portage
doas cp make.conf /etc/portage

echo "distributing world file"
doas mkdir -p /var/lib/portage/
doas cp portage_world_file /var/lib/portage/world
