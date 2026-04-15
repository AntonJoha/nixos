# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{


  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.8"
  ];
            



  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nixos/nvim.nix
      ./nixos/apps.nix
      ./nixos/python.nix
      ./nixos/cronjob.nix
      ./nixos/work.nix
    ];



  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
hardware.bluetooth.enable = true;
services.blueman.enable = true;
systemd.services.systemd-udevd.restartIfChanged = false;


  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };


  console.keyMap = "sv-latin1";




  nixpkgs.config.allowBroken = true;
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  hardware.enableAllFirmware = true;

  services.pulseaudio = {
    enable = false;
    extraModules = [ ];
    package = pkgs.pulseaudioFull;
  };

services.pulseaudio.extraConfig = ''
  load-module module-alsa-sink device=hw:0,0 channels=4
  load-module module-alsa-source device=hw:0,7 channels=4
  '';


  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
 users.users.kentagent = {
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "networkmanager" "docker" "netdev" "network" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       firefox
       tree
       brightnessctl
       rmview
git
     ];
   };

   environment.systemPackages = with pkgs; [
     vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     wget
   ];


    services.displayManager = {
      defaultSession = "none+i3";
    };


  services.xserver = {
    enable = true;


xkb.layout = "se";
    xkb.variant = "";
    desktopManager = {
      xterm.enable = false;
    };
    
    windowManager.i3 = {

   enable = true;
        extraPackages = with pkgs; [
            dmenu
            i3status
            i3lock
            i3blocks
        ];
    };

  };
   
  services = {
	libinput.enable = true;
};

   system.stateVersion = "24.05"; # Did you read the comment?

}

