{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     tree
     fastfetch
     yt-dlp

     # GUI programs
     qbittorrent
     pika-backup
     keepassxc
     firefox
     thunderbird
     discord
     dolphin-emu
     spotify
     anki
     tor-browser
     libreoffice
     slack
     space-cadet-pinball
     adwsteamgtk

     #command-line tools
     fzf
     ripgrep
     jq
     mozlz4a
     newsboat
     lf
     ncdu
     bitwarden-cli

     # Nerd fonts
     nerdfonts

  ];
}
