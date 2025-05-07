{ config, lib, pkgs, input, ... }:
{
  environment.systemPackages = with pkgs; [
    # davinci-resolve
    nvtopPackages.nvidia
    kdePackages.plasma-browser-integration
    samba
    cifs-utils
    dolphin-emu
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
}
