{config, lib, pkgs, inputs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # environment.systemPackages = with pkgs; [
  #   # partitionmanager
  # ];

  programs.partition-manager.enable = true;

}
