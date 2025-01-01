# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./samba.nix
      ./docker.nix
      # inputs.home-manager.nixosModules.home-manager
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "dingusrv"; # Define your hostname.

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Enable Mullvad VPN
	#  services.mullvad-vpn = {
	#  	enable = true;
	# package = pkgs.mullvad-vpn;
	#  };
  # services.resolved.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Add myself as a trusted user
  nix.extraOptions = ''
    trusted-users = root kamilyousuf
  '';

  nixpkgs.config.packageOverrides = pkgs: rec {
    wpa_supplicant = pkgs.wpa_supplicant.overrideAttrs (attrs: {
        patches = attrs.patches ++ [ ./eduroam.patch ];
    });
  };

  # nixpkgs.overlays = [
  #   # (self: super: {
  #   #     flatpak = flatpak_nixpkgs.flatpak;
  #   # })
  #   # (self: super: {
  #   #     ostree = flatpak_nixpkgs.ostree;
  #   # })
  # ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # systemd.services."getty@tty1".enable = false;
  # systemd.services."autovt@tty1".enable = false;
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kamilyousuf = {
    isNormalUser = true;
    extraGroups = [ "wheel"  "networkmanager" ];
    # set an init password b/c root does not have one
    initialPassword = "dingus";
  };

  # home-manager = {
  #    extraSpecialArgs = { inherit inputs; };
  #    users = {
  #      kamilyousuf = import ./hm-kamilyousuf/home.nix;
  #    };
  # };
  # Disable the root account
  users.users.root.hashedPassword = "!";

  # generate man caches
  documentation.man.generateCaches = true;
  #programs.man.generateCaches = true;

  # Enable flakes and nix-command
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    # gnome-terminal
    file
    curl
    lsb-release
    powertop
    killall
    htop
    pciutils
    borgbackup
    fastfetch

    # (pkgs.callPackage ./custom_pkgs/rounded-window-corners-reborn.nix)
    # firefox
  ];

  # Enable Steam
  nixpkgs.config.allowUnfree = false;
  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  # };

  # Change the default editor
  environment.variables.EDITOR = "vim";

  # Enable zram
  zramSwap.enable = true;

  # Enable systemd-oomd
  systemd.oomd = {
    enable = true;
    enableRootSlice = true;
    enableSystemSlice = true;
    enableUserSlices = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Disable the lid switch
  services.logind.lidSwitch = "ignore";

  # Collect the garbage after a week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Enable firewall
  networking.firewall.enable = true;


  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?

}

