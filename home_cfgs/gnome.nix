{ config, inputs, pkgs, home-manager, ... }:
{
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
}
