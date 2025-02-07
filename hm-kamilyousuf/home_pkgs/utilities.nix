{config, pkgs, inputs, ...}:
{
    services.flatpak.packages = [
        "io.github.Foldex.AdwSteamGtk"
        "com.github.wwmm.easyeffects"
        "com.github.tchx84.Flatseal"
        "org.gnome.World.PikaBackup"
        "org.libreoffice.LibreOffice"
        "io.appflowy.AppFlowy"
        "io.github.thetumultuousunicornofdarkness.cpu-x"
    ];
    home.packages = with pkgs; [
        # additional utilities
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
         solaar
         ltunify
         ventoy-full

         tree
         fastfetch
         yt-dlp
         borgbackup
         universal-ctags

         # GUI programs
         anki
         vorta

         # Have the 'open' utility?
         xdg-utils
         handlr-regex

         # This is stupid, but I couldn't help myself
         sl
    ];
}
