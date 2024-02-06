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
	pkgs.man-pages
	pkgs.man-pages-posix
	nmap
	xorg.xbacklight
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
    unrar
    imagemagick
    gnupg
    pinentry-qt
    dict
    libnotify
    networkmanagerapplet
    steam
    steam-run
    prismlauncher

    discord
    zoom-us

    xdg-utils
    xdg-user-dirs
    zotero

    cmake
    busybox

    ollama
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
hardware.opengl.driSupport32Bit = true; # Enables support for 32bit libs that steam uses

environment.etc."dict.conf".text = "server dict.org";


   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "kentagent" ];

}


