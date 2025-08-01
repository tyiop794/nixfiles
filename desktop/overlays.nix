# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  # nixpkgs.overlays = [
  #   (final: prev: {
  #     # until #369069 gets merged: https://nixpk.gs/pr-tracker.html?pr=369069
  #     gnome-extension-manager = prev.gnome-extension-manager.overrideAttrs (old: {
  #       src = prev.fetchFromGitHub {
  #         owner = "mjakeman";
  #         repo = "extension-manager";
  #         rev = "v0.6.0";
  #         hash = "sha256-AotIzFCx4k7XLdk+2eFyJgrG97KC1wChnSlpLdk90gE=";
  #       };
  #       patches = [];
  #       buildInputs = with prev; [
  #         blueprint-compiler
  #         gtk4
  #         json-glib
  #         libadwaita
  #         libsoup_3
  #         libbacktrace
  #         libxml2
  #       ];
  #     });
  #   })
  # ];

  nixpkgs.overlays = [
    (final: prev: {
        google-chrome = prev.google-chrome.override {
            # vulkanSupport = true;
            # enableVideoAcceleration = true;
            commandLineArgs = "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE,VaapiOnNvidiaGPUs,VaapiVideoEncoder,AcceleratedVideoEncoder --ozone-platform=x11";
        };
    })
    (final: prev: {
        brave = prev.brave.override {
            vulkanSupport = true;
            enableVideoAcceleration = true;
            commandLineArgs = "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE,VaapiOnNvidiaGPUs,VaapiVideoEncoder,AcceleratedVideoEncoder --ozone-platform=x11";
        };
    })
    (self: super: {
        mpv = super.mpv.override {
            scripts = [ self.mpvScripts.mpris ];
        };
    })
  ];
  nixpkgs.config.chromium.commandLineArgs = "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE,VaapiOnNvidiaGPUs,VaapiVideoEncoder,AcceleratedVideoEncoder --ozone-platform=x11";
  # nixpkgs.config.brave.commandLineArgs = "--enable-features=VaapiVideoDecoder,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE --ozone-platform=x11";

  # nixpkgs.config.brave = {
  #   enableVideoAcceleration = true;
  #   vulkanSupport = true;
  #   commandLineArgs = "--ozone-platform-hint=x11";
  # };
  
  nixpkgs.config.packageOverrides = pkgs: rec {
    wpa_supplicant = pkgs.wpa_supplicant.overrideAttrs (attrs: {
        patches = attrs.patches ++ [ ./eduroam.patch ];
    });
    # brave = pkgs.brave.overrideAttrs (attrs: {
    #     patches = attrs.patches ++ [ ./eduroam.patch ];
    # });
    google-chrome = pkgs.google-chrome.overrideAttrs (final: prev: {
        version = "138.0.7204.157";
        src = pkgs.fetchurl {
            url = "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${final.version}-1_amd64.deb";
            hash = "sha256-QmWevU4cYmUc6lUbFG4bQ1aKFuUyIUorJjMMF14bzZ4=";
        };
        # __intentionallyOverridingVersion = true;
    });
    # brave = pkgs.brave.overrideAttrs (final: prev: {
    #     version = "138.0.7204.157";
    #     src = pkgs.fetchurl {
    #         url = "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${final.version}-1_amd64.deb";
    #         hash = "sha256-QmWevU4cYmUc6lUbFG4bQ1aKFuUyIUorJjMMF14bzZ4=";
    #     };
    #     # __intentionallyOverridingVersion = true;
    # });
  };
}

