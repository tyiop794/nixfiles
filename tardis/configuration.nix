{ config, lib, pkgs, inputs, ... }:

{
    imports =
        [
            ./hardware-configuration.nix
            ./desktop/configuration.nix
            ./services.nix
	    ./desktop/plasma.nix
            ./touchpad.nix
        ];
        
      # Use the systemd-boot EFI boot loader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.loader.efi.efiSysMountPoint = "/boot";

      # Indicate that our drive is encrypted
      boot.initrd.luks.devices = {
       root = {
         device = "/dev/nvme0n1p2";
         preLVM = true;
        };
      };
      networking.hostName = "tardis"; # Define your hostname.


}
