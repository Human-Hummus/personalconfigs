doas echo "has permissions"

doas chown -R user /home/user
doas chown -R user /etc/nixos/configs

rm /home/user/.config/hypr/hyprland.conf
mkdir -p /home/user/.config/hypr/
cp /etc/nixos/configs/hyprland.conf /home/user/.config/hypr/hyprland.conf 


rm /home/user/.config/waybar -r
cp waybar /home/user/.config/ -r