{ config, lib, pkgs, inputs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./desktop/configuration.nix
            ./packages.nix
            ./nvidia.nix
            # ./packages-gnome.nix
        ];
        
      # Use the systemd-boot EFI boot loader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot";
      # boot.kernelPackages = pkgs.linuxPackages_latest;

      # Indicate that our drive is encrypted
      boot.initrd.luks.devices = {
       root = {
         device = "/dev/disk/by-uuid/ce379dd6-8437-4116-9451-84340db9a006";
         preLVM = true;
        };
      };
      networking.hostName = "box"; # Define your hostname.

}
