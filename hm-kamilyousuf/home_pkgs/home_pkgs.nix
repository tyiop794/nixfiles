{config, pkgs, inputs, ...}:
{
  imports = [
    ./flatpaks.nix
    ./gaming.nix
    ./media.nix
    ./internet.nix
    ./graphics.nix
    ./communications.nix
    ./utilities.nix
  ];
}
