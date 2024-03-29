# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  


  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.7"
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



  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
networking.wireless.userControlled.enable = true;
networking.wireless.userControlled.group = "network";
hardware.bluetooth.enable = true;
services.blueman.enable = true;



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

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "se";
    xkb.variant = "";
    videoDrivers = [ "amdgpu"];
  };

  # Configure console keymap
  console.keyMap = "sv-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kentagent = {
    isNormalUser = true;
    description = "kentagent";
    extraGroups = [ "networkmanager" "wheel" "docker" "netdev" "network" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
git
firefox
nginx
  #  wget
  ];


  # Enable the X11 windowing system.
  services.xserver = {
	enable = true;
	libinput.enable = true;
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

};

programs.light.enable = true;

  sound.enable = true;

  hardware.pulseaudio = {
    enable = true;
    extraModules = [ ];
    package = pkgs.pulseaudioFull;
  };


  services.nginx.appendConfig = ''
  stream {
    server {
      listen 4200;
      proxy_pass 192.168.49.2:32005;
    }
    server {
      listen 7000;
      proxy_pass 192.168.49.2:32000;
    }
    server {
      listen 7001;
      proxy_pass 192.168.49.2:32001;
    }
  }
  '';
services.nginx.enable = true;

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
  networking.firewall.allowedTCPPorts = [ 4200 7000 7001];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}
