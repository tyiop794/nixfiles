{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  

  imports = [
    ./utilities.nix
    ./fonts.nix
    ./communication.nix
    # ./neovim.nix
  ];


}
