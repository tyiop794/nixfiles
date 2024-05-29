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

     #command-line tools
     fzf
     ripgrep
     jq
     mozlz4a
     newsboat
     lf
     ncdu

     # GNOME shell extensions
     gnomeExtensions.night-theme-switcher
     gnomeExtensions.gsconnect
     gnomeExtensions.blur-my-shell

  ];
}
