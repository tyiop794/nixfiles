{config, pkgs, inputs, ...}:
{
  imports = [
    ./flatpaks.nix
  ];
  home.packages = with pkgs; [
     tree
     fastfetch
     yt-dlp
     borgbackup
     jellyfin-mpv-shim

     # GUI programs
     anki
     vorta
     jellyfin-media-player

     #command-line tools
     gamescope
     fzf
     ripgrep
     jq
     mozlz4a
     newsboat
     lf
     ncdu
     glow
     tldr
     bottom
     unzip
     nix-tree
     mpi
     f3
     mediainfo

     # Have the 'open' utility?
     xdg-utils
     handlr-regex

     # This is stupid, but I couldn't help myself
     sl

     # nerd-fonts.noto
];

}
