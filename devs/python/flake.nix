{
  description = "Generic Python Development Environment";

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
        name = "python-dev-env";

        buildInputs = [
          pkgs.python3
          pkgs.python3Packages.pip
          pkgs.python3Packages.virtualenv
          pkgs.python3Packages.setuptools
          pkgs.python3Packages.wheel
        ];

        nativeBuildInputs = [
          pkgs.git
          pkgs.direnv
          pkgs.jq
        ];

        shellHook = ''
          echo "Welcome to the Python development environment!"
          echo "Use 'direnv allow' to automatically load this environment."

          # Set a custom fish prompt
          if status --is-interactive
            and [ $SHELL = *fish ];  # Check if we're in fish
            function fish_prompt
              set_color cyan
              echo -n "(py-dev) "
              set_color normal
              __fish_prompt_default  # Append the default Fish prompt
            end
          end
        '';
      };
    });
}

