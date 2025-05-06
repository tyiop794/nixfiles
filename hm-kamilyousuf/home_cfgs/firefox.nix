{config, inputs, pkgs, ... }:
{
  programs.librewolf = {
  	enable = true;
  	profiles.default = {
		extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
			ublock-origin
			sponsorblock
			tridactyl
			darkreader
                        bitwarden
		];
	};
  };
}
