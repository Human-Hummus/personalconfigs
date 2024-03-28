{ config, pkgs, ... }:

{
	boot.kernelPackages = pkgs.pkgs.linuxPackages_zen;	
	networking.networkmanager.enable = true;
	time.timeZone = "America/Los_Angeles";
	i18n.defaultLocale = "en_US.UTF-8";
	i18n.extraLocaleSettings = {
		LC_ADDRESS = "en_US.UTF-8";
		LC_IDENTIFICATION = "en_US.UTF-8";
		LC_MEASUREMENT = "en_US.UTF-8";
		LC_MONETARY = "en_US.UTF-8";
		LC_NAME = "en_US.UTF-8";
		LC_NUMERIC = "en_US.UTF-8";
		LC_PAPER = "en_US.UTF-8";
		LC_TELEPHONE = "en_US.UTF-8";
		LC_TIME = "en_US.UTF-8";

	};
	#services.logind.lidSwitch = "suspend";
	virtualisation.virtualbox.host.enable = true;
	hardware.sane.enable = true;
	hardware.sane.brscan5.enable = true;
	services = {
		printing.enable = true;
		tlp.enable = true;
		printing.drivers = [ pkgs.brlaser pkgs.brgenml1lpr pkgs.hplip];
		xserver = {
			enable = true;
			layout = "us";
			xkbVariant = "";
			libinput.enable = true;};
		pipewire = {
			enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
			pulse.enable = true;};
	};
	powerManagement = {
		enable = true;
		powertop.enable = true;};
	programs = {
		steam.enable = true;
		htop.enable = true;
		waybar.enable = true;
		neovim = {
			configure = {
			customRC = (builtins.readFile ./nvim.vim);};
			enable = true;
			#plugins = with pkgs.vimPlugins; [
			#	nvim-cmp
			#	nvim-treesitter.withAllGrammars
			#];

		};
		hyprland = {
			enable = true;
			package = pkgs.hyprland;
			xwayland.enable = true;};
		fish = {
			enable = true;
			interactiveShellInit = ''
			set fish_greeting
			set fish_autosuggestion_enabled 0
			starship init fish | source
			export XZ_DEFAULTS="-9evv -T 0 "
			'';};};
	environment = {
		shellAliases = {
			ls = "eza --all --icons --color=always";
			lt = "eza --all --icons --color=always --tree";
			txz = "tar -cJf";
			xtz = "tar -xJf";
			rm = "trash-put";};
		sessionVariables = {
		};
		variables = {
			EDITOR = "nvim";
			PATH = ["/bin" "/usr/bin"];
			TERM = "foot";};};
	fonts.packages = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		liberation_ttf
		font-awesome
		(nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
		fira-code
		fira-code-symbols];
	sound.enable = true;
	security = {
		rtkit.enable = true;
		doas = {
			enable = true;
			extraRules = [{
				users = ["user"];
				keepEnv = true;
				persist = true;}];
		};
	};
	users.users.user = {
		isNormalUser = true;
		description = "Main user account.";
		extraGroups = [ "networkmanager" "wheel" "vboxusers" "cdrom" "scanner" "lp" ];
	};
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
android-studio
audacity
bat
bleachbit
blender
brave
brightnessctl
btop
calc
calcurse
cbatticon
cdrkit
clang
cmatrix
cura
curl
dash
davinci-resolve
discord
dunst
espeak-ng
eza
feh
ffmpeg-full
firefox
flameshot
fontforge
foot
freecad
gcc
ghc
gimp
git
gitui
glib
gnome.baobab
gnome.ghex
gnome.gnome-boxes
gnome.gnome-disk-utility
gnome.nautilus
gnome.simple-scan
gnumake
go
godot_4
gparted
gtk3
hardinfo
imagemagick
inkscape
jre8
kdenlive
kdevelop
keepassxc
killall
kitty
krita
libreoffice
librsvg
linuxKernel.packages.linux_zen.cpupower
lmms
lynx
mlocate
moc
mpg123
mpv
neofetch
nodejs
obs-studio
onlyoffice-bin
openjdk
openshot-qt
openssl_3
pandoc
pavucontrol
pngquant
prismlauncher
pulseaudio
qbittorrent
qutebrowser
ranger
rustup
starship
super-slicer
swaybg
tetex
thunderbird
tinycc
tor-browser
trash-cli
vlc
volantes-cursors
vscodium-fhs
webkitgtk
wget
wl-clipboard
wofi
yt-dlp
zig
zsh
(python311.withPackages(ps: with ps; [ pandas requests pyautogui pynput]))
	];
	system.stateVersion = "23.11";
}
