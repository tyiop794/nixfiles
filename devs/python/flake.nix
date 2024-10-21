{
  description = "Python Dev Environment with Custom Fish Config";

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

        # Write custom config.fish to a temporary file and set XDG_CONFIG_HOME to point to it
        shellHook = ''
          echo "Welcome to the Python development environment!"
          echo "Use 'direnv allow' to automatically load this environment."

          # Create a temporary directory for custom fish config
          export TMP_FISH_CONFIG=$(mktemp -d)

          # Create the custom config.fish file in the temp directory
          cat > $TMP_FISH_CONFIG/fish/config.fish << 'EOF'
          # Custom fish prompt
          function fish_prompt
              set_color cyan
              echo -n "(py-dev) "
              set_color normal
              echo -n (prompt_pwd)
              echo -n " > "
          end

          # Additional customizations go here
          set -g fish_greeting "Welcome to the Python dev environment!"
          EOF

          # Launch Fish with the custom config
          exec (${pkgs.fish}/bin/fish -C $TMP_FISH_CONFIG/fish/config.fish)
        '';
      };
    });
}
