{ config, lib, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  

  # Enable zsh
  programs.zsh.enable = true;

  imports = [
    ./utilities.nix
    ./fonts.nix
  ];


}
