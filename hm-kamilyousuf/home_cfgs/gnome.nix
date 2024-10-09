{ config, inputs, pkgs, home-manager, lib, ... }:
{
  # Setup GNOME shell extensions
  home.packages = with pkgs.gnomeExtensions; [
     night-theme-switcher
     gsconnect
     blur-my-shell
     (pkgs.callPackage ../../custom_pkgs/rounded-window-corners-reborn.nix {})
  ];

  dconf.settings = {
  	"org/gnome/shell" = {
		disable-user-extensions = false;
		enabled-extensions = [
			"gsconnect@andyholmes.github.io"
			"nightthemeswitcher@romainvigier.fr"
                        "blur-my-shell@aunetx"
                        "rounded-window-corners@fxgn"
		];
	};
	"org/gnome/desktop/interface" = {
		text-scaling-factor = 1.25;		
                gtk-theme = "Adwaita-dark";
	};
	"org/gnome/mutter" = {
		dynamic-workspaces = true;
		edge-tiling = true;
	};
        "org/gnome/shell/extensions/nightthemeswitcher/commands" = {
                sunrise = "gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita\"";
                sunset = "gsettings set org.gnome.desktop.interface gtk-theme \"Adwaita-dark\"";
        };
	"org/gnome/desktop/peripherals/touchpad" = {
		tap-and-drag = false;
		tap-to-click = false;
		speed = 0.55;
	};
	"org/gnome/desktop/input-sources" = {
		xkb-options = [ "caps:escape_shifted_capslock" ];
	};
        "org/gnome/settings-daemon/plugins/color" = {
                night-light-schedule-automatic = true;
                night-light-temperature = lib.hm.gvariant.mkUint32 3255;
        };
  };
}
