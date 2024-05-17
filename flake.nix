{
  description = "My personal NixOS setup";

  inputs = {
    # nixos-unstable repository
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
       url = "github:nix-community/home-manager/master";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
       url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
       inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, firefox-addons, ... }@inputs: let
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
	   ./configuration.nix
	   ./virtualisation.nix
	   home-manager.nixosModules.home-manager
	   {
	       home-manager.useGlobalPkgs = true;
	       home-manager.useUserPackages = true;

	       home-manager.users.kamilyousuf = import ./home.nix;
	   }
	];
    };

    homeConfigurations = {
	"kamilyousuf@tardis" = home-manager.lib.homeManagerConfiguration {
	    pkgs = nixpkgs.legacyPackages.x86_64-linux;
	    extraSpecialArgs = {inherit inputs outputs;};
	    modules = [
	    	./home.nix
	    ];
	};
    };
    };

  }
