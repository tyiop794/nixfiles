{config, pkgs, inputs, ...}:
{
  imports = [
    ./flatpaks.nix
    ./gaming.nix
    ./media.nix
    ./internet.nix
    ./production.nix
    ./communication.nix
    ./utilities.nix
  ];
}
