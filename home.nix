{ config, pkgs, ... }:

{
  home.username = "kamilyousuf";
  home.homeDirectory = "/home/kamilyousuf";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  imports = [
     ./start_pkgs.nix
  ];
  home.stateVersion = "23.11";

  programs.bat.config = {
    theme = "Gruvbox";
  };

  dconf.settings = {
	"org/gnome/desktop/interface" = {
		text-scaling-factor = 1.25;		
	};
	"org/gnome/mutter" = {
		dynamic-workspaces = true;
	};
	"org/gnome/desktop/peripherals/touchpad" = {
		tap-and-drap = false;
		tap-to-click = false;
	};
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
