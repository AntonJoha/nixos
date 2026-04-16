{ pkgs, inputs, lib, ... }:
{

nixpkgs.config = {
	allowUnfree = true;
};

 environment.systemPackages = with pkgs; [
   nodejs
   pylint
   ffmpeg
   google-chrome
    zathura
    wget
	alacritty
	git
	mpv
	feh
	texlive.combined.scheme-full
	gcc
	pkgs.man-pages
	pkgs.man-pages-posix
	nmap
	htop
	iwd
	gnumake
	dunst
	python3
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
    edwood
    xdg-utils
    xdg-user-dirs
    zotero

    cmake
    busybox

    ollama

    via
    cloudflared

    libreoffice

    scrcpy

    slack

    gimp

    restream
    newsboat

    whatsapp-electron
    (vale.withStyles (s: [ s.alex s.google s.write-good s.proselint]))


    manim

    github-copilot-cli
 ];

services.pcscd.enable = true;
documentation.dev.enable = true;

programs.steam = {
  enable = true;
  remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
};
hardware.graphics.enable32Bit = true; # Enables support for 32bit libs that steam uses

environment.etc."dict.conf".text = "server dict.org";

   virtualisation.virtualbox.host.enable = true;
   users.extraGroups.vboxusers.members = [ "kentagent" ];

}
