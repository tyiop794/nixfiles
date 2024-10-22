# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # inputs.home-manager.nixosModules.home-manager
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Indicate that our drive is encrypted
  boot.initrd.luks.devices = {
   root = {
     device = "/dev/nvme0n1p2";
     preLVM = true;
    };
  };
  networking.hostName = "tardis"; # Define your hostname.

  # Enable fwupd
  services.fwupd.enable = true;

  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Enable Mullvad VPN
  services.mullvad-vpn = {
  	enable = true;
	package = pkgs.mullvad-vpn;
  };
  services.resolved.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Add myself as a trusted user
  nix.extraOptions = ''
    trusted-users = root kamilyousuf
  '';

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
  # services.flatpak.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable gnome keyring
  security.pam.services.gdm.enableGnomeKeyring = true;

  # Autologin, since our drive is encrypted
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "kamilyousuf";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  
  # Exclude certain GNOME packages
  environment.gnome.excludePackages = with pkgs; [
    baobab      # disk usage analyzer
    cheese      # photo booth
    eog         # image viewer
    epiphany    # web browser
    gedit       # text editor
    simple-scan # document scanner
    totem       # video player
    yelp        # help viewer
    geary       # email client
    seahorse    # password manager
    gnome-console
    snapshot # camera program
    gnome-tour
    gnome-software

    # these should be self explanatory
    gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-contacts
    gnome-font-viewer gnome-logs gnome-maps gnome-music gnome-photos gnome-screenshot
    gnome-weather gnome-disk-utility gnome-connections 
  ];

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
  hardware.pulseaudio.enable = false;
  
  # Enable pipewire
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Controller support (hopefully?)
  services.udev.extraRules = ''
    ${builtins.readFile ./controllers/70-steam-input.rules}
    ${builtins.readFile ./controllers/70-steam-vr.rules}
  '';

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
    shell = pkgs.fish;
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
    gnome-tweaks
    # gnome-terminal
    ptyxis
    gnome-power-manager
    gnome-themes-extra
    gnome-extension-manager
    powertop
    curl
    openfortivpn
    dconf-editor
    lsb-release
    powertop
    home-manager
    wl-clipboard
    killall
    htop
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
  environment.variables.EDITOR = "nvim";

  # Enable zram
  zramSwap.enable = true;

  # Enable systemd-oomd
  systemd.services.oomd = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };

  # Enable and configure TLP
  services.tlp = {
    enable = true;
    settings = {
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";
    };
  };
  services.power-profiles-daemon.enable = false;

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
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
        "--update-input"
        "nixpkgs"
        "--no-write-lock-file"
        "-L"
    ];
    dates = "20:00";
    randomizedDelaySec = "45min";
  };

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

