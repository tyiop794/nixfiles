{config, pkgs, inputs, ...}:
{
  # imports = [inputs.nix-flatpak.homeManagerModules.nix-flatpak];
  home.packages = with pkgs; [
     tree
     fastfetch
     yt-dlp
     borgbackup

     # GUI programs
     # note: for packages I commented out,
     # I will likely use flatpak versions instead of nix versions
     # especially since many of these programs are closed source
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

     # GUI programs
     anki
     higan
     vorta

     #command-line tools
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

     # Have the 'open' utility?
     xdg-utils
     handlr-regex

     # This is stupid, but I couldn't help myself
     sl

     # nerd-fonts.noto
];

  services.flatpak.enable = true;
  # Flatpaks for (most) GUI programs
  services.flatpak.packages = [
    "net.pcsx2.PCSX2"
    "org.duckstation.DuckStation"
    "io.github.Foldex.AdwSteamGtk"
    "org.flycast.Flycast"
    "com.github.wwmm.easyeffects"
    "com.usebottles.bottles"
    "com.valvesoftware.Steam"
    "runtime/org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/24.08"
    "org.libretro.RetroArch"
    "com.github.tchx84.Flatseal"
    "us.zoom.Zoom"
    "org.gnome.World.PikaBackup"
    "com.discordapp.Discord"
    "org.DolphinEmu.dolphin-emu"
    "com.slack.Slack"
    "com.ticktick.TickTick"
    "com.rtosta.zapzap"
    "org.inkscape.Inkscape"
    "org.gimp.GIMP"
    "org.libreoffice.LibreOffice"
    "org.qbittorrent.qBittorrent"
    "com.github.iwalton3.jellyfin-media-player"
    "fr.handbrake.ghb"
    "org.torproject.torbrowser-launcher"
    "dev.geopjr.Tuba"
    "com.github.finefindus.eyedropper"
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
