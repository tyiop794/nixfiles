{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
     gamescope
     dolphin-emu
     simple64
    ];
    services.flatpak.packages = [
        "org.duckstation.DuckStation"
        "net.pcsx2.PCSX2"
        "dev.ares.ares"
        "net.lutris.Lutris"
        "org.flycast.Flycast"
        "com.usebottles.bottles"
        "net.davidotek.pupgui2"
        "org.libretro.RetroArch"
        "com.github.k4zmu2a.spacecadetpinball"
    ];
}
