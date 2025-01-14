{config, lib, pkgs, inputs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Enable Steam
  nixpkgs.config.allowUnfree = true;
  programs = {
      gamescope = {
        enable = true;
        capSysNice = true;
      };
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        gamescopeSession.enable = true;
        protontricks = {
            enable = true;
        };
      };
  };
}
