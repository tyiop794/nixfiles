{ config, lib, pkgs, input, ... }:
{
  services.flatpak.packages = [
    "com.usebottles.bottles"
    "org.DolphinEmu.dolphin-emu"
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
    sm64ex
  ];

}
