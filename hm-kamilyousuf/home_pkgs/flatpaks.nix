{config, pkgs, inputs, ...}:
{
  services.flatpak.enable = true;
  # Flatpaks for (most) GUI programs
  services.flatpak.packages = [
    "net.pcsx2.PCSX2"
    "net.lutris.Lutris"
    "io.gitlab.librewolf-community"
    "io.github.ungoogled_software.ungoogled_chromium"
    "org.duckstation.DuckStation"
    "io.github.Foldex.AdwSteamGtk"
    "org.flycast.Flycast"
    "com.github.wwmm.easyeffects"
    "com.usebottles.bottles"
    "com.valvesoftware.Steam"
    "com.github.Matoking.protontricks"
    "net.davidotek.pupgui2"
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
    "com.github.k4zmu2a.spacecadetpinball"
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
