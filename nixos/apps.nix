{ pkgs, inputs, lib, ... }:
{

nixpkgs.config = {
	allowUnfree = true;
};

 environment.systemPackages = with pkgs; [
	wget
	alacritty	
	git
	mpv
	feh
	texlive.combined.scheme-full
	gcc
	cargo
    rustup
	discord
	zip
	pkgs.man-pages
	pkgs.man-pages-posix
	nmap
	xorg.xbacklight
	tor-browser-bundle-bin
	wireshark-qt
	htop
	iwd
	gnumake
	dunst
	openvpn
	python
	neofetch
	zip
	unzip
	fortune
	bintools-unwrapped
	virtualbox
    inetutils
    openvswitch
    unrar
    imagemagick
    gnupg
    pinentry
    dict
    android-studio
    android-tools
 ];


programs.gnupg.agent = {
   enable = true;
   pinentryFlavor = "curses";
   enableSSHSupport = true;
};

services.pcscd.enable = true;
documentation.dev.enable = true;


   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "kentagent" ];

}


