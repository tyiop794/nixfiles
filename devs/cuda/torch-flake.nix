{
  description = "Torch cuda flake using nix-community cachix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  # nixConfig = {
  #   extra-substituters = [ "https://nix-community.cachix.org" ];
  #   extra-trusted-public-keys = [
  #     "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
  #   ];
  # };

  outputs =
    { self, nixpkgs }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        config.cudaSupport = true;
      };
    in
    {
      devShell.x86_64-linux =
        with pkgs;
        mkShell {
          venvDir = "./.venv";
          buildInputs = [
            (pkgs.python3.withPackages (
              ps: with ps; [ torch ]
            ))
            pkgs.virtualenv
            pkgs.python3Packages.venvShellHook
          ];
          postVenvCreation = ''
            unset SOURCE_DATE_EPOCH
          '';
        };
    };
}
