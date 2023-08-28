{ pkgs, inputs, lib, ... }:
{

nixpkgs.config = {
	allowUnfree = true;
};

 environment.systemPackages = with pkgs; [
    zathura
    wget
	alacritty	
	git
	mpv
	feh
	texlive.combined.scheme-full
	gcc
    rustup
	discord
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
	python
	zip
	unzip
	bintools-unwrapped
	virtualbox
    inetutils
    openvswitch
    unrar
    imagemagick
    gnupg
    pinentry-qt
    dict
    libnotify
    tut
    networkmanagerapplet
    element-desktop
    steam
    slack
    prismlauncher
    python310Packages.tkinter
    fortune
    zoom-us

    gradle
    zotero

    jekyll

    qmk

    whatsapp-for-linux
    cmake

 ];


programs.gnupg.agent = {
   enable = true;
   pinentryFlavor = "curses";
   enableSSHSupport = true;
};

services.pcscd.enable = true;
documentation.dev.enable = true;


programs.steam = {
  enable = true;
  remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};



   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "kentagent" ];

}


