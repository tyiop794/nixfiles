{ config, lib, pkgs, input, ... }:
{
  environment.systemPackages = with pkgs; [
    davinci-resolve
    nvtop
    kdePackages.plasma-browser-integration
    samba
    cifs-utils
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
