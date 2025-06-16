# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./overlays.nix
      ./virtualisation.nix
      ./packages/packages.nix
      ./ld.nix
      # ./develop.nix
      # inputs.home-manager.nixosModules.home-manager
    ];


  # Use the latest linux kernel
  # Maybe not...it seems to be blowing up bluetooth for whatever reason...
  # boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.bluetooth.enable = true;
  # Enable fwupd
  services.fwupd.enable = true;

  # enable usbmuxd
  services.usbmuxd = {
    enable = false;
  };

  services.avahi.enable = true;
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Enable Mullvad VPN
  services.mullvad-vpn = {
  	enable = true;
	package = pkgs.mullvad-vpn;
  };
  services.resolved = {
    enable = true;
    extraConfig = (builtins.readFile ./resolved.conf);
    dnsovertls = "true";
  };

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Add myself as a trusted user
  nix.extraOptions = ''
    trusted-users = root kamilyousuf
  '';

  nix.registry.nixpkgs.flake = inputs.nixpkgs;


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
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;


  # Needed since the school's wifi does not support safe renegotiation
  # Create the OpenSSL configuration file
  # environment.etc."ssl/openssl-custom.cnf".text = ''
  #   openssl_conf = default_conf
  #
  #   [ default_conf ]
  #
  #   ssl_conf = ssl_sect
  #
  #   [ssl_sect]
  #
  #   system_default = ssl_default_sect
  #
  #   [ssl_default_sect]
  #
  #   Options = UnsafeLegacyRenegotiation
  # '';
  #
  # # Set environment variable to point OpenSSL to the custom config
  # environment.variables.OPENSSL_CONF = "/etc/ssl/openssl-custom.cnf";

  # Autologin, since our drive is encrypted
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "kamilyousuf";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  

  # Exclude xterm
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.desktopManager.xterm.enable = false;

  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # Disable pulseaudio
  services.pulseaudio.enable = false;
  
  # Enable pipewire
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Controller support (hopefully?)

  # Enable the fish shell
  programs.fish.enable = true;

  # Enable virtualization
  virtualisation.libvirtd = {
    enable = true;
  };

  users.groups.libvirt = {};
  programs.virt-manager.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kamilyousuf = {
    isNormalUser = true;
    extraGroups = [ "wheel"  "networkmanager" "libvirt" ]; # Enable ‘sudo’ for the user.
    # set an init password b/c root does not have one
    initialPassword = "dingus";
    # set our default shell
    shell = pkgs.zsh;
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


  # Change the default editor
  environment.variables.EDITOR = "nvim";

  # Enable zram
  zramSwap = {
    enable = true;
    memoryMax = 8192 * 1024 * 1024;
  };

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

  # Set up auto-updating
  # system.autoUpgrade = {
  #   enable = true;
  #   flake = inputs.self.outPath;
  #   flags = [
  #       "-L"
  #   ];
  #   dates = "weekly";
  #   randomizedDelaySec = "45min";
  # };

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

  # Dictionary support
  environment.etc."dict.conf".text = "server dict.org";

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

