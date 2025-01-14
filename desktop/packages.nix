{ config, lib, pkgs, inputs, ... }:

{
  # Enable Steam
  nixpkgs.config.allowUnfree = true;
  programs = {
      gamescope = {
        enable = true;
        capSysNice = true;
      };
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
        protontricks = {
            enable = true;
        };
      };
  };
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
    file
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
    appimage-run

    # (pkgs.callPackage ./custom_pkgs/rounded-window-corners-reborn.nix)
    # firefox
  ];

}
