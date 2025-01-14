{config, pkgs, inputs, ...}:
{
  imports = [
    ./flatpaks.nix
    ./gaming.nix
    ./media.nix
    ./internet.nix
    ./graphics.nix
    ./communication.nix
    ./utilities.nix
  ];
}
