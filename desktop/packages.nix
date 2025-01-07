{ config, lib, pkgs, inputs, ... }:

{
    
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
    gnome-weather gnome-connections 
  ];

  # Install fonts system-wide
  fonts.packages = with pkgs; [
      nerd-fonts.noto
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.ubuntu
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    gnome-tweaks
    # gnome-terminal
    ptyxis
    file
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
    pciutils
    glxinfo
    lshw
    lm_sensors
    dmidecode
    radeontop

    # (pkgs.callPackage ./custom_pkgs/rounded-window-corners-reborn.nix)
    # firefox
  ];

  # Enable Steam
  nixpkgs.config.allowUnfree = false;
  # programs = {
  #     gamescope = {
  #       enable = true;
  #       capSysNice = true;
  #     };
  #     steam = {
  #       enable = true;
  #       remotePlay.openFirewall = true;
  #       dedicatedServer.openFirewall = true;
  #       gamescopeSession.enable = true;
  #       protontricks = {
  #           enable = true;
  #       };
  #     };
  # };
}
