{
  description = "Flake with latex";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: let 
  system = "x86_64-linux";
  in {
     devShells."${system}".default = let
       pkgs = import nixpkgs {
         inherit system;
       };
     in pkgs.mkShell {
       packages = with pkgs; [
          texlive.combined.scheme-full
       ];
       shellHook = "
       exec fish
       ";
  };
};
}
