{ config, lib, pkgs, input, ... }:
{
  services.flatpak.packages = [
    "com.usebottles.bottles"
    "org.DolphinEmu.dolphin-emu"
    "com.github.k4zmu2a.spacecadetpinball"
    "dev.ares.ares"
    "net.davidotek.pupgui2"
    "net.pcsx2.PCSX2"
    "org.duckstation.DuckStation"
  ];

  programs = {
      gamescope = {
        enable = true;
        capSysNice = true;
      };
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = false;
        protontricks = {
            enable = true;
        };
      };
  };

  environment.systemPackages = with pkgs; [
    lutris
    wineWowPackages.unstable
    winetricks
    heroic
    # sm64ex
  ];

}
