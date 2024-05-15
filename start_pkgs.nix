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

     #command-line tools
     fzf
     ripgrep
     jq
     mozlz4a
     bat
  ];
}
