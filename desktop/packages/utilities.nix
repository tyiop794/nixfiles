{ config, lib, pkgs, inputs, ...}:
{
    services.flatpak.packages = [
        "io.github.Foldex.AdwSteamGtk"
        "com.github.wwmm.easyeffects"
        "com.github.tchx84.Flatseal"
        # "org.gnome.World.PikaBackup"
        # "org.libreoffice.LibreOffice"
        "io.appflowy.AppFlowy"
        "io.github.thetumultuousunicornofdarkness.cpu-x"
        # "com.github.joseexposito.touche"
    ];

  # Enable zsh
  programs.zsh.enable = true;

  # programs.direnv = {
  #     enable = true;
  #     enableZshIntegration = true;
  #     nix-direnv.enable = true;
  # };

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

    # additional utilities
    fzf
    ripgrep
    jq
    mozlz4a
    newsboat
    lf
    iotop
    ncdu
    glow
    tldr
    bottom
    unzip
    nix-tree
    mpi
    f3
    dig
    mediainfo
    solaar
    ltunify
    # ventoy-full

    tree
    fastfetch
    yt-dlp
    borgbackup
    verco
    universal-ctags

    # GUI programs
    anki
    vorta
    calibre

    # Have the 'open' utility?
    xdg-utils
    handlr-regex

    # Other utils
    # tmux
    # mpv
    # neovim

    # iPhone management software
    # libimobiledevice
    # idevicerestore
    # (pkgs.callPackage ./custom_pkgs/rounded-window-corners-reborn.nix)
    # firefox
  ];
}
