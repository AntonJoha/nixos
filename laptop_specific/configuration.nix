# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{
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

  networking.hostName = "kentagent"; # Define your hostname.
  # Pick only one of the below networking options.
networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
networking.wireless.userControlled.enable = true;
networking.wireless.userControlled.group = "network";
hardware.bluetooth.enable = true;
services.blueman.enable = true;


hardware.bluetooth.settings = {
  General = {
    Enable = "Source,Sink,Media,Socket";
  };
};

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.

i18n.defaultLocale = "sv_SE.UTF-8";

#console.font = "Lat2-Terminus16";
#console.keyMap = "sv-latin1";

  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;
	
	desktopManager = {
		xterm.enable = false;
	};

	displayManager = {
		defaultSession = "none+i3";
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

	layout = "se";
	xkbOptions = "eurosign:e";
};

  

  # Configure keymap in X11
#services.xserver.layout = "sv-latin1";
  # services.xserver.xkbOptions = {
  #   "eurosign:e";
  #   "caps:escape" # map caps to escape.
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    extraModules = [ ];
    package = pkgs.pulseaudioFull;
  };



  # Enable touchpad support (enabled default in most desktopManager).
services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
 users.users.kentagent = {
   isNormalUser = true;
   extraGroups = [ "wheel" "docker" "netdev" "vboxusers" "network"]; # Enable ‘sudo’ for the user.
   packages = with pkgs; [
     firefox
    ];
    initialPassword = "pass";
 };

  # List packages installed in system profile. To search, run:
  # $ nix search wget

programs.light.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?


  nixpkgs.overlays = let
    nix-matlab = import (builtins.fetchTarball "https://gitlab.com/doronbehar/nix-matlab/-/archive/master/nix-matlab-master.tar.gz");
  in [
    nix-matlab.overlay
    (
      final: prev: {
        # Your own overlays...
      }
    )
  ];



}


