{
  description = "My personal NixOS setup";

  inputs = {
    # nixos-unstable repository
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    home-manager = {
       url = "github:nix-community/home-manager/master";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
       url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    lix-module = {
       url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, lix-module, home-manager, firefox-addons, nix-flatpak, ... }@inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {  nixosConfigurations.tardis = nixpkgs.lib.nixosSystem {
    	system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
	modules = [
            lix-module.nixosModules.default
            nix-flatpak.nixosModules.nix-flatpak
	   ./configuration.nix
	   ./virtualisation.nix
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
