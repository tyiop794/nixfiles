{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
     gamescope
     dolphin-emu
    ];
    services.flatpak.packages = [
        "org.duckstation.DuckStation"
        "io.github.simple64.simple64"
        "net.pcsx2.PCSX2"
        "dev.ares.ares"
        "net.lutris.Lutris"
        "org.flycast.Flycast"
        "com.usebottles.bottles"
        "net.davidotek.pupgui2"
        "org.libretro.RetroArch"
        "org.DolphinEmu.dolphin-emu"
        "com.github.k4zmu2a.spacecadetpinball"
    ];
}
