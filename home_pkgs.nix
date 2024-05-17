{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     tree
     fastfetch
     mpv
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
     bat
     newsboat
     lf
     tmux

     # GNOME shell extensions
     gnomeExtensions.night-theme-switcher
     gnomeExtensions.gsconnect

  ];
}
