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
     ./home_pkgs.nix
  ];
  home.stateVersion = "23.11";

  programs.bat.config = {
    theme = "Gruvbox";
  };

  dconf.settings = {
  	"org/gnome/shell" = {
		disable-user-extensions = false;
		enabled-extensions = [
			"gsconnect@andyholmes.github.io"
			"nightthemeswitcher@romainvigier.fr"
		];
	};
	"org/gnome/desktop/interface" = {
		text-scaling-factor = 1.25;		
	};
	"org/gnome/mutter" = {
		dynamic-workspaces = true;
		edge-tiling = true;
	};
	"org/gnome/desktop/peripherals/touchpad" = {
		tap-and-drag = false;
		tap-to-click = false;
		speed = 0.55;
	};
	"org/gnome/desktop/input-sources" = {
		xkb-options = [ "caps:escape_shifted_capslock" ];
	};
  };

  programs.neovim = {
  	defaultEditor = true;
  };

  programs.firefox = {
  	profiles.kyousuf = {
		extensions = with pkgs.input.firefox-addons; [
			ublock-origin
			sponsorblock
		];
	};
  };

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
