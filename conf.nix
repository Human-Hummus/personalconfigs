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
	virtualisation.virtualbox.host.enable = true;
	services = {
		printing.enable = true;
		tlp.enable = true;
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
		hyprland = {
			enable = true;
			package = pkgs.hyprland;
			xwayland.enable = true;};
		fish = {
			enable = true;
			interactiveShellInit = ''
			set fish_greeting
			starship init fish | source
			set fish_autosuggestion_enabled 0
			'';};};
	environment = {
		shellAliases = {
			ls = "eza --all --icons --color=always";
			lt = "eza --all --icons --color=always --tree";
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
		extraGroups = [ "networkmanager" "wheel" "vboxusers" "cdrom" ];
	};
	nixpkgs.config.allowUnfree = true;
	environment.systemPackages = with pkgs; [
		espeak-ng
		hardinfo
		keepassxc
		brightnessctl
		cmatrix
		kdenlive
		blender
		feh
		gimp
		super-slicer
		audacity
		lmms
		neofetch
		trash-cli
		obs-studio
		calcurse
		neovim
		cargo
		git
		gnumake
		firefox
		libreoffice
		thunderbird
		dash
		pandoc
		godot_4
		ghc
		go
		krita
		cdrkit
		python3
		tinycc
		zig
		android-studio
		gitui
		foot
		starship
		zsh
		gnome.nautilus
		gnome.baobab
		gnome.ghex
		gnome.gnome-boxes
		gnome.gnome-disk-utility
		wl-clipboard
		swaybg
		waybar
		gcc
		clang
		linuxKernel.packages.linux_zen.cpupower
		btop
		tetex
		brave
		lynx
		qutebrowser
		tor-browser
		cbatticon
		dunst
		gnome.gnome-boxes
		pavucontrol
		pulseaudio
		moc
		mpg123
		killall
		ffmpeg-full
		mpv
		obs-studio
		yt-dlp
		qbittorrent
		calc
		bat
		bleachbit
		eza
		mlocate
		gparted
		openjdk
		rustc
		wofi
		prismlauncher
	];
	system.stateVersion = "23.11";
}
