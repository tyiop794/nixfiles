{
  description = "My personal NixOS setup";

  inputs = {
    # nixos-unstable repository
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # flatpak_nixpkgs = {
    #     url = "github:NixOS/nixpkgs/7695a1e9a9789fa13684ffd87c02b6c9f9e99b96";
    #     inputs.nixpkgs.follows = "nixpkgs";
    # };
    # nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    # nix-flatpak.url = "github:gmodena/nix-flatpak";
    # home-manager = {
    #    url = "github:nix-community/home-manager/master";
    #    inputs.nixpkgs.follows = "nixpkgs";
    # };
    firefox-addons = {
       url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
       url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    flatpak_nixpkgs = {
        url = "github:NixOS/nixpkgs/7695a1e9a9789fa13684ffd87c02b6c9f9e99b96";
    };
  };

  outputs = { self, nixpkgs, lix-module, home-manager, firefox-addons, flatpak_nixpkgs, ... }@inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    flatpakOverlay = final: prev: {
        flatpak = flatpak_nixpkgs.legacyPackages.x86_64-linux.flatpak;
    };
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {  nixosConfigurations.tardis = nixpkgs.lib.nixosSystem {
    	system = "x86_64-linux";
        nixpkgs.overlays = [ flatpakOverlay ];
        specialArgs = { 
            # inherit inputs outputs; 
            flatpak_nixpkgs = import flatpak_nixpkgs {
                inherit system;
            };
        };
	modules = [
            lix-module.nixosModules.default
            # nix-flatpak.nixosModules.nix-flatpak
	   ./virtualisation.nix
	   ./configuration.nix
           # ./firejail.nix
	];
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
