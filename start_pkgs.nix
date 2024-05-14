{config, pkgs, ...}:
{
  home.packages = with pkgs; [
     firefox
     tree
     neovim
     fastfetch
     mpv
     yt-dlp

     # GUI programs
     fragments
     pika-backup
     keepassxc

     #command-line tools
     fzf
     ripgrep
     jq
     lz4json
  ];
}
