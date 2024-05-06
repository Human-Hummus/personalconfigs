

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
	hardware.sane.enable = true;
	hardware.sane.brscan5.enable = true;
	services = {
		preload.enable = true;
		upower.enable = true;
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
		java.enable = true;
		starship.enable=true;
		waybar.enable = true;
		git.enable = true;
		neovim = {
			configure = {
			    packages.myVimPackage = with pkgs.vimPlugins; {
      			    start = [ vim-prettier vim-airline];
    			};
			customRC = (builtins.readFile ./nvim.vim);};
			enable = true;

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
			mv = "mv -v";
			cp = "cp -rv";
			txz = "tar -cJf";
			xzt = "tar -xJf";
			rm = "trash-put";};
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
	nixpkgs.config = {
		allowUnfree = true;
		warnUndeclaredOptions = true;
		packageOverrides = pkgs: {
			git = pkgs.git.override{
				guiSupport=false;
				tk=false;
				tcl=false;
			};
			ffmpeg = pkgs.ffmpeg.override {
				ffmpegVariant = "full";
				withBzlib = true;
				withDrm = false;

				withSafeBitstreamReader = true;
				withMultithread = true;
				withNetwork = true;
				withPixelutils = true;
				buildAvcodec = true;
				buildAvdevice = true;
				buildAvfilter = true;
				buildAvformat = true;
				buildAvresample = true;
				withMfx = false;
				withNvenc = false;
				withNvdec = false;
				withCuda = false;
				withCudaLLVM = false;

				withHardcodedTables = true;
				withUnfree = true;
			};
		};
	};
	environment.systemPackages = with pkgs; [
		(python311.withPackages(ps: with ps; [ pandas requests pyautogui pynput pygame]))
		audacity
		powertop
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
		yambar
		dunst
		espeak-ng
		f3
		zoxide
html-tidy
		flameshot
		eza
		feh
		ffmpeg
		firefox
		fontforge
		foot
		vimPlugins.vim-prettier
		nodePackages.prettier
		freecad
		gcc
		tlp
		ghc
		gimp
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
		jpegoptim
		jre8
		kdenlive
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
		pulseaudio
		starship
		mpg123
		mpv
		neofetch
		nodejs
		obs-studio
		onlyoffice-bin
		openjdk
		pandoc
		pavucontrol
		pngquant
		prismlauncher
		qbittorrent
		qutebrowser
		ranger
		rustup
		super-slicer
		swaybg
		tetex
		tinycc
		tor-browser
		trash-cli
		vlc
		volantes-cursors
		wget
		wl-clipboard
		wofi
		yt-dlp
		zig
	];
	system.stateVersion = "23.11";
}
