{ config, lib, pkgs, ... }:

{
    hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
            nvidia-vaapi-driver
        ];
    };

    services.xserver.videoDrivers = ["nvidia"];

    environment.systemPackages = with pkgs; [
        nvidia-container-toolkit
    ];

    boot.kernelParams = ["nvidia.NVreg_PreserveVideoMemoryAllocations=1"];
    hardware.nvidia = {
        modesetting.enable = true;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    hardware.nvidia-container-toolkit.enable = true;

  nix.settings = {
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
  };
}
