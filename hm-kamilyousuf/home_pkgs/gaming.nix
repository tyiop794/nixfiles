{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
     gamescope
    ];
    services.flatpak.packages = [
        "org.duckstation.DuckStation"
        "io.github.simple64.simple64"
        "net.pcsx2.PCSX2"
        "dev.ares.ares"
        "net.lutris.Lutris"
        "org.flycast.Flycast"
        "com.usebottles.bottles"
        "com.valvesoftware.Steam"
        "com.github.Matoking.protontricks"
        "net.davidotek.pupgui2"
        "runtime/org.freedesktop.Platform.VulkanLayer.gamescope/x86_64/24.08"
        "org.libretro.RetroArch"
        "org.DolphinEmu.dolphin-emu"
        "com.github.k4zmu2a.spacecadetpinball"
    ];
}
