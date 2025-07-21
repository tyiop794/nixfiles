{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  

  imports = [
    ./utilities.nix
    ./fonts.nix
    ./communication.nix
    ./internet.nix
    ./hm-former.nix
    ./neovim.nix
  ];


}
