{
  description = "My personal NixOS setup";

  inputs = {
    # nixos-unstable repository
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # flatpak_nixpkgs = {
    #     url = "github:NixOS/nixpkgs/7695a1e9a9789fa13684ffd87c02b6c9f9e99b96";
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };
    # nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    # home-manager = {
    #    url = "github:nix-community/home-manager/master";
    #    inputs.nixpkgs.follows = "nixpkgs";
    # };
    firefox-addons = {
       url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    lix = {
        url = "https://git.lix.systems/lix-project/lix/archive/main.tar.gz";
        flake = false;
    };
    lix-module = {
       url = "https://git.lix.systems/lix-project/nixos-module/archive/main.tar.gz";
       inputs.nixpkgs.follows = "nixpkgs";
       inputs.lix.follows = "lix";
    };
    lanzaboote = {
        url = "github:nix-community/lanzaboote/v0.4.2";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    # flatpak_nixpkgs = {
    #     url = "github:NixOS/nixpkgs/7695a1e9a9789fa13684ffd87c02b6c9f9e99b96";
    # };
  };

  outputs = { self, nixpkgs, lix-module, home-manager, firefox-addons, nix-flatpak, lanzaboote, ... }@inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    patches = [
        {
            url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/378184.diff";
            sha256 = "sha256-iM4o/e93tQFHVyyhBfMggWxVaxDXrqxDJ2E+CmBQMXA=";
        }
        {
            url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/425841.diff";
            sha256 = "sha256-tcfHUvAKNPefVYf4flETRuN946gmDeDDRZOZgYbNnsI=";
        }
    ];
    originPkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
    nixpkgs = originPkgs.applyPatches {
        name = "nixpkgs-patched";
        src = inputs.nixpkgs;
        patches = map originPkgs.fetchpatch patches;
    };

    nixosSystem = import (nixpkgs + "/nixos/lib/eval-config.nix");
    # nixosSystem = inputs.nixpkgs.lib.nixosSystem;
    # flatpakOverlay = final: prev: {
    #     flatpak = flatpak_nixpkgs.legacyPackages.x86_64-linux.flatpak;
    # };
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {  nixosConfigurations = { 
         tardis = nixosSystem rec {
            system = "x86_64-linux";
            # nixpkgs.overlays = [ flatpakOverlay ];
            specialArgs = { 
                inherit inputs outputs; 
                # flatpak_nixpkgs = import flatpak_nixpkgs {
                #     inherit system;
                # };
            };
            modules = [
                lix-module.nixosModules.default
                nix-flatpak.nixosModules.nix-flatpak
               ./tardis/configuration.nix
               lanzaboote.nixosModules.lanzaboote
               # ./firejail.nix
            ];
        };
         box = nixosSystem rec {
            system = "x86_64-linux";
            # nixpkgs.overlays = [ flatpakOverlay ];
            specialArgs = { 
                inherit inputs outputs; 
                # flatpak_nixpkgs = import flatpak_nixpkgs {
                #     inherit system;
                # };
            };
            modules = [
                lix-module.nixosModules.default
                nix-flatpak.nixosModules.nix-flatpak
               ./box/configuration.nix
               # ./firejail.nix
            ];
        };
        dingusrv =  nixpkgs.lib.nixosSystem rec {
            system = "x86_64-linux";
            # nixpkgs.overlays = [ flatpakOverlay ];
            specialArgs = { 
                inherit inputs outputs; 
                # flatpak_nixpkgs = import flatpak_nixpkgs {
                #     inherit system;
                # };
            };
            modules = [
                # lix-module.nixosModules.default
               ./dingusrv/configuration.nix
            ];
        };
    };
    /*
    homeConfigurations = {
	"kamilyousuf@tardis" = home-manager.lib.homeManagerConfiguration {
	    pkgs = nixpkgs.legacyPackages.x86_64-linux;
	    extraSpecialArgs = {inherit inputs outputs;};
	    modules = [
	    	./home.nix
	    ];
	};
    };
    */
    };

  }
