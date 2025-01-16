{config, lib, pkgs, inputs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
  ];

  programs.partition-manager.enable = true;
  programs.dconf.enable = true;

}
