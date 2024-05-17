{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     tree
     neovim
     fastfetch
     mpv
     yt-dlp

     # GUI programs
     fragments
     pika-backup
     keepassxc
     firefox
     thunderbird
     discord
     dolphin-emu
     spotify
     anki
     tor-browser

     #command-line tools
     fzf
     ripgrep
     jq
     mozlz4a
     bat
     newsboat
     lf

     # GNOME shell extensions
     gnomeExtensions.night-theme-switcher
     gnomeExtensions.gsconnect

  ];
}
