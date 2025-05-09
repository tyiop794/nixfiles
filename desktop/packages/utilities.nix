{ config, lib, pkgs, inputs, ...}:
{
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
    gnupg
    pinentry-all
    mangohud
    libva-utils
    # firefox
    librewolf
    brave
    git-lfs
    stow
    git-lfs-transfer
    git-filter-repo
    dict
    sshfs
    libimobiledevice
    ifuse
    idevicerestore
    usbmuxd
    compsize


    # (pkgs.callPackage ./custom_pkgs/rounded-window-corners-reborn.nix)
    # firefox
  ];
}
