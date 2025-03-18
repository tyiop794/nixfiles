{
  description = "Home Manager configuration of kamilyousuf";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    firefox-addons = {
       url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
       inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    # flatpak_nixpkgs = {
    #     url = "github:NixOS/nixpkgs/7695a1e9a9789fa13684ffd87c02b6c9f9e99b96";
    # };
  };

  outputs = { self, nixpkgs, home-manager, firefox-addons, nix-flatpak, plasma-manager, ... }@inputs:
    let
      inherit (self) outputs; 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."kamilyousuf" = home-manager.lib.homeManagerConfiguration rec {
        inherit pkgs;

        extraSpecialArgs = { 
            inherit inputs outputs; 
            # flatpak_nixpkgs = import flatpak_nixpkgs {
            #     inherit system;
            # };
        };
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
            ./home.nix 
            nix-flatpak.homeManagerModules.nix-flatpak
            plasma-manager.homeManagerModules.plasma-manager
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
    };
}
