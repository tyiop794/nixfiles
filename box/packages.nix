{ config, lib, pkgs, input, ... }:
{

  imports = [
    ./games.nix
  ];
  environment.systemPackages = with pkgs; [
    # davinci-resolve
    # nvtopPackages.nvidia
    kdePackages.plasma-browser-integration
    samba
    cifs-utils
    # dolphin-emu
    ntfs3g
    woeusb-ng
  ];

}
