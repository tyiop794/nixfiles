# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.packageOverrides = pkgs: rec {
    wpa_supplicant = pkgs.wpa_supplicant.overrideAttrs (attrs: {
        patches = attrs.patches ++ [ ./eduroam.patch ];
    });
    # brave = pkgs.brave.overrideAttrs (attrs: {
    #     patches = attrs.patches ++ [ ./eduroam.patch ];
    # });
  };
}

