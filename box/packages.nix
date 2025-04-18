{config, lib, pkgs, inputs, ... }:
{
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  programs.kdeconnect.enable = true;
  environment.systemPackages = with pkgs; [
    davinci-resolve
    nvtop
    kdePackages.plasma-browser-integration
    samba
    cifs-utils
  ];

  programs.partition-manager.enable = true;
  programs.dconf.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    discover
  ];
}
