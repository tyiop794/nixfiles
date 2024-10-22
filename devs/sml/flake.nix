{
  description = "Standard ML (SML) environment for Nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell = pkgs.mkShell {
        name = "sml-dev-env";

        buildInputs = [
            pkgs.smlnj
            pkgs.mlton
        ];

        # Write custom config.fish to a temporary file and set XDG_CONFIG_HOME to point to it
        shellHook = ''
          export PS1="(sml-env : \w ) :> "
        '';
      };
    });
}
