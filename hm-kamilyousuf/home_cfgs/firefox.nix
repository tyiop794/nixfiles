{config, inputs, pkgs, ... }:
{
  programs.firefox = {
  	enable = false;
  	profiles.default = {
		extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
			ublock-origin
			sponsorblock
			tridactyl
			darkreader
                        bitwarden
		];
	};
  };
}
