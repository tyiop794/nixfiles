{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     tree
     fastfetch
     yt-dlp

     # GUI programs
     # note: for packages I commented out,
     # I will likely use flatpak versions instead of nix versions
     # qbittorrent
     # pika-backup
     # keepassxc
     # bitwarden-desktop
     # thunderbird
     # discord
     # dolphin-emu
     # spotify
     # anki
     # tor-browser
     # libreoffice
     # slack
     # space-cadet-pinball
     # adwsteamgtk

     #command-line tools
     fzf
     ripgrep
     jq
     mozlz4a
     newsboat
     lf
     ncdu
     # bitwarden-cli
     sl

     # Nerd fonts
     nerdfonts

  ];

  services.flatpak.packages = [
    "us.zoom.Zoom"
  ];

}
