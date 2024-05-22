timezone="US/Mountain"


doas echo "has permissions"
echo "Timezone set: " $timezone
timezone=`printf "/usr/share/zoneinfo/%s" $timezone`
echo "Real timezone file: " $timezone



if [ $# -eq 1 ]; then
	echo "doing non-routine tasks"
	echo "changing ownerhip of /home/user to user"
	doas chown -R user /home/user
	echo "changing ownership of /configs to user"
	doas chown -R user /configs
	echo "making user's default shell bash"
	doas usermod --shell /bin/bash user
	echo "NPM install prettier"
	doas npm install prettier
	echo "Copying timezone"
	doas cp $timezone /etc/localtime
	echo "Configuring timezone with portage"
	doas emerge --config sys-libs/timezone-datadoa
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

echo "distributing nvim config"
rm -rf /home/user/.config/nvim
mkdir -p /home/user/.config/nvim
cp nvim.vim /home/user/.config/nvim/init.vim

echo "distributing portage files"
echo "distributing make.conf"
doas mkdir -p /etc/portage
doas cp make.conf /etc/portage

echo "distributing world file"
doas mkdir -p /var/lib/portage/
doas cp portage_world_file /var/lib/portage/world

echo "removing files that might be directories"
doas rm -rf /etc/portage/package.accept_keywords
doas rm -rf /etc/portage/package.use

echo "distributing package.use"
doas cp package.use /etc/portage

echo "distributing package.accept_keywords"
doas cp package.accept_keywords /etc/portage
