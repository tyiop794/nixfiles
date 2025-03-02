{ config, lib, pkgs, inputs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./desktop/configuration.nix
            ./packages.nix
            ./nvidia.nix
            ./samba.nix
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

      environment.etc.crypttab = {
        mode = "0600";
        text = ''
            # <volume-name> <encrypted-device> [key-file] [options]
            cryptstorage UUID=f648946a-9ee0-4377-99c8-f24abd99188f /root/mykeyfile.key
        ''
      };

}
