# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{

  nixpkgs.overlays = [
    (final: prev: {
        brave = prev.brave.override {
            # vulkanSupport = true;
            # enableVideoAcceleration = true;
            commandLineArgs = "--ozone-platform=x11";
        };
    })
  ];
  nixpkgs.config.chromium.commandLineArgs = "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --ozone-platform=x11";

}

