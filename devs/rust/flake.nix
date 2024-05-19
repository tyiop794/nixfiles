{
  description = "Flake with rust and cargo";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, rust-overlay, ... }: let 
  system = "x86_64-linux";
  in {
     devShells."${system}".default = let
       overlays = [ (import rust-overlay) ];
       pkgs = import nixpkgs {
         inherit system overlays;
       };
     in pkgs.mkShell {
       packages = with pkgs; [
          rust-bin.stable.latest.default
	  fish
	  rust-analyzer
       ];
       shellHook = "
       exec fish
       ";
  };
};
}
