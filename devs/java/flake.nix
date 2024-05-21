{
  description = "Flake for Java development";

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
         openjdk
         idea-community
       ];
       shellHook = "
       exec fish
       ";
  };
};
}
